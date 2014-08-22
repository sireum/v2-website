*******************
Intent Injection
******************

Patterns
##########

We found several examples of Intent injection. We observe a few interesting patterns:

1. The attacker injects an “url” string in an app P through an Intent, and P accesses the "url" later. (The app: com.subsplash.thechurchapp.* from Google Play)
2. The destination of an ICC depends on an incoming intent controlled by the attacker. (The app: com.kamagames.notepad.* from Google Play)


