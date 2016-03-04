.. toctree::
   :hidden:

   documentation
   software
   problems
   service
   team

Amandroid
#################

.. raw:: html

   <div class="container-fluid">
     <div class="row">
       <div class="col-md-12">
         <img src="_static/amandroid.png" />
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
         <div class="panel panel-default" style="height:100%">
           <div class="panel-heading">
             <h3 class="panel-title">About</h3>
           </div>
           <div class="panel-body">
Amandroid is a static analysis framework for Android apps.

The Android platform is immensely popular. However, malicious or vulnerable applications have been reported to cause several security problems. Currently there is no effective method that a market operator can use to vet apps entering a market (e.g., Google Play). 

Prior works using static analysis to address Android app security problems more focus on specific problems and built specialized tools for them. We observe that a large portion of those security issues can be resolved by addressing one underlying core problem -- capturing semantic behaviors of the app such as object points-to and control-/data-flow information. Thus, we designed a new approach to conducting static analysis for vetting Android apps, and built a generic framework, called Amandroid, which does flow- and context-sensitive data flow analysis in an inter-component way.

Our approach shows that a comprehensive (tracking all objects) static analysis method on Android apps is totally feasible in terms of computation resources, and the Amandroid framework is flexible and easy to be extended for many types of specialized security analyses. 

Since Amandroid directly handles Inter-component control and data flows, it can be used to address security problems that result from interactions among multiple components from either the same or different apps. Amandroid analysis is sound in that it can provide assurance of the absence of the specified security problems in an app with well-specified and reasonable assumptions on the Android runtime and its library.

On top of Amandroid we performed certain specific security analyses, for instance, a) user password flow tracking, b) intent injection detection, and c) crypto API misuse checking. We apply those analyses on hundreds of apps collected from Google Play's popular apps and a third-party security company, and the results show that it is capable of finding real security issues and efficient enough in terms of analysis time.

.. raw:: html

             <br>
             <br>
           </div>
         </div>
       </div>
       <div class="col-md-4">
         <div class="panel panel-default" style="height:100%">
           <div class="panel-heading">
             <h3 class="panel-title">Contact</h3>
           </div>
           <div class="panel-body">

| `Argus Laboratory <http://arguslab.org>`__
| `Computer Science and Engineering Department <http://www.usf.edu/engineering/cse/>`__
| `University of South Florida <http://www.usf.edu/>`__
| 4202 E. Fowler Avenue, ENB 118
| Tampa, FL, 33620
|
| `SAnToS Laboratory <http://santoslab.org>`__
| `Computing and Information Sciences Department <http://www.cis.ksu.edu>`__
| `Kansas State University <http://www.ksu.edu>`__
| 234 Nichols Hall
| Manhattan , KS, 66506
|
| Email: amandroid@sireum.org 

.. raw:: html

           </div>
         </div>
       </div>
       <div class="col-md-4">
         <div class="panel panel-default" style="height:100%">
           <div class="panel-heading">
             <h3 class="panel-title">Acknowledgement</h3>
           </div>
           <div class="panel-body">

The development of Amandroid is supported in part by the US Air Force Office
of Scientific Research (AFOSR) grant no. FA9550-09-0138 and 
by the U.S. National Science  Foundation (NSF)
under grant no. 
`0954138 <http://www.nsf.gov/awardsearch/showAward?AWD_ID=0954138>`__ and 
`1018703 <http://www.nsf.gov/awardsearch/showAward?AWD_ID=1018703>`__.
It was also supported by the NSF CAREER
award `0644288 <http://www.nsf.gov/awardsearch/showAward?AWD_ID=0644288>`__.
Any opinions, findings, conclusions, or recommendations expressed in
this material are those of the authors and do not necessarily reflect
the views of the previously mentioned institutions.

.. raw:: html
           </div>
         </div>
       </div>
     </div>
   </div>

