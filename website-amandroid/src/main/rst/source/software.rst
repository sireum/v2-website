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

*  Amandroid (Beta 0.1): `Mac64 <http://people.cis.ksu.edu/~fgwei/resources/AmandroidCli-mac64.zip>`__, Linux64

Download the distribution appropriate for your platform and uncompress it in, e.g., ``~/Applications``. (Note that the path should not contain whitespaces.)
This will create a Amandroid directory in ``~/Applications/AmandroidCli``. Let’s call this directory ``SIREUM_HOME`` (as Amandroid is using `Sireum <http://www.sireum.org/>`__). The rest of the instructions below assume the command ``sireum`` to refer to ``SIREUM_HOME/sireum`` (relative or absolute path); you can make sure that this is always the case by, for instance, adding the absolute path of ``SIREUM_HOME`` to the **beginning** of your ``PATH`` environment variable.



Setup Amandroid
---------------


Before using Amandroid, you need to setup following environment variable:

	``SIREUM_HOME``: points to Sireum's main directory. e.g.,::

		$ export SIREUM_HOME=/path/AmandroidCli

	``AMANDROID_HOME`` : points to Amandroid’s main directory. e.g.,::

		$ export AMANDROID_HOME=$SIREUM_HOME/Amandroid


Running Amandroid
-------------------

To run Amandroid, in a terminal command prompt, type::

	$ sireum x amandroid

After running above command you will get the list of existing Amandroid plugins. You may choose one of them and perform such analysis.


.. note:: Each plugin may need to set several options, and option [``-ni``, ``-ns``, ``-par``] is special: when you set such option you need to use something like: ``-ni true``, and if you want false, you don’t need to specify such option.


.. tip:: Mode Prefix and Feature Camel Case

	For example::
	
		$ sireum x a

	is equal to::

		$ sireum x amandroid

	For more information please visit http://www.sireum.org/software.html