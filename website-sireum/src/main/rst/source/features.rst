.. _sec-features:

Features
########


Features for Sireum Users
*************************

.. _subsec-amandroid-feature:

Sireum Amandroid
****************

Sireum Amandroid_ is a toolset for security vetting of Android apps. Please visit
the Amandroid_ website for more information.

.. _Amandroid: http://amandroid.sireum.org/

.. _subsec-bakar-feature:

Sireum Bakar
============

:ref:`subsec-bakar-project` is a toolset for analyzing Spark Ada programs 
(Bakar means "spark" in Indonesian).
Sireum Bakar is integrated with the Eclipse_ platform. 
(A version for AdaCore's GNAT Programming Studio -- GPS_), is currently under 
development.)

.. _Eclipse: http://eclipse.org
.. _GPS: http://www.adacore.com/gnatpro/toolsuite/gps

To run Sireum Bakar, type the following in a terminal (add ``-h`` for help)::

    sireum launch bakar

It installs Eclipse (in ``SIREUM_HOME/apps/eclipse/dsl/``) 
with Bakar Eclipse plugins (if they have not been installed previously), and 
launch Eclipse.

Features for Sireum Developers
******************************


Eclipse and Associated Plugins for Sireum Development
=====================================================

Sireum Distro manages the recommended Eclipse_ version and 
associated plugins for developing Sireum. 
To run Sireum development tools, type the following in a terminal
(add ``-h`` for help)::

    sireum launch sireumdev

It installs Eclipse (in ``SIREUM_HOME/apps/eclipse/dsl/``) with associated 
plugins necessay for Sireum development and ANTLRWorks 
(in ``SIREUM_HOME/apps/antlr/works``), and launch Eclipse.
Add ``SIREUM_HOME/apps/platform/java`` in Eclipe's 
`Java Installed JREs preference page <http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fpreferences%2Fjava%2Fdebug%2Fref-installed_jres.htm>`_,
and make it the default. In addition, set Eclipse's `Java Compiler compliance level <http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fpreferences%2Fjava%2Fbuildpath%2Fref-preferences-user-libraries.htm>`_ to 1.7.
   

ANTLRWorks
==========

To run ANTLRWorks, type the following in a terminal::

    sireum launch antlrworks


Features for K-State CIS Students
*********************************

Sireum Distro manages the recommended tools required by some course offerings at 
K-State CIS.


Compilers -- CIS 706: Translator Design I
=========================================

See the `compiler course website <http://compilers.santoslab.org>`_ 
for information regarding the course.
To install the compiler tools, type the following in a terminal 
(add ``-h`` for help)::

    sireum launch eclipse

It installs Eclipse_ (in ``SIREUM_HOME/apps/eclipse/dsl/``) 
with associated plugins necessay for the compiler course and ANTLRWorks 
(in ``SIREUM_HOME/apps/antlr/works``), and then launch Eclipse.
Add ``SIREUM_HOME/apps/platform/java`` in Eclipe's 
`Java Installed JREs preference page <http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fpreferences%2Fjava%2Fdebug%2Fref-installed_jres.htm>`_,
and make it the default. In addition, set Eclipse's `Java Compiler compliance level <http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fpreferences%2Fjava%2Fbuildpath%2Fref-preferences-user-libraries.htm>`_ to 1.7.


ANTLRWorks
==========

To run ANTLRWorks, type the following in a terminal::

    sireum launch antlrworks
