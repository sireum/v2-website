.. toctree::
   :hidden:

   projects
   team
   software

Home
####

.. raw:: html

   <div class="container-fluid">
     <div class="row">
       <div class="col-md-12">
         <img src="_static/sireum.png" />
       </div>
     </div>
     
     <br/>
     
     <script src="_static/jquery.vticker.min.js"></script>
     <script src="_static/moment.min.js"></script>
     <script src="_static/livestamp.min.js"></script>
     <script>$(function() { $('#news').vTicker(); });</script>
     
     <div class="row">
       <div class="col-md-12">
         <div class="panel panel-default">
           <div class="panel-body">
             <table style="width:100%">
               <tr>
                 <td width="50px"><img src="_static/news-icon.png"></img></td>
                 <td>
                   <div id="news">

.. include:: def-news.rst 
                   
.. raw:: html

                   </div>
                 </td>
               </tr>
             </table>
           </div>
         </div>
       </div>
     </div>
     
     <div class="row">
       <div class="col-md-8">
         <div class="panel panel-default" style="height:375px">
           <div class="panel-heading">
             <h3 class="panel-title">About</h3>
           </div>
           <div class="panel-body">

Sireum is a long-term research effort to develop an over-arching software
analysis platform that incorporates various static analysis techniques
such as data-flow framework, model checking, symbolic execution, abstract
interpretation, and deductive reasoning techniques (e.g., using weakest
precondition calculation). It can be used to build various kinds of
software static analyzers for different kinds of properties.
Sireum is based on previous extensive efforts in
the  `Bogor <http://bogor.projects.cis.ksu.edu>`__ model checking framework, 
the `Kiasan <http://www.computer.org/csdl/proceedings/ase/2006/2579/00/25790157-abs.html>`__ 
symbolic execution framework, and 
the `Indus <http://indus.projects.cis.ksu.edu>`__ static analysis framework, 
the `Bandera <http://bandera.projects.cis.ksu.edu>`__ Java model checker. 
In contrast to previous efforts, Sireum aims to provide
a parallelizable, software description (e.g., programming language)
agnostic implementation of the above frameworks in a unified platform.

The development of Sireum was supported in part by the US Air Force Office
of Scientific Research grant no. FA9550-09-0138,
the US National Science Foundation (NSF) CAREER
award `CCF-0644288 <http://www.nsf.gov/awardsearch/showAward?AWD_ID=0644288>`__, 
Rockwell Collins Advanced Technology Center, and
Lockheed Martin Advanced Technology Laboratories.

Sireum source (private) and binary repositories
are kindly provided by `GitHub <https://github.com/sireum>`__ and 
`Bintray <https://bintray.com/sireum>`__, respectively.

Any opinions, findings, conclusions, or recommendations expressed in
this material are those of the authors and do not necessarily reflect
the views of the previously mentioned institutions.

.. raw:: html

           </div>
         </div>
       </div>
       <div class="col-md-4">
         <div class="panel panel-default" style="height:375px">
           <div class="panel-heading">
             <h3 class="panel-title">Contact</h3>
           </div>
           <div class="panel-body">
             <a href="http://santoslab.org">SAnToS Laboratory</a><br/> 
             <a href="http://www.cis.ksu.edu">Computing and Information Sciences Department</a><br/>
             <a href="http://www.ksu.edu">Kansas State University</a><br/>
             234 <a href="http://www.k-state.edu/maps/buildings/N/">Nichols Hall</a><br/>
             <a href="http://www.ci.manhattan.ks.us/">Manhattan</a>, <a href="http://www.kansas.gov/">KS</a> <a href="https://www.google.com/maps/place/Manhattan,+KS+66506">66506</a><br/>
             Phone: (785) 532-6350<br/>
             Fax: (785) 532-7353<br/>
             Email: <a href="mailto:contact@santoslab.org">contact@santoslab.org</a>
           </div>
         </div>
       </div>
     </div>
   </div>

