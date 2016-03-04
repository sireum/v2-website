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

Amandroid is a feature in `Sireum <http://www.sireum.org/>`__ (a static analysis framework) Command Line Interface (CLI); the instructions below will help you setup.

Download Sireum
--------------------

	Follow instructions in `Sireum Strawberry <http://sireum.org/software.html#strawberry>`__ to download and setup Sireum-cli.

.. sidebar:: Tips

	You can modify the configuration for Amandroid by editing ``/path/Sireum/apps/amandroid/config.ini``. 

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

		$ sireum amandroid taintAnalysis -m 8 -o /outputPath /path/some.apk


Test Amandroid
--------------------

	To make sure Amandroid running on your environment, you can execute it on our test apks, which you can find in the ``/path/Sireum/apps/amandroid/sources/icc-bench`` folder or `ICC-Bench <https://github.com/fgwei/ICC-Bench/tree/master/apks>`__.

	The command to run is:

	.. code-block:: bash

		$ sireum amandroid taintAnalysis -m 4 -o /outputPath /path/Sireum/apps/amandroid/sources/icc-bench

	More test apks you can find from `DroidBench <https://github.com/secure-software-engineering/DroidBench/tree/master/apk>`__.


------------------------
