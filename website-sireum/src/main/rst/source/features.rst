Features
########

.. include:: software-header.rst

.. _sec-features:

Features
********

Features for Sireum Users
=========================

.. _subsec-amandroid-feature:

Sireum Amandroid
----------------

Sireum Amandroid_ is a toolset for security vetting of Android apps.
Please visit the Amandroid_ website for more information.

.. note::

   Amandroid_ is available only on mac64 and linux64.
   
.. _Amandroid: http://amandroid.sireum.org/

.. _subsec-bakar-feature:

Sireum Bakar
------------

:ref:`subsec-bakar-project` is a toolset for analyzing Spark Ada programs 
(Bakar means "spark" in Indonesian).
Sireum Bakar (v1) is integrated with the Eclipse_ platform;
a new version (v2) for Spark 2014 is currently under development.

.. _Eclipse: http://eclipse.org

To run Sireum Bakar, type the following in a terminal (add ``-h`` for help)::

    sireum launch bakar

It installs Eclipse (in ``SIREUM_HOME/apps/eclipse/dsl/``) 
with Bakar Eclipse plugins (if they have not been installed previously), and 
launch Eclipse.

.. _subsec-sireum-ide-feature:

Features for Sireum Developers
==============================


Eclipse and Associated Plugins for Sireum Development
-----------------------------------------------------

Sireum Distro manages the recommended Eclipse_ version and 
associated plugins for developing Sireum; all Sireum codebase require around 
3GB heap to compile.

To run Sireum development tools, type the following in a terminal
(add ``-h`` for help)::

    sireum launch sireumdev -j "-Xms512m,-Xmx4096m"

It installs Eclipse (in ``SIREUM_HOME/apps/eclipse/dsl/``) with 
associated plugins necessay for Sireum development and ANTLRWorks 
(in ``SIREUM_HOME/apps/antlr/works``), and launch Eclipse.
Add ``SIREUM_HOME/apps/platform/java`` in Eclipe's 
`Java Installed JREs preference page <http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fpreferences%2Fjava%2Fdebug%2Fref-installed_jres.htm>`_,
and make it the default. In addition, set Eclipse's
`Java Compiler compliance level <http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fpreferences%2Fjava%2Fbuildpath%2Fref-preferences-user-libraries.htm>`_ to 1.7.
   

ANTLRWorks
----------

To run ANTLRWorks, type the following in a terminal::

    sireum launch antlrworks


Features for K-State CIS Students
=================================

Sireum Distro manages the recommended tools required by some course offerings at 
K-State CIS.


Compilers -- CIS 706: Translator Design I
-----------------------------------------

See the `compiler course website <http://compilers.santoslab.org>`_ 
for information regarding the course, or see the `compiler example projects
repository <https://github.com/ksu-cis-706/compiler>`__ 
for instructions on setting up your development environment.
