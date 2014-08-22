*******************
OAuth Token Leakage
******************

Patterns
##########

We found several examples of OAuth Token leakage. We observe a few interesting patterns:

1. The implicit intent carrying the token can possibly reach a malicious app. (The app: com.skout.android.* from Google Play)
2. A malicious app having *Log*-read permission can grab the OAuth token. (The app: com.skout.android.* and com.keek.social.* from Google Play)

Note: the above type of token leakage is very different from the explicit token discoveries reported in a recent work, *PlayDrone*.
