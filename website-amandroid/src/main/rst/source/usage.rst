Amandroid
==============

Amandroid is a sub-tool in the parent tool Sireum (http://www.sireum.org/). That means Amandroid is available as an option of Sireum. Note that sireum has other options such as bakar (a symbolic execution option) which are not related to this Amandroid project.

Included in this AmandroidCli package (which can be downloaded from http://people.cis.ksu.edu/~fgwei):
A.The files related with the Sireum tool:
	1. sireum executable
	2. sireum.jar
B.The folders:
	1. apps: This contains applications installed e.g., Amandroid, and other sub-tools.
	2. lib: all library jars for sireum.
	3. licenses
	4. resources: the files Amandroid needs. 
		a) android library IR (Intermediate representation) files (e.g. x.pilar). 
		b) Some example apks. (Includes 11 apks from extended DroidBench.) 
		c) a source-sink list  (TaintSourcesAndSinks.txt for taint analysis) and sink lists (for password tracking and intent injection detection). You can add/edit your own if you wish.
		d) AndroidLibSideEffectResult.xml.zip containing the field read\write summary of library APIs, which helps in increasing the precision of IDFG/DDG building.

-------------------------
Input
-------------------------
A. APK file of an Android app.
B. For some analysis additional files (like 4.c and 4.d) is necessary. See the examples later.

-------------------------
Output
-------------------------
Amandroid has multiple modes, e.g. decompile, taintAnalysis. The output depends on the chosen mode:
A. decompile mode produces an IR form of the APK.
B. taintAnalysis mode produces the taint path from source to sink.
C. intentInjection mode detects the intent injection possibilities.
D. passwordTracking mode tracks password flow within Android app.
E. cryptoMisuse mode.
See the examples later.

-------------------------
Design
-------------------------
Amandroid has several phases,
A. Dex to IR (our IR is called pilar)
B. APK analysis (Manifest and resource files are processed to generate the environment for each component.)
C. Inter-component data flow analysis which produces a) Inter-procedural Control Flow Graph b) A map from each instruction to the fact set.
D. Inter-procedural Data Dependence analysis.
E. Several kinds of analyses can be performed:
	a). Crypto misuse Analysis.
	b). Intent injection detection.
	c). Password tracking.
	d). Taint analysis.

-------------------------
Limitation
-------------------------
A. The execution time depends on the APP and processing power, if you are experiencing delay try simpler apps.
B. Included IR of android lib only supports Android version 4.1. This can be extended. Most likely, common apps in other versions will also work. Our conservative model for APIs will kick in if necessary.

----------------------
Setup environment
----------------------
Let us assume that you saved the Amandroid (http://people.cis.ksu.edu/~fgwei) material at /path/AmandroidCli .

Before using Amandroid, you need to setup environment variable:

A. SIREUM_HOME: points to Sireum's main directory. e.g. export SIREUM_HOME=/path/AmandroidCli
B. export SCALA_HOME=$SIREUM_HOME/apps/platform/scala
C. export SCALA_BIN=$SCALA_HOME/bin/scala
D. export SIREUM_UPDATE=http://update.sireum.org/dev/latest
E. export JAVA_HOME=$SIREUM_HOME/apps/platform/java
F. ANDROID_LIB_DIR: points to the library-pilar-file's container directory. e.g. export ANDROID_LIB_DIR=$SIREUM_HOME/resources/AndroidLib/4.1

----------------------
Command Line Arguments
----------------------
1. To know the available modes of analysis do the following:
./sireum x amandroid

2. To run on one mode do the following:

a. ./sireum x amandroid decompile -t APK /path/input.apk /output-path
b. ./sireum x amandroid taintAnalysis -t APK /path/xxx.apk /path/SourceAndSink.txt /output-path
c. …

Get the results in the /output-path .

3. To know more options do the following:

./sireum x amandroid intentInjection

Usage:
  sireum x amandroid intentInjection [options] <Source file> <Sink list file> 

where the available options are:

-h | --help

General Options
  -m | --memory Max memory (GB). [Default: 2]
  -t | --type   The type of the file you want to analyze. [Default: APK,
                Choices: (DIR, APK)]   

Analysis Options
  -k   | --k-context   Context length [Default: 1]
  -ls  | --libSideEffect 
                       Lib side effect summary path [Default: ""]
  -ni  | --no-icc      Does not tracking flows via icc 
  -ns  | --nostatic    Does not handle static initializer 
  -o   | --outdir      Output directory path [Default: "."]
  -par | --parallel    Parallel 
  -t   | --timeout     Timeout (minute) [Default: 10]

(
Note that option [-ni, -ns, -par] is special:
when you set such option you need to use something like: -ni true,
and if you want false, you don’t need to specify such option.
)
