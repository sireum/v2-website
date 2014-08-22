*******************
Crypto API Misuse
******************

Patterns
##########

We found several examples of Crypto API misuse. We observe a few interesting patterns:

1. Encrypt OAuth token using AES ECB mode, then store it in SharedPreference. (The app: hu.sanomabp.citromail.* from Google Play)
2. Encrypt the password using AES ECB mode. (The app: diesel.peko.ninkyodobrowser.* from Google Play)


