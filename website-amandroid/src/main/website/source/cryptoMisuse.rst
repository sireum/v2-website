Crypto API Misuse
##################

Crypto API Misuse Examples
***************************

We found several examples of Crypto API misuse. We observe a few interesting patterns.

1.  App **name**: hu.sanomabp.citromail; **Source**: Google Play

    Detected **Problem**: Encrypt OAuth token using AES ECB mode, then store it in SharedPreference.

2.  App **name**: diesel.peko.ninkyodobrowser; **Source**: Google Play

    Detected **Problem**: Encrypt the password using AES ECB mode.


