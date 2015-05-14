First Steps with Amandroid
##########################

Amandroid uses development platform provided by `Sireum <http://www.sireum.org/>`__.
So the first thing we need to do is to setup Sireum command-line interface (CLI).

Setup Sireum CLI
================

.. sidebar:: Sireum

	Sireum is a long-term research effort to develop an over-arching software analysis platform that incorporates various static analysis techniques such as data-flow framework, model checking, symbolic execution, abstract interpretation, and deductive reasoning techniques (e.g., using weakest precondition calculation). It can be used to build various kinds of software static analyzers for different kinds of properties. 

	To get more detailed information about how Sireum CLI works, please follow instructions at http://www.sireum.org/software.html.

.. warning:: Amandroid currently is not available for Windows.

Sireum CLI setup is pretty strait-forward, following steps need to be followed: 

1. Follow instructions in `Sireum Shortcake <http://sireum.org/software.html#shortcake>`__ to download and setup Sireum-ide.

2. Launch Eclipse:

.. code-block:: bash

	$ sireum launch sireumdev -j "-Xms256m,-Xmx2048m" --args -clean

This will launch Eclipse IDE with all required pulgins. ``-j "-Xms512m,-Xmx4096m" --args -clean`` is parameter gives to Eclipse (you can modify it based on your machines performance).


After above steps you will get a working development platform with all the necessary plugins setup. Then it is time to get code of Amandroid.

Checking Out the Source of Amandroid
====================================

Amandroid is implemented on top of `Sireum <https://github.com/sireum>`__, so following Sireum repositories are needed to be able to run Amandroid:

.. sidebar:: Issue Tracker

	If you encounter any issue or have any comment, please post it on: 

	https://github.com/sireum/amandroid/issues. 

	We will do our best to reply.


``Sireum Prelude``: https://github.com/sireum/prelude

``Sireum Parser``: https://github.com/sireum/parser

``Sireum Core``: https://github.com/sireum/core

``Sireum Jawa``: https://github.com/sireum/jawa

Amandroid’s repository:

``Sireum Amandroid``: https://github.com/sireum/amandroid


Clone all the required repositories into your workspace using Eclipse:

1. Switch to the Git Repository Exploring perspective in Eclipse.

2. Click Clone a Git Repository and give the URL. Then, fill in necessary informations until finish.

3. Wait for the repository to be cloned—this may take a couple of minutes.

4. Import all the projects by:

right-click on each repository -> select ``Import Projects …`` -> check ``Import existing projects`` and go ``Next`` -> Click ``Finish`` with all projects checked.

5. Wait for the projects to be imported, and the indexing to finish.

TroubleShooting
===============

1. Sometimes, after you import all the projects it will show error mark on some of the projects. Just make sure you are using correct Java compiler version, and then clean all projects.

2. If you get issue related to dex2pilar, please try following:

	a. ``sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386``

	b. ``cd /usr/lib32``

	c. ``sudo ln -sf libstdc++.so.6 libc++.so``

	d. ``export LD_LIBRARY_PATH=/usr/lib32``

	e. Try again. If the problem remains check `Issue 17 <https://github.com/sireum/amandroid/issues/17>`__. Or report to us.
