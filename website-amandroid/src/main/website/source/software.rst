Software
########

----------------------

Links
*****

.. toctree::
	:maxdepth: 1

* `Sireum <http://www.sireum.org/>`__
   
* `Repositories <http://github.com/sireum>`__
   

------------------------


Getting Started
******************

.. warning:: Amandroid currently is not available for Windows.


This section will help you to start with using Amandroid.

.. toctree::
	:numbered:
	:maxdepth: 1

Start with Source Code
======================

Amandroid is open sourced under Eclipse Public License v1.0 (EPL).

Follow instructions in `Tutorial <http://amandroid.sireum.org/docs/tutorial.html>`__ to learn how to start using and contributing to Amandroid.

.. sidebar:: Issue Tracker

	If you encounter any issue or have any comment, please post it on: https://github.com/sireum/amandroid/issues. We will do our best to reply.

Start with Executable
======================

Amandroid is a feature in `Sireum <http://www.sireum.org/>`__ Command Line Interface (CLI), following instruction will help you to setup.

Download Sireum
--------------------

	Follow instructions in `Sireum Strawberry <http://sireum.org/software.html#strawberry>`__ to download and setup Sireum-cli.


Run Amandroid
-------------------

	To run Amandroid, in a terminal command prompt, type:

	.. code-block:: bash

		$ sireum amandroid

	After running above command you will get the list of existing Amandroid plugins. You may choose one of them and perform such analysis.

	Example commands:

	.. code-block:: bash

		$ sireum amandroid decompile /path/some.apk /outputPath

	.. code-block:: bash

		$ sireum amandroid taintAnalysis -m 12 -p -o /outputPath /path/some.apk /your_Amandroid_Home/taintAnalysis/sourceAndSinks/TaintSourcesAndSinks.txt


-----------------

