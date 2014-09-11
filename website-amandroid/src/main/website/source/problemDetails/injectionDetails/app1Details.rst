com.fcbh.dbp.BibleSocietyOfPhilippines 
######################################

Intent Injection Details
*****************************

App **name**: com.fcbh.dbp.BibleSocietyOfPhilippines.apk

Public **Component**: com.subsplash.thechurchapp.TwitterLoginActivity

Found 1 path in the data dependency graph (DDG).

The path is: 

from **Source**: (com.subsplash.thechurchapp.TwitterLoginActivity:EntryNode, icc_source)

to **Sink**: (L06551a, icc_sink)

The nodes and edges on the path are (with calling context length k = 1): 
::
	Entry@(environment of TwitterLoginActivity) -> Call@(launchTwitterTweetActivity, L0654fc)(onCreate, L065654)-> Call@(launchTwitterTweetActivity, L065508)(onCreate, L065654)-> Call@(launchTwitterTweetActivity, L065514)(onCreate, L065654)-> Call@(launchTwitterTweetActivity, L06551a)(onCreate, L065654)

More details:

The TwitterLoginActivity is a public component. We observe that its *onCreate* method invokes *launchTwitterTweetActivity* method, which illustrates the above path. Inside this method at **Line 06551a** an Intent is sent out, which contains an *Url* that originated from the incoming Intent. The *Url* will be used in the destination Activity, it potentially implies that their is a injection vulnerability.

The code of *launchTwitterTweetActivity* method is as follows:
::
	procedure `void` `launchTwitterTweetActivity` (`TwitterLoginActivity` v5){
		#L065490.   v0:= new `Intent`;
		#L065494.   v3:= `@@TwitterTweetActivity.class`;
		#L065498.   call temp:=  `Intent.<init>`(v0, v5, v3);
		#L06549e.   call temp:=  `TwitterLoginActivity.getIntent`(v5);
		#L0654a4.   v3:= temp  @type `object`; //v3 is the incoming Intent
		#L0654a6.   v4:= "status" @type `object`;
		#L0654aa.   call temp:=  `Intent.hasExtra`(v3, v4);
		#L0654b0.   v3:= temp;
		#L0654b2.   if v3 == 0 then goto L0654dc;
		#L0654b6.   call temp:=  `TwitterLoginActivity.getIntent`(v5);
		#L0654bc.   v3:= temp  @type `object`;
		#L0654be.   call temp:=  `android.content.Intent.getExtras`(v3);
		#L0654c4.   v3:= temp  @type `object`;
		#L0654c6.   v4:= "status" @type `object`;
		#L0654ca.   call temp:=  `android.os.Bundle.getString`(v3, v4);
		#L0654d0.   v1:= temp  @type `object`;
		#L0654d2.   v3:= "status" @type `object`;
		#L0654d6.   call temp:=  `android.content.Intent.putExtra`(v0, v3, v1);
		#L0654dc.   call temp:=  `TwitterLoginActivity.getIntent`(v5) ;
		#L0654e2.   v3:= temp  @type `object`;
		#L0654e4.   v4:= "url" @type `object`;
		#L0654e8.   call temp:=  `Intent.hasExtra`(v3, v4);
		#L0654ee.   v3:= temp;
		#L0654f0.   if v3 == 0 then goto L06551a;
		#L0654f4.   call temp:=  `TwitterLoginActivity.getIntent`(v5);
		#L0654fa.   v3:= temp  @type `object`;
		#L0654fc.   call temp:=  `Intent.getExtras`(v3);
		#L065502.   v3:= temp  @type `object`;
		#L065504.   v4:= "url" @type `object`;
		#L065508.   call temp:=  `Bundle.getString`(v3, v4);
		#L06550e.   v2:= temp  @type `object`; //v2 is the url coming from the incoming Intent
		#L065510.   v3:= "url" @type `object`;
		#L065514.   call temp:=  `Intent.putExtra`(v0, v3, v2);
		#L06551a.   call temp:=  `TwitterLoginActivity.startActivity`(v5, v0); // The outgoing Intent contains the above url, which will be used in the destination Activity. Probably, it implies that their is a injection vulnerability.
		#L065520.   call temp:=  `TwitterLoginActivity.close`(v5);
		#L065526.   return @void ;
		}

