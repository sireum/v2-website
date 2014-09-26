Lectures
########

.. _lectures:

Lectures
********

.. include:: def-contact.rst

For daily activities, please see the :ref:`schedule` page.

----

.. _spark2014:

Introduction to Verification with |SPARK 2014|
==============================================

Lecturer: |Yannick Moy| (AdaCore)
---------------------------------

SPARK 2014 is the latest evolution of the SPARK programming language.
Based on Ada 2012, it encompasses a rich subset of the language and
augments it with further language contracts designed to support advanced
static verification techniques.

This lecture will provide a broad overview of the SPARK 2014 language:
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

.. _kiasan:

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

.. _scce:

SCCE: Variability and Evolution through Integrated Domain, Data and Process Modeling
====================================================================================

Lecturers: |Bernhard Steffen| (TU Dortmund), |Tiziana Margaria| (University of Potsdam),
----------------------------------------------------------------------------------------

.. raw:: html

   <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.cs.tu-dortmund.de/nps/de/Home/Personen/N/Naujokat__Stefan.html">Stefan Naujokat</a> (TU Dortmund), and
   <a href="http://ls5-www.cs.tu-dortmund.de/cms/de/mitarbeiter/wiss/Johannes_Neubauer.html">Johannes Neubauer</a> (TU Dortmund)</h4>
   

Domain-specific tool support is the key towards opening development
responsibility for a wider public without dedicated programming
knowledge. This is, for example, important in areas like business process
modelling or scientific workflows. The intention behind the tools and
methods presented in this lecture lies in providing domain experts with
appropriate (non-programming) tools, so that they can solve problems
within their domainin in a non-technical way and even construct
domain-specific software products without dedicated programming knowledge.

In the first session of this lecture we will introduce the Dynamic Web
Application (DyWA) framework that supports the prototype-driven
development of process-oriented web applications. It is a generic, fully
functional prototype that accompanies the development right from the
beginning, offering a web-based definition facility for application
domains in terms of type schemata that captures the data types and their
associations. The session will provide hands-on experience on domain
modeling with DyWA which automatically generates the (complex) modeled
data structures together with their fully executable access functionality.

The second session focuses on 'breathing life' into the DyWA domain models
via the process modeling environment |jABC4|. In particular, it will
illustrate the power of prototype-driven process development throughout
the whole system lifecylce, with a focus on system evolution and system
migration.

The third session presents Cinco, a particularly powerful application of
our process modeling framework based on the Eclipse ecosystem. Cinco is a
meta tooling suite for generating domain-specific graphical development
tools in terms of fully operative Eclipse products. It can be regarded as
a domain-specific instance of generic meta modeling frameworks such as
Eclipse EMF/Graphiti which radically eases their use through its
domain-specific focus.
Cinco is an application of our process modeling and design framework |jABC4|
as all the required transformations, be they model-to-model or
model-to-code, are modeled with |jABC4| so that they can also be developed
without specific programming knowledge. 
Please note that Cinco is a prime example for bootstrapping. It is a tool
for delevoping domain-specific development tools that is build with a
domain-specific development tool (|jABC4|). Indeed, the next version of 
|jABC4|, |jABC5| will be constructed in this very fashion.
In the hands-on tutorial part of this session the participants will use
Cinco to create a full graphical DSL modeling tool of their choice (e.g.,
for State Charts, Petri Nets, BPMN, Timed Automata, or even architectural
models or industrial plant layouts) consisting of an abstract
specification describing its structure and appearance, accompanied by a
code generator that is modeled in |jABC4| using modeling components
generated from the very same specification.

----

.. _smtkind:

Introduction to SMT and SMT-based Model Checking
================================================

Lecturer: |Cesare Tinelli| (University of Iowa)
-----------------------------------------------

Many problems in computer science, in particular in formal methods, can be
reduced to checking the satisfiability of a formula in some logic.
Several of these problems can be naturally formulated as Satisfiability
Modulo Theories (SMT) problems which are about checking the satisfiability
of first-order formulas with respect to some logical theory *T* of 
interest. SMT differs from general automated deduction in that the 
background theory *T* need not be finitely or even first-order 
axiomatizable, and specialized inference methods are used for each theory.
By being theory-specific and restricting their language to certain classes
of formulas, these specialized methods can be implemented in solvers that 
are more efficient in practice than general-purpose theorem provers.
SMT solvers have been used successfully in several application ares
including hardware verification, equivalence checking, bounded and
unbounded model checking, predicate abstraction, static analysis,
automated test case generation, extended static checking, and type checking.

The first session of this lecture will start with an overview of SMT and
its applications, followed by exercises using SMT solvers supporting the
standard SMT-LIB input format, with a focus on the
|CVC4| solver. |CVC4| is a widely-used open-source SMT solver supporting
a rich set of logical theories including the theory of arrays,
bit vectors, linear integer and real arithmetic, algebraic data types and
strings.

The second session will give a brief overview of model checking techniques
relying on SMT solvers, and show how to use the SMT-based
|Kind| 2 model checker to prove invariant properties of transition systems.
|Kind| 2 checks multiple properties simultaneously by running in parallel
several model checking engines based on such techniques as bounded model
checking (BMC), k-induction, IC3/PDR, and automatic invariant generation.
The engines cooperate by exchanging information about the proven or
disproven properties as well as auxiliary invariants.
Examples and exercises will use transition systems and properties
specified in the synchronous data flow language Lustre.

----
