Development Guide
##################


Now we consider that you are interested in developing a new plugin on top of the Amandroid framework, which will carry out your specific analysis task on an Android app.
This document here is to provide you with a primer - it discusses the main points (with example plugins) 
that you need to know in the development process. The code snippets shown here are in Scala, and we remind you that the whole Amandroid is written in Scala. 

The example plugins cited here include 

* ``Password leakage detection``
* ``Intent injection detection``
* ``Crypto-API misuse detection``

and a few others, whose code is available in the Amandroid codebase. 
We suggest you to take a look into the code of these plugins before starting to write your plugin.
We expect that a typical plugin can be written in a few lines of code (hundreds of LOC) only, while the Amandroid framework codebase is much bigger 
(consisting of tens of thousands of LOC).    

An Overview
=========================

Amandroid makes a variety of functionalities (i.e. APIs) available to the developers
to help them build their own analysis tool. Examples of such functionalities are: (i) Collect necessary information from the input apk file, 
(ii) Build the Inter-procedural Data Flow Graph (IDFG), (iii) Build the Data Dependency Graph (DDG), and (iv) Run taint analysis.


However, we observe that in designing a typical plugin we can make you avoid directly using most of the above APIs.
So, to make the effort requirement less on your side, we have put a wrapper (called ``AmandroidSocket``) on the core functionalities of Amandroid. 
We hope that in most cases accessing ``AmandroidSocket`` (available in package ``org.sireum.amandroid.security``) should be enough for completing the design of your plugin. 
Nevertheless, if your analysis demands so, you can directly use the above APIs without the help of ``AmandroidSocket``.  


Let us first discuss how to invoke the APIs; then, we present how to implement a typical plugin using ``AmandroidSocket``.

AppInfoCollector: Collect Information from APK
===============================================
Information collection is necessary for multiple reasons. 
For instance, analyzing the Manifest file helps us in identifying the list of components, intent filters, list of permissions, and so on.
Moreover, parsing Layout files helps us discover certain callback methods (e.g., onClick of a Button). 
Specific to your analysis, you may be
also interested to discover a few special items (e.g. password, Single Sign On options, etc.) present in the apk resource. 

Amandroid provides a basic information collector object called ``AppInfoCollector`` 
(in package ``org.sireum.amandroid.appInfo``), which you may also customize (i.e. ``extend``) if necessary. 
Via ``AppInfoCollector`` you can invoke multiple APIs to get a handle (i.e. parser) for specialized information collection: 
(i) Manifest parser, (ii) Layout parser, (iii) ARSC parser, and others. 

Below are a few examples of invoking these APIs and some of their usage.

.. code-block:: scala

	val apkFileUri = FileUtil.toUri(path-to-the-apk-file) // FileUtil is in org.sireum.util package; toUri(pathString) = "file://" + pathString
	val mfp = AppInfoCollector.analyzeManifest(apkFileUri) // mfp is a Manifest file parser
	val afp = AppInfoCollector.analyzeARSC(apkFileUri) // afp is an ARSC file parser
	val lfp = AppInfoCollector.analyzeLayouts(apkFileUri, mfp) // lfp is a layout files parser
	val ra = AppInfoCollector.reachabilityAnalysis(mfp) // a basic reachability analyzer that is used below
	val callbackMethods = AppInfoCollector.analyzeCallback(afp, lfp, ra) // the set of callback methods discovered
	val appPackageName = mfp.getPackageName // the full name of the package
	val componentInfos = mfp.getComponentInfos // the list of components in the app and their basic information
	val uses_permissions = mfp.getPermissions // the list of permissions used by the app
	val intentFdb = mfp.getIntentDB // this has the collection of intent filters specification for each component
	val layoutControls = lfp.getUserControls // the list of layout controls

Build IDFG
=====================
IDFG basically consists of interprocedural control flow graph (ICFG) and the reachable facts of each statement (i.e. bytecode instruction). 
IDFG also incorporates `calling context` upto length K. 

