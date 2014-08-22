*******************
Password Leakage
******************

Patterns
##########

We found several examples of password leakage. We observe a few interesting patterns:

1. the password is logged in clear text. (The app: com.datpiff.mobile.* from Google Play)
2. the password is reaching a Network API over HTTP channel. (The app: com.toystorymusic.musicapp.* from a third-party malware set)
3. the password is saved in SharedPreference. (The app: om.snappii.angel.investing.news.v10.* from Google Play)

Note: Case 2 stems from a third-party library for Twitter. The DDG and IDFG shows that the app sends the user’s password to http://api.twitter.com/1 (an HTTP connection). Interestingly, one can see that the URL is not currently working and only responds with a message “SSL is required.”

