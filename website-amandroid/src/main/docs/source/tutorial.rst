First Steps with Amandroid
#########################

Amandroid uses development platform provided by `Sireum <http://www.sireum.org/>`__.
So the first thing we need to do is to setup Sireum command-line interface (CLI).

Setup Sireum CLI
====================

.. sidebar:: Sireum

	Sireum is a long-term research effort to develop an over-arching software analysis platform that incorporates various static analysis techniques such as data-flow framework, model checking, symbolic execution, abstract interpretation, and deductive reasoning techniques (e.g., using weakest precondition calculation). It can be used to build various kinds of software static analyzers for different kinds of properties. 

	To get more detailed information about how Sireum CLI works, please follow instructions at http://www.sireum.org/software.html.

Sireum CLI setup is pretty strait-forward, following steps need to be followed: 

1.Download `Sireum <http://www.sireum.org/software.html#downloading-sireum>`__, and extract it in ``/path``. (Note that the path should not contain whitespaces.) This will create a Sireum directory in ``/path/Sireum``.

2.Setup following environment variables:

``SIREUM_HOME``: points to Sireum's main directory. e.g.,
	
.. code-block:: bash

	$ export SIREUM_HOME=/path/AmandroidCli

Adding the absolute path of ``SIREUM_HOME`` to the beginning of your ``PATH`` environment variable.

``SIREUM_UPDATE`` : points to Sireum update site.

.. code-block:: bash

	$ export SIREUM_UPDATE=http://update.sireum.org/dev/latest

	
3.Initialize Sireum CLI:

.. code-block:: bash

	$ sireum

If this is your first time running Sireum, `Sireum Distro <http://www.sireum.org/software.html#sireum-distro>`__ will automatically download the appropriate files for Sireum CLI and store them in ``SIREUM_HOME``.

4.Launch Eclipse:

.. code-block:: bash

	$ sireum launch sireumdev -j "-Xms128m,-Xmx1024m" --args -clean

This will launch Eclipse IDE with all required pulgins. ``-j "-Xms512m,-Xmx4096m" --args -clean`` is parameter gives to Eclipse (you can modify it based on your machines performance).


After above steps you will get a working development platform with all the necessary plugins setup. Then it is time to get code of Amandroid.

Checking Out the Source of Amandroid
====================

Amandroid is implemented on top of `Sireum <https://github.com/sireum>`__, so following Sireum repositories are needed to be able to run Amandroid:

``Sireum Prelude``: https://github.com/sireum/prelude

``Sireum Parser``: https://github.com/sireum/parser

``Sireum Core``: https://github.com/fgwei/core

``Sireum Jawa``: https://github.com/sireum/jawa

Amandroid’s repository:

``Sireum Amandroid``: https://github.com/sireum/amandroid

Clone all the required repositories into your workspace using Eclipse:

1.Switch to the Git Repository Exploring perspective in Eclipse.

2.Click Clone a Git Repository and give the URL. Then, fill in necessary informations until finish.

3.Wait for the repository to be cloned—this may take a couple of minutes.

4.Import all the projects by:

right-click on each repository -> select ``Import Projects …`` -> check ``Import existing projects`` and go ``Next`` -> Click ``Finish`` with all projects checked.

5.Wait for the projects to be imported, and the indexing to finish.

Optain Amandroid Stash
======================

1.Download `Amandroid Stash <http://people.cis.ksu.edu/~fgwei/resources/stash/AmandroidStash.zip>`__, and extract it in, e.g., ``/path``.
This will create a Amandroid directory in ``/path/AmandroidStash``.

2.Setup environment variable:

``AMANDROID_HOME``: points to Amandroid Stash’s main directory. e.g.,
	
.. code-block:: bash

	$ export AMANDROID_HOME=/path/AmandroidStash

.. note:: Do not change the directory structure with in Amandoid Stash.

TroubleShooting
==================

1.Sometimes, after you import all the projects it will show error mark on some of the projects. Just make sure you are using correct Java compiler version, and then clean all projects.