Lectures
########

Lectures
********

.. include:: def-contact.rst

----

Introduction to Verification with |SPARK 2014|
==============================================

Lecturer: |Yannick Moy| (AdaCore)
---------------------------------

SPARK 2014 is the latest evolution of the SPARK programming language.
Based on Ada 2012, it encompasses a rich subset of the language and
augments it with further language contracts designed to support advanced
static verification techniques.

This tutorial will provide a broad overview of the SPARK 2014 language:
the subset of Ada 2012 which it includes and the additional constructs
which it adds to support verification. The morning session will cover
basic features and static analysis techniques. This will be followed by an
introduction to one of the most novel features of the language - the dual
nature of the contracts as both executable and mathematical statements and
how these can be verified by testing, proof, or a combination of the two.

In the afternoon, the tutorial will look at more advanced language
features that are essential for industrial-scale specification, such as
abstraction and refinement. We will also look at more advanced
verification techniques supported by the language such as information flow
analysis and proving the absence of run-time exceptions (divide-by-zero,
numeric overflow). Finally, we will touch on some of the more advanced
proof techniques that may be required.

----

|Bakar Kiasan| -- A Certifying Program Verifier for High-Integrity Systems
==========================================================================

Lecturers: |Robby| (Kansas State University) and |John Hatcliff| (Kansas State University)
------------------------------------------------------------------------------------------

Software-dependent critical systems that impact daily life are rapidly
increasing in number, size, and complexity. Unfortunately, inadequate
software and systems engineering can lead to accidents that cause
economic disaster, injuries or death. There is a growing reliance on
development and verification tools to reduce costs, better manage
complexity, and to increase confidence in these systems. Recent
standards for critical systems have an increased emphasis on
characterizing the requirements of tools used in the certification
context and the particular certification obligations that these tools
can discharge. In the case of avionics, DO-333 explicitly addresses
the role/use of formal methods tools, e.g., allowing formal
verification of code compliance to procedure contracts to replace unit
testing.

This lecture presents the next generation Bakar Kiasan verifier in the
Sireum platform (|sireum.org|). Bakar Kiasan is a
certifying symbolic execution-based program verifier for
high-integrity critical systems written using the Spark 2014 safe
subset of Ada 2012. It checks conformance of Spark programs against
their contracts and produce evidence for its analysis results. For
example, it produces counter-examples and test cases for contract
violations. In addition, Bakar Kiasan produces test cases to
illustrate contract satisfactions as well as machine-checkable proofs 
for its contract verifications. The lecture will present foundations
of symbolic execution, discuss how evidence can be generated from
symbolic execution-based analysis, and will provide hands-on
exercises using Bakar Kiasan to verify Spark 2014 program units.

----

|SMT-LIB| and |Kind|
====================

Lecturer: |Cesare Tinelli| (University of Iowa)
-----------------------------------------------

TBA

----

TBA
===

Lecturers: |Bernhard Steffen| (TU Dortmund University) and |Tiziana Margaria| (University of Potsdam)
-----------------------------------------------------------------------------------------------------

TBA

----
