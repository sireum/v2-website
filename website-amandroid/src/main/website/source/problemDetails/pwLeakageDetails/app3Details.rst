com.snappii.angel_investing__news_v10.apk 
######################################

Password Leakage Details
*****************************

App **name**: com.snappii.angel_investing__news_v10.apk

**Component**: com.snappii.angel_investing__news_v10.activities.PreviewLoginActivity

Found several leakage paths in the data dependency graph (DDG).

One sample path is: 

from **Source**: (Landroid/app/Activity;.findViewById:(I)Landroid/view/View;, password_access_api_source)

to **Sink**: (Landroid/content/SharedPreferences\$Editor;.putString:(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences\$Editor;, icc_sink)

The nodes and edges on the path are (with calling context length k = 1): 
::
	Call@(onClick,L109f40)(environmnet method, L1420) -> Call@(onClick,L109f5c)(environment method, L1420) -> Call@(onClick,L109f64)(environment method, L1420) -> Call@(onClick,L10a054)(environment method, L1420) -> (Call@(onClick,L10a038)(environment method, L1420), Argument 0)

More details:

The PreviewLoginActivity is a component. Our *environment* method (auto-generated) invokes *onClick* method of an inner class named *PreviewLoginActivity\$1*, which illustrates the above path. Inside this method at **Line L109f40** the *password* is retrieved. Then, the *password* is saved in the SharedPreference at **Line L10a038**, which is a bad practice as per the security standard of a sensitive item like a password.

