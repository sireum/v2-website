OAuth Token Leakage
#####################

OAuth Token Leakage Examples
******************************

We found several examples of OAuth Token leakage. We observe a few interesting patterns.

1. App **name**: com.skout.android; **Source**: Google Play 

   Detected **Problem**: The implicit intent carrying the token can possibly reach a malicious app. The token is also reaching the *Log* in the *info* mode.

2. App **name**: com.keek.social; **Source**: Google Play 

   Detected **Problem**: The OAuth token is reaching the *Log* in the *debug* mode.

Note: the above type of token leakage is very different from the explicit token discoveries reported in a recent work, *PlayDrone*.
