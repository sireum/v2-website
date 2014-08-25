Intent Injection
##################

Intent Injection Examples
*****************************

We found several examples of Intent injection. We observe a few interesting patterns.

1. App **name**: com.fcbh.dbp.BibleSocietyOfPhilippines; **Source**: Google Play 

   Detected **Problem**: The attacker injects an “url” string into the app through an Intent, and the app accesses the "url" later. :doc:`(More Details)<problemDetails/injectionDetails/app1Details>`

2. App **name**: com.kamagames.notepad; **Source**: Google Play 

   Detected **Problem**: The destination of an ICC depends on an incoming intent controlled by the attacker. :doc:`(More Details)<problemDetails/injectionDetails/app2Details>`