Before we discuss how to use these APIs or ``AmandroidSocket``, let us first mention how to configure the generel settings 
(e.g., ``calling context length K``) of the analysis platform, 
i.e., how to set the basic configuration parameters for the IDFG analysis (also called ``AndroidReachingFactsAnalysis``).


The configuration parameters are set via acessing ``AndroidReachingFactsAnalysisConfig`` object (in package ``org.sireum.amandroid.alir.reachingFactsAnalysis``). 
You can choose values according to your needs. One example follows.

.. code-block:: scala

	AndroidReachingFactsAnalysisConfig.k_context = 1 // calling context length 
	AndroidReachingFactsAnalysisConfig.resolve_icc = true // connect the ICC source component with destination(s)
	AndroidReachingFactsAnalysisConfig.resolve_static_init = false // track the facts of the global/static variables too 
	AndroidReachingFactsAnalysisConfig.timerOpt = Some(new Timer(5)) // per-component analysis will time out after 5 mins

You can invoke the IDFG building API as follows (where ``AndroidReachingFactsAnalysis`` is available in package ``org.sireum.amandroid.alir.reachingFactsAnalysis``): 

.. code-block:: scala

	var entryPoints = Center.getEntryPoints(AndroidConstants.MAINCOMP_ENV) // AppInfoCollector has stored the entry points (e.g. public components) in the Center
	entryPoints.foreach{
	   ep =>
	    {
	      val (icfg, irfaResult) = AndroidReachingFactsAnalysis(ep, initialfacts, new ClassLoadManager) // ep represents an entry point
	                        //icfg is the interprocedural control flow graph while irfaResult contains the reachable facts for each statement.
	      AppCenter.addInterproceduralReachingFactsAnalysisResult(ep.getDeclaringRecord, icfg, irfaResult) // storing results in the AppCenter
	    }
	}
You can use the above API to build the IDFG, and then you can access the reachable facts at an arbitrary statement. 
For instance, for a network I/O statement in the app your plugin can query (to the IDFG) for the used ``urls``, in case that is important for your analysis.    

To give a concrete example, let us refer to the ``crypto-API misuse detection`` plugin. The code snippet is as follows. 
``CryptographicMisuse`` checks the reachable facts at a crypto-API statement to detect the misuse. 
Basically, if a parameter of the API is seen to have miscofigured values, we flag a misuse.

.. code-block:: scala

	val idfgs = AppCenter.getInterproceduralReachingFactsAnalysisResults // Note that for each entry point component there is one IDFG
	idfgs.foreach{
	   case (ep, (icfg, irfaResult)) =>
	       CryptographicMisuse(new InterProceduralDataFlowGraph(icfg, irfaResult)) // irfaResult i.e. reachable facts are queried here
	}


Build DDG
========================
DDG basically represents which statement of the IDFG depends on which other statements. 
There is a well-defined mapping between the nodeset of the ICFG and that of DDG.  
You can invoke the DDG building API as follows. 

.. code-block:: scala

	val iddResult = InterproceduralDataDependenceAnalysis(icfg, irfaResult)
	AppCenter.addInterproceduralDataDependenceAnalysisResult(ep.getDeclaringRecord, iddResult) // storing DDG where ep is an entry point component

This result is useful in multiple analyses. For instance, this result is fundamental for doing taint analysis.


Run Taint Analysis
========================
Given the DDG and a set of interesting (source and sink) statements, this API can find whether there exists a taint path in the app code between a source and a sink.
As an example, you can use the ``DefaultAndroidSourceAndSinkManager`` (in package ``org.sireum.amandroid.alir.taintAnalysis``) 
which takes a source-sink file-path as an input. An example source-sink file-path is included as a field in ``AndroidGlobalConfig`` (in package ``org.sireum.amandroid``). 

You can invoke the taint analysis API as follows: 

