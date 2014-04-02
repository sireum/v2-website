Software
########

----

Links
*****

.. toctree::
   :maxdepth: 1
   
   features
   releases
   packages
   license
   
* `Repositories <http://github.com/sireum>`__

* `Jenkins <http://jenkins.cis.ksu.edu>`__   

----

.. _sec-getting-started:

Getting Started
***************

Downloading Sireum
==================

Managed Java and Scala
----------------------

The following Sireum distributions include Java (JDK) 8 and Scala 2.10.4:

* **Stable**: 
  `mac64 <http://sireum.org/artifact/sireum-stable-mac64.tar.gz>`__, 
  `linux64 <http://sireum.org/artifact/sireum-stable-linux64.tar.gz>`__, 
  `linux32 <http://sireum.org/artifact/sireum-stable-linux32.tar.gz>`__, 
  `win64 <http://sireum.org/artifact/sireum-stable-win64.zip>`__, 
  `win32 <http://sireum.org/artifact/sireum-stable-win32.zip>`__
* **Development**: 
  `mac64 <http://sireum.org/artifact/sireum-dev-mac64.tar.gz>`__, 
  `linux64 <http://sireum.org/artifact/sireum-dev-linux64.tar.gz>`__, 
  `linux32 <http://sireum.org/artifact/sireum-dev-linux32.tar.gz>`__, 
  `win64 <http://sireum.org/artifact/sireum-dev-win64.zip>`__, 
  `win32 <http://sireum.org/artifact/sireum-dev-win32.zip>`__

Download the distribution appropriate for your platform and uncompress it in, 
e.g., ``~/Applications`` (or in Windows: ``C:\``). (Note that the path should not
contain whitespaces, and in Windows, it is best to put it in a root drive because
of `Windows' file path limit of 260 characters <http://msdn.microsoft.com/en-us/library/aa365247(VS.85).aspx#maxpath>`_.) 
This will create a Sireum directory in ``~/Applications/Sireum`` (or ``C:\Sireum``).
Let's call this directory ``SIREUM_HOME``. The rest of the instructions
below assume the command ``sireum`` to refer to ``SIREUM_HOME/sireum``
(relative or absolute path); you can make sure that this is always the 
case by, for example, adding the absolute path of ``SIREUM_HOME`` to the 
**beginning** of your ``PATH`` environment variable. 


Proceed to `Running Sireum`_.


Unmanaged Java and Scala
------------------------

This is **not recommended** because your Java and Scala versions may differ to 
what Sireum needs. Regardless, if you want to manage Java and Scala yourself 
(Java and Scala should be in your ``PATH`` environment variable), 
you can download just the Sireum script:

* **Stable**

  + for Mac and Linux: `sireum <http://update.sireum.org/sireum>`__
  + for Windows: `sireum.bat <http://update.sireum.org/sireum.bat>`__

* **Development**

  + for Mac and Linux: `sireum <http://update.sireum.org/dev/latest/sireum>`__
  + for Windows: `sireum.bat <http://update.sireum.org/dev/latest/sireum.bat>`__

Download the Sireum script appropriate for your platform (gunzip the Sireum 
script if downloading the compressed version), and store it in a directory such 
as ``~/Applications/Sireum`` (or in Windows: ``C:\Sireum``). (Note that the path 
should not contain whitespaces, and in Windows, it is best to put it in a root 
drive because of 
`Windows' file path limit of 260 characters <http://msdn.microsoft.com/en-us/library/aa365247(VS.85).aspx#maxpath>`_.) 
Let's call this directory ``SIREUM_HOME``. The rest of the instructions
below assume the command ``sireum`` to refer to ``SIREUM_HOME/sireum``
(relative or absolute path); you can make sure that this is always the 
case by, for example, adding the absolute path of ``SIREUM_HOME`` to the 
**beginning** of your ``PATH`` environment variable.


Running Sireum
==============

To run Sireum, in a terminal command prompt, type::

    sireum

If this is your first time running Sireum, `Sireum Distro`_ 
will automatically download the appropriate files for Sireum command-line 
interface (CLI) and store them in ``SIREUM_HOME``. 
The Sireum CLI will then print out the available modes that you can use. 
It is recommended to not modify/remove/add files under ``SIREUM_HOME`` as the 
changes might be lost after an update.

.. _subsec-distro:

Sireum Distro
=============

Sireum Distro is Sireum's package manager and launcher that aims to simplify 
the process of installing, updating, and running tools built on top of the 
Sireum platform and associated applications. 

To update Sireum tools and apps, type the following in a terminal::

    sireum update

To list the available features that you can install::

    sireum list

To see other distro modes::

    sireum distro

If you previously chose `Unmanaged Java and Scala`_, 
you can move to `Managed Java and Scala`_ 
by installing the ``Platform`` feature::

    sireum install Platform

Conversely, you can uninstall the ``Platform`` feature to manage Java and Scala 
yourself::

    sireum uninstall Platform

.. note:: ``uninstall all`` will uninstall the ``Platform`` feature as well.

-----

.. tip:: Mode Prefix and Feature Camel Case

   Sireum Distro accepts mode prefixes. For example:: 

        sireum d 

   is equal to::

       sireum distro

   In addition, camel casing works for feature names. For example:: 

       sireum i SD

   is equal to::

       sireum install SireumDev

   Moreover, camel casing works with all lowercase characters, where the characters
   are converted to uppercase. For example::

       sireum i sd

   is equal to::

       sireum i SD
   