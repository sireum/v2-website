Software
########


Links
*****

.. toctree::
	:maxdepth: 1

*  license
   
* `Repositories <http://github.com/sireum>`__
   

------------------------


Getting Started
****

.. toctree::
	:maxdepth: 1

Downloading Amandroid
--------------------

*  Amandroid (Beta 0.2): `Mac64 <http://people.cis.ksu.edu/~fgwei/resources/v0.2/AmandroidCli-mac64.zip>`__, `Linux64 <http://people.cis.ksu.edu/~fgwei/resources/v0.2/AmandroidCli-linux64.zip>`__

Download the distribution appropriate for your platform and uncompress it in, e.g., ``~/Applications``. (Note that the path should not contain whitespaces.)
This will create a Amandroid directory in ``~/Applications/AmandroidCli``. Let’s call this directory ``SIREUM_HOME`` (as Amandroid is using `Sireum <http://www.sireum.org/>`__). The rest of the instructions below assume the command ``sireum`` to refer to ``SIREUM_HOME/sireum`` (relative or absolute path); you can make sure that this is always the case by, for instance, adding the absolute path of ``SIREUM_HOME`` to the **beginning** of your ``PATH`` environment variable.



Setup Amandroid
---------------


Before using Amandroid, you need to setup following environment variables:

	``SIREUM_HOME``: points to Sireum's main directory. e.g.,
	
	.. code-block:: bash

		$ export SIREUM_HOME=/path/AmandroidCli

	``AMANDROID_HOME`` : points to Amandroid’s main directory. e.g.,

	.. code-block:: bash

		$ export AMANDROID_HOME=$SIREUM_HOME/apps/amandroid

Adding the absolute path of ``SIREUM_HOME`` to the beginning of your ``PATH`` environment variable.


Running Amandroid
-------------------

To run Amandroid, in a terminal command prompt, type:

.. code-block:: bash

	$ sireum x amandroid

After running above command you will get the list of existing Amandroid plugins. You may choose one of them and perform such analysis.

Example commands:

.. code-block:: bash

	$ ./sireum x amandroid decompile /path/some.apk /outputPath

.. code-block:: bash

	$ ./sireum x amandroid taintAnalysis -m 12 -p -o /outputPath /path/some.apk /your_Amandroid_Home/taintAnalysis/sourceAndSinks/TaintSourcesAndSinks.txt


.. tip:: Mode Prefix

	For example:

	.. code-block:: bash
	
		$ sireum x a

	is equal to:

	.. code-block:: bash

		$ sireum x amandroid

	For more information please visit http://www.sireum.org/software.html