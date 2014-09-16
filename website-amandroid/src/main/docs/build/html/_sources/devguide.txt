Development Guide
##################


Now we consider that you are interested in developing a new plugin on top of the Amandroid framework to carry out your specific analysis task on an Android app.
This document here is to provide you with a primer: it discusses the main points (with examples) that you need to know in the development process.

Amandroid Architecture
=========================

Amandroid provides a data flow analysis framework. It makes a variety of functionalities (i.e. APIs) available to the developers
to help them build their own analysis tool. Examples of such functionalities are: (i) Collect necessary information from the input apk file, (ii) Build the Inter-procedural Data Flow Graph (IDFG), and (iii) Build the Data Dependency Graph (DDG).  

Collect Information from APK
=============================
Information collection is necessary for multiple reasons. For instance, it helps us discover certain callback methods (e.g., onClick of a Button). 
Moreover, it also helps in identifying special items (e.g. password, Single Sign On options, etc.) present in the apk resource. 
Amandroid provides multiple APIs for specialized information collection: (i) Manifest parser, (ii) Layout parser, (iii) ARSC parser, and others. 

Build IDFG
=================================
IDFG basically consists of interprocedural control flow graph (ICFG) and the reachable facts of each statement (i.e. bytecode instruction). 
IDFG also incorporates calling context information upto K. 
Your plugin can use IDFG build API and then can access the reachable facts at an arbitrary statement. 
For instance, for a network I/O statement in the app your plugin can query (to the IDFG) for the possible URL values, in case that is important for your analysis.    

Build DDG
=====================
DDG basically represents which statement of IDFG depends on which other statements. 
This result is useful in multiple analyses. For instance, this result is fundamental for doing taint analysis.

How to Design a Plugin
======================

It is easy to develop a new plugin tool on top of Amandroid provided your new analysis is related with data flow. 
Basically, you can invoke the aforementioned Amandroid functionalities (i.e., APIs) to have the building blocks ready for you. 
The new plugin only needs to use these building blocks in implementing your special analysis logic. 
We expect that a typical plugin can be written in a few lines of code (hundreds of LOC) only, while the Amandroid framework codebase is huge (consisting of tens of thousands of LOC).    

We see two types of data flow analyses you might be interested in. Some details with examples are as follows. Hopefully, they will help you in designing your new plugin.

(i) Analyses which require DDG results
***************************************
Examples of this type of analysis are (a) "data leak detection": You need to discover a taint path from a source to a sink.

And (b) "intent injection detection": You need to find a taint path from an incoming intent to a sink. 

To perform this type of analysis you would need to use CollectInformation APIs, BuildIDFG APIs, and BuildDDG APIs as discussed above. 
Another item you would probably need, which is a Source-Sink manager. 

The role of the Source-Sink manager is to identify the source points and sink points in the app relavent to your problem.
In a "data leak detection" analysis, any point through which a sensitive information can enter into the app (e.g. the "password" field in an app layout) 
is considered as a "source" while any information exit point (e.g. a network write operation) is a sink. 
Amandroid includes a basic Source-Sink manager. You can customize it according to your needs by overriding certain methods. 
As an example, for the "intent injection detection" plugin, the "source" is any incoming "intent" to a public Activity, 
while the "sink" can be the same as that in "data leak detection" plugin.    

(ii) Analyses which do not require DDG results
***********************************************
An example of this type of analysis is "crypto-API misuse detection". The misuse is detected via inspecting the parameter values of such an API, and matching them with the set of vulnerable signatures. To perform this type of analysis you would need to use CollectInformation APIs, and BuildIDFG APIs. 
Note that you will not need a Source-Sink manager in this case. 

Finally, one tip in reducing the average analysis time. In reality, it is very useful if you can quickly figure out whether 
an app is interesting in the context of your analysis. That can allow you to discard an app after a light analysis 
and to run heavy analysis only if the app is interesting. Amandroid provides a hook with the AppInfoCollector, 
where you can specify a discard policy (i.e., specify what is not "interesting" to you). 
As an example, if you are designing a password leak detection plugin, it is natural to discard an app 
from which AppInfoCollector was not able to discover any "password" field in one of the app layouts.  
