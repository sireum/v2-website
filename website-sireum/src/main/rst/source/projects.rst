Projects
########

Projects
********

----

We are currently developing Sireum v2.
`Sireum Amandroid <http://amandroid.sireum.org>`__ is the first publicly
available major toolset developed on top of Sireum v2. 

Below are some projects done in Sireum v1.

----

.. _subsec-bakar-project:

Sireum Bakar
============

Bakar is a toolset for analyzing Spark Ada programs 
(Bakar means “spark” in Indonesian).

Sireum Bakar currently includes:

* Alir: an information flow analysis tool for reasoning about Spark’s 
  derive clauses/information flow (Alir means “flow” in Indonesian). 
  Alir visualizes information flows to ease engineers in understanding 
  information dependencies crucial for specifying and verifying Spark’s
  derive clauses.
  
  See:
  `SCAM12 <http://www.computer.org/csdl/proceedings/scam/2012/4783/00/4783a132-abs.html>`__. 

* Kiasan: a fully automated tool for verifying functional behaviors of 
  Spark programs specified as software contract
  (Kiasan means “symbolic” in Indonesian).
  Kiasan is an explicating symbolic execution tool that provides various 
  helpful feedback including generation of counter example for contract
  refutation, test cases for an evidence of contract satisfaction,
  verification reports, visual graphs illustrating pre/post states of
  Spark procedures/functions, etc.
  
  See:
  `ICSE13 <http://dl.acm.org/citation.cfm?id=2486818>`__,
  `NFM12 <http://link.springer.com/chapter/10.1007%2F978-3-642-28891-3_29>`__,
  `HILT12 <http://dl.acm.org/citation.cfm?doid=2402676.2402679>`__,
  `NFM11 <http://link.springer.com/chapter/10.1007%2F978-3-642-20398-5_6>`__, and
  `SIGADA11 <http://dl.acm.org/citation.cfm?doid=2070337.2070357>`__.

You can install Bakar v1 by following the instruction in 
:ref:`subsec-distro`'s feature :ref:`subsec-bakar-feature`.

Demo Videos:

* `Installing Sireum (and Sireum Bakar) <http://sireum.org/files/media/sireum-bakar-installation.mp4>`__

* `Updating Sireum <http://sireum.org/files/media/sireum-update.mp4>`__

* `Sireum Bakar Kiasan <http://sireum.org/files/media/bakarv1/sireum-bakar-kiasan.mp4>`__ 
  (`examples <http://sireum.org/files/media/bakarv1/examples/bakar-examples.zip>`__)

We are actively developing Bakar v2 that will have the above tools
along with a Spark 2014/Ada 2012 front-end for Java, Scala, and Coq/OCaml.

----

Sireum/Kiasan for Java
======================

`Sireum/Kiasan for Java <https://code.google.com/p/sireum/>`_ 
is a JML contract-based automatic verification and 
test case generation tool-set for Java program units.

See:
`ASE12 <http://link.springer.com/article/10.1007%2Fs10515-011-0089-9>`__,
`SEFM07 <http://www.computer.org/csdl/proceedings/sefm/2007/2884/00/28840273-abs.html>`__,
`TAICPART07 <http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=4344093>`__,
`ISoLA06 <http://ieeexplore.ieee.org/lpdocs/epic03/wrapper.htm?arnumber=4463705>`__, and
`ASE06 <http://www.computer.org/csdl/proceedings/ase/2006/2579/00/25790157-abs.html>`__.

----

Others
======

* Conditional Information Flow Verifier

  See: 
  `POST12 <http://link.springer.com/10.1007/978-3-642-28641-4_20>`__,
  `Hardin-BOOK10 <http://link.springer.com/chapter/10.1007/978-1-4419-1539-9_12>`__, and 
  `FM08 <http://link.springer.com/chapter/10.1007%2F978-3-540-68237-0_17>`__. 

* Lightweight Decision Procedure
 
  See:
  `FSE09 <http://dl.acm.org/citation.cfm?doid=1595696.1595762>`__.
  
----

