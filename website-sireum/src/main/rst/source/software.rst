Software
########

.. include:: software-header.rst

.. _sec-getting-started:

Getting Started
***************

Demo Videos:

* `Installing Sireum (Vanilla) and Sireum Bakar <http://files.sireum.org/media/sireum-bakar-installation.mp4>`__

* `Updating Sireum <http://files.sireum.org/media/sireum-update.mp4>`__

* `Sireum Bakar Kiasan <http://files.sireum.org/media/bakarv1/sireum-bakar-kiasan.mp4>`__
  (`examples <http://files.sireum.org/media/bakarv1/examples/bakar-examples.zip>`__)

Installing Sireum
=================

Sireum Distributions
--------------------

There are 3 flavors of Sireum distributions: :ref:`vanilla`, :ref:`strawberry`,
and :ref:`Shortcake`
(most users would probably prefer :ref:`strawberry` or :ref:`Shortcake`).
Each flavor consists of *stable* and *dev* versions;
the stable version is suitable for regular use and the dev version is intended
for Sireum developers or for users trying out recent features/bug fixes not
in stable yet.

.. _vanilla:

Vanilla
^^^^^^^

Vanilla is a minimal Sireum distribution consisting of Java, Scala, and 
:ref:`subsec-distro`, from where additional Sireum :ref:`sec-features` can be 
installed on an on-demand basis.
  
* *stable*:
  `mac64 <http://files.sireum.org/sireum-stable-mac64.tar.gz>`__, 
  `linux64 <http://files.sireum.org/sireum-stable-linux64.tar.gz>`__, 
  `win64 <http://files.sireum.org/sireum-stable-win64.zip>`__
  (also available @ `Bintray <https://bintray.com/sireum/vanilla/stable/latest/view#files>`__) 
* *dev (nightly)*: 
  `mac64 <http://files.sireum.org/sireum-dev-mac64.tar.gz>`__, 
  `linux64 <http://files.sireum.org/sireum-dev-linux64.tar.gz>`__, 
  `win64 <http://files.sireum.org/sireum-dev-win64.zip>`__
  (*weekly* available @ `Bintray <https://bintray.com/sireum/vanilla/dev/weekly/view#files>`__)
   
.. _strawberry:

Strawberry
^^^^^^^^^^

Strawberry (a.k.a., cli) is a Sireum distribution that includes :ref:`vanilla` 
and all publicly released Sireum (v2) tools and their Command-Line Interface
(CLI) such as `Amandroid <http://amandroid.sireum.org>`__.

* *stable* 

  * @ `Bintray <https://bintray.com/sireum/cli/stable/latest/view#files>`__
  
  * @ `Docker Hub <https://registry.hub.docker.com/u/sireum/cli-stable/>`__
    (`Dockerfile <https://github.com/sireum/docker/blob/master/cli/stable/Dockerfile>`__; ``SIREUM_HOME`` = ``/opt/Sireum``)::
   
        docker run -i -t sireum/cli-stable:latest /bin/bash
        
* *dev (weekly)*

  * @ `Bintray <https://bintray.com/sireum/cli/dev/weekly/view#files>`__
  
  * @ `Docker Hub <https://registry.hub.docker.com/u/sireum/cli-dev/>`__
    (`Dockerfile <https://github.com/sireum/docker/blob/master/cli/dev/Dockerfile>`__; ``SIREUM_HOME`` = ``/opt/Sireum``)::
   
        docker run -i -t sireum/cli-dev:weekly /bin/bash

.. _shortcake:
    
Shortcake
^^^^^^^^^

Shortcake (a.k.a., ide) is a Sireum distribution that includes :ref:`strawberry`
and the Sireum Integrated Development Environment
(IDE, see :ref:`subsec-sireum-ide-feature`).

* *stable* @ `Bintray <https://bintray.com/sireum/ide/stable/latest/view#files>`__
* *dev (weekly)* @ `Bintray <https://bintray.com/sireum/ide/dev/weekly/view#files>`__

.. note::

   Specific distribution build dates can be found at the Sireum
   :ref:`sec-releases` page.
   The list of all packages included in the distributions (i.e., Sireum 
   dependencies) can be found at the Sireum :ref:`sec-packages` page.

Installation Instructions
-------------------------

Download the distribution of choice appropriate for your platform and uncompress
it in,  e.g., ``~/Applications`` (or in Windows: ``C:\``). 
This will create a Sireum directory in ``~/Applications/Sireum`` (or ``C:\Sireum``).
Let's call this directory ``SIREUM_HOME``. The rest of the instructions
below assume the command ``sireum`` to refer to ``SIREUM_HOME/sireum``
(relative or absolute path); you can make sure that this is always the 
case by, for example, adding the absolute path of ``SIREUM_HOME`` to the 
**beginning** of your ``PATH`` environment variable. 

.. note:: 

   ``SIREUM_HOME`` should not contain whitespaces, and in Windows, it is best
   to put it in a root drive because
   of `Windows' file path limit of 260 characters <http://msdn.microsoft.com/en-us/library/aa365247(VS.85).aspx#maxpath>`_.)

   The :ref:`strawberry` and :ref:`shortcake` distributions consist of
   compressed file parts.

   * To uncompress in OS X and Linux::

         cat *.part_* | tar xz
      
   * To reassemble in Windows::

         type *.part_* > sireum-<flavor>-<version>-win64.zip 
 

Running Sireum
==============

To run Sireum, in a terminal command prompt, type::

    sireum

(If this is your first time running Sireum vanilla, `Sireum Distro`_ 
will automatically download the appropriate files for Sireum command-line 
interface (CLI) and store them in ``SIREUM_HOME``.) 
Then, Sireum CLI will print out the available modes that you can use. 
It is recommended to not modify files under ``SIREUM_HOME`` as the changes might
be lost after an update.

.. _subsec-distro:

Sireum Distro
=============

Sireum Distro is Sireum's package manager and launcher that aims to simplify 
the process of installing, updating, and running tools built on top of the 
Sireum platform and associated applications. 

To update Sireum tools and apps, type the following in a terminal::

    sireum update
    
.. note::

   To change to a specific version of Sireum, set the ``SIREUM_UPDATE``
   environment variable to point to the corresponding update site version listed
   in the Sireum :ref:`sec-releases` page before running Sireum update.
   By default, the update uses the latest update site of the installed Sireum
   distribution type (stable: http://update.sireum.org/stable/latest; 
   dev: http://update.sireum.org/dev/latest). All Sireum update sites are
   only hosted at K-State CIS servers.

To see the Sireum version that is installed::

   sireum version
   
To list the available features that you can install::

    sireum list

To see other distro modes::

    sireum distro

To uninstall all features::

    sireum uninstall all

.. note:: ``uninstall all`` will still keep Java and Scala that come with the
   Sireum distribution.

Proceed to take a look at the available Sireum :ref:`sec-features`.  

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
   