.. code-block:: scala

	val ssm = new DefaultAndroidSourceAndSinkManager(appPackageName, layoutControls, callbackMethods, AndroidGlobalConfig.SourceAndSinkFilePath) 
	                             // The source-sink file includes a list of annotated source and sink APIs
	val tar = AndroidDataDependentTaintAnalysis(iddResult, irfaResult, ssm) // ssm is a source-sink manager, which determines the sources and sinks in the app 
	AppCenter.addTaintAnalysisResult(ep.getDeclaringRecord, tar) // storing taint results

This API can be useful in multiple analyses. As an example, it is used in the ``password leak detection``, ``intent injection detection``, etc.

Below is a code snippet to show how to retrieve and use the taint results.

.. code-block:: scala

	val taintResult = AppCenter.getTaintAnalysisResult(ep) // The type ``TaintAnalysisResult`` is declared in package org.sireum.jawa.alir.taintAnalysis
	val taintPaths = taintResult.getTaintedPaths
	taintPaths.foreach{
	   taintPath =>
	         val pathString : ArrayList[String] = new ArrayList[String]
	         taintPath.getPath.foreach(f=>pathString.add(f.source + " -> " + f.target))
			 ...  // here pathString has a path
	}

How to Design a Plugin
========================

It is easy to develop a new plugin tool on top of Amandroid provided your new analysis is based on data flow. 
Basically, either you can use ``AmandroidSocket`` wrapper (available in package ``org.sireum.amandroid.security``) 
or you can directly invoke the Amandroid APIs to have the building blocks ready for you. 
The new plugin only needs to use these building blocks in implementing your special analysis logic. 

We hope that in most cases accessing ``AmandroidSocket`` should be enough for completing the design of your plugin.
You may start the socket as follows.

.. code-block:: scala

	val socket = new AmandroidSocket
	socket.preProcess // this loads the android library's class hierarchy and the android library's API side-effects summary

In your plugin code, you only need to provide necessary inputs to ``AmandroidSocket``, and then that will run the analysis for you. 
In total, ``AmandroidSocket`` demands at most two things (objects) from your side: 
(a) an ``AppInfoCollector`` (available in package ``org.sireum.amandroid.appInfo``), and  
(b) an optional ``AmandroidSocketListener`` (available in package ``org.sireum.amandroid.security``).   

You can customize the ``AppInfoCollector`` for your specific analysis requirement. 
As an example, for our ``password leakage detection`` plugin, we customized the ``AppInfoCollector`` to build ``SensitiveViewCollector`` (in package ``org.sireum.amandroid.security.password``)
that has additional capability of determining which set of components hold a ``password`` containing screen. 
If you do not need a special information collector, you may just use the default ``AppInfoCollector`` given in the codebase (in package ``in package org.sireum.amandroid.appInfo``). 

We connect the ``AppInfoCollector`` with the socket in the following way.

.. code-block:: scala

	val app_info = new SensitiveViewCollector(apkFileUri) // creating a special AppInfoCollector
	socket.loadApk(apkFileUri, outputPath, ThirdPartyLibraryDetector, app_info) // outputPath will store the results, such as Pilar tranformation of the bytecode
                        

The ``ThirdPartyLibraryDetector`` object (in package ``org.sireum.amandroid.util``) detects which code portion of the app is from the wellknown third parties (such as ``apache``) 
so that you can ignore the analysis of that code portion (as if they are part of Android library) if you wish so to reduce the analysis time. Nevertheless, 
if you do want to analyze a third party library, then just do not include that name in the ignore-list of the ``ThirdPartyLibraryDetector``. 
The package ``org.sireum.jawa`` includes a ``DefaultThirdPartyLibraryDetector`` that does not ignore any third party library, i.e. makes us analyze all of them.

You may also plug an ``AmandroidSocketListener`` (ref. ``org.sireum.amandroid.security`` package) to the socket. This listener gives you a chance to customize the socket operations according to your needs. 
If you do not provide any listener then the socket will take a default policy. The listener has a set of methods which you would like to implement. 
The basic job of some of these methods are as follows: 

* ``onPreAnalysis``: Do what you want before the analysis starts. 
* ``entryPointFilter``: Filter out app components which are not interesting in your special analysis. 
* ``onAnalysisSuccess``: Check in the ``AppCenter`` what results you got and store them as you want.  

