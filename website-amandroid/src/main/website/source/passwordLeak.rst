Password Leakage
##################


Password Leakage Examples
**************************

We have found several examples of password leakage. We observe a few interesting patterns.

1. App **name**: com.datpiff.mobile; **Source**: Google Play

   Detected **Problem**: the password is logged in clear text.
2. App **name**: com.toystorymusic.musicapp; **Source**: Malware set from a third-party vendor

   Detected **Problem**: the password is reaching a Network API over HTTP channel.
3. App **name**: om.snappii.angel.investing.news.v10; **Source**: Google Play

   Detected **Problem**: the password is saved in SharedPreference.  :doc:`(More Details)<problemDetails/pwLeakageDetails/app3Details>`