Below is an example of how we create an ``AmandroidSocketListener`` for ``password leakage detection`` plugin, and connect it to the ``AmandroidSocket``.

.. code-block:: scala

	val listener = new PasswordTrackingListener(apkFileUri, app_info) // creating a special AmandroidSocketListener
	socket.plugListener(listener)

We envision two types of data flow analyses you might be interested in. Some details with examples follow. Hopefully, they will help you in designing your new plugin.

Analyses which require DDG results
***************************************
Examples of this type of analysis are (a) ``data leak detection``: You need to discover a taint path from a source to a sink.
And (b) ``intent injection detection``: You need to find a taint path from an incoming intent to a sink. 

This type of analyses require a source-sink manager while the role of the source-sink manager is to identify the source points and sink points in the app relavent to your problem.
In a ``data leak detection`` analysis, any point through which a sensitive information can enter into the app (e.g. the ``password`` field in an app layout) 
is considered as a ``source`` while any information exit point (e.g. a network write operation) is a sink. 
Amandroid includes a basic manager called ``DefaultAndroidSourceAndSinkManager`` (in package ``org.sireum.amandroid.alir.taintAnalysis``). 
You can customize it according to your needs by overriding certain methods. 
As an example, for the ``intent injection detection`` plugin, we implemented ``IntentInjectionSourceAndSinkManager`` (available in package ``org.sireum.amandroid.security.dataInjection``), 
where the ``source`` is any incoming ``intent`` to a public ``Activity``, 
while the ``sink`` can be the same as that in ``data leak detection`` plugin.    

Below is an example of how we create a source-sink manager for the ``password leakage detection`` plugin.

.. code-block:: scala

	val ssm = new PasswordSourceAndSinkManager(app_info., ..., AndroidGlobalConfig.PasswordSinkFilePath) // PasswordSinkFilePath is a file containing a list of sinks

Now you are ready to run the analysis via the socket after giving it the newly created source-sink manager. 
Below is an example of how we do it for ``password leakage detection`` plugin with certain flags as we wish.

.. code-block:: scala

	socket.runWithDDA(ssm, false, true) // The second param indicates whether to process only public components while the third param is to on/off parallel processing

For the sake of concreteness, let us now present a more complete code snippet from an example plugin. Below is an excerpt of the ``main`` method of the ``password leakage detection`` plugin.
Note that this contains many of the aforementioned pieces of code.


.. code-block:: scala

	def main(args: Array[String]): Unit = {
	   if(args.size != 2){
	        System.err.print("Usage: source_path output_path")
	        return
	   }
	   MessageCenter.msglevel = MessageCenter.MSG_LEVEL.CRITICAL // setting the status message level e.g. verbose, normal, critical, etc.
	
	   AndroidReachingFactsAnalysisConfig.k_context = 1
	   AndroidReachingFactsAnalysisConfig.resolve_icc = true
	   AndroidReachingFactsAnalysisConfig.resolve_static_init = false
	   AndroidReachingFactsAnalysisConfig.timerOpt = Some(new Timer(5))
			    
	   val socket = new AmandroidSocket
	   socket.preProcess
					    
	   val sourcePath = args(0)
	   val outputPath = args(1)
	   val files = FileUtil.listFiles(FileUtil.toUri(sourcePath), ".apk", true).toSet
	   files.foreach{ // for each apk file do the analysis
	      file =>
	          msg_critical(TITLE, "####" + file + "#####") // printing messages
	          val app_info = new SensitiveViewCollector(file)
	          socket.loadApk(file, outputPath, AndroidLibraryAPISummary, app_info)
	          ...
	          val listener = new PasswordTrackingListener(file, app_info)
	          socket.plugListener(listener) // make the codebase consistent
	          val ssm = new PasswordSourceAndSinkManager(app_info.getPackageName, app_info.getLayoutControls, app_info.getCallbackMethods, AndroidGlobalConfig.PasswordSinkFilePath)
	          socket.runWithDDA(ssm, false, true) // make the codebase consistent
	   }
	}

At the end of the analysis, you can collect the results from the ``AppCenter``. Note that this can be done in many ways from multiple locations. 
As one possible way, you can implement the ``onAnalysisSuccess`` method of the ``AmandroidSocketListener`` to serve this purpose. 
Below is such an example from the ``intent injection detection`` plugin.

.. code-block:: scala

	def onAnalysisSuccess : Unit = {
	    if(AppCenter.getTaintAnalysisResults.exists(...)){
	       IntentInjectionCounter.havePath += 1 // counting the number of taint paths
	    }
	val appData = DataCollector.collect // collect all relevant data from the AppCenter
	... // report or store your analysis results as you want
	}

Analyses which do not require DDG results
***********************************************
An example of this type of analysis is "crypto-API misuse detection". 
The misuse is detected via inspecting the parameter values of such an API, 
and matching them with the known set of vulnerable signatures. To perform this type of analysis, 
you can again use ``AmandroidSocket``. However, this time you will not need a source-sink manager. 

For the sake of concreteness, let us refer to a concrete plugin. Below is an excerpt of the ``main`` method of the ``crypto-API misuse detection`` plugin. 
This contains some of aforementioned pieces of code. One notable difference is of using ``socket.runWithoutDDA`` instead of ``socket.runWithDDA``.
Unlike the previous example, here the specific analysis (detecting misuse of a crypto-API) is done after we execute the socket (i.e. ``socket.runWithoutDDA``). 
Another difference is here we collect the analysis results inside the ``main`` method instead of ``onAnalysisSuccess`` method of the ``AmandroidSocketListener``.

.. code-block:: scala

	def main(args: Array[String]): Unit = {
	   if(args.size != 2){
	      System.err.print("Usage: source_path output_path")
	      return
	   }
	   MessageCenter.msglevel = MessageCenter.MSG_LEVEL.CRITICAL // setting the status message level e.g. verbose, normal, critical, etc.
	
	   AndroidReachingFactsAnalysisConfig.k_context = 1
	   AndroidReachingFactsAnalysisConfig.resolve_icc = true
	   AndroidReachingFactsAnalysisConfig.resolve_static_init = false
	   AndroidReachingFactsAnalysisConfig.timerOpt = Some(new Timer(5))
			    
	   val socket = new AmandroidSocket
	   socket.preProcess
					    
	   val sourcePath = args(0)
	   val outputPath = args(1)
	   val files = FileUtil.listFiles(FileUtil.toUri(sourcePath), ".apk", true).toSet
	   files.foreach{ // for each apk file do the analysis
	       file =>
	           msg_critical(TITLE, "####" + file + "#####") // printing messages
	           val app_info = new InterestingApiCollector(file)
	           socket.loadApk(file, outputPath, AndroidLibraryAPISummary, app_info)
	           val listener = new CryptoMisuseListener // we have to make this line consistent with the codebase
	           socket.plugListener(listener) // we have to make this line consistent with the codebase
	           socket.runWithoutDDA(false, true) // The first param indicates whether to process only public components while the second param is to on/off parallel processing
				                           // we have to make this line consistent with the codebase
	           val icfgs = AppCenter.getInterproceduralReachingFactsAnalysisResults
	           icfgs.foreach{
	              case (rec, (icfg, irfaResult)) =>
	                  CryptographicMisuse(new InterProceduralDataFlowGraph(icfg, irfaResult)) // here we check the misuse of a crypto-API and collect results
	           }
	    }
	}

.. note:: Finally, one tip in reducing the average analysis time. In reality, it is very useful if you can quickly figure out whether 
	an app is interesting in the context of your analysis. That can allow you to discard an app after a light analysis 
	and to run heavy analysis only if the app is interesting. As we discussed before, via AmandroidSocketListener 
	you can specify a discard policy (i.e., specify what is not *interesting* to you). 
	As an example, if you are designing a password leak detection plugin, it is natural to discard an app 
	from which AppInfoCollector was not able to discover any ``password`` field in one of the app layouts.  
