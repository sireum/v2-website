.. _approach:

The Amandroid Approach
#########################

.. _IR-tran:

IR Translation
====================

Amandroid decompresses the input app apk file and retrieves a dex file and covert it to an IR format for subsequent analysis. Our dex2IR translator is a modification of the original dexdump tool shipped with the Android platform tool set; the C++ source of the original dexdump is available in the Android build package, and we modified it so that it can also produce the app representation in our IR format.

.. _env-model:

Environment Modeling
====================

An Android app is not a closed system; the Android system provides an environment in which the app runs. The code that may execute during the lifetime of an app is not all present in the app’s package. The Android system (which includes the Android runtime) does a bulk of the work in addition to that by the app’s code. With the “sensitive-sms” app example in ``Section 2``, we demonstrated that a static analyzer needs to model the Android system to analyze the system-defined control flows in the app3. Our modeling of the Android environment follows that of `FlowDroid <http://sseblog.ec-spride.de/tools/flowdroid/>`_ with a few crucial extensions described below.
In Android, numerous types of events (e.g., system events, UI events, etc.) can trigger callback methods defined in the app. As an example, while an Activity A is running, if another Activity B comes to the foreground, it is considered an event. This event can trigger A.onPause, which is either defined in the app’s code, or in the Android framework if the developer did not override the default method. Figure 1b depicts the life cycle of an Activity. There are seven important life-cycle methods of an Activity: onCreate, onPause, onResume, etc.; they each represent a state in the transition diagram. Android documentation specifies other states such as Activity running and Activity shut down.
Amandroid introduces component-level models instead of FlowDroid’s whole app-level model. The environment of a component C represents a main method, EC, which takes as parameter an incoming intent i and invokes C’s life-cycle methods (e.g., onCreate or onReceive) based on C’s type (Activity, Service, Broadcast Receiver, etc.) and other callback methods (e.g., onLocationChanged) so that all possible paths are included. This component-level model is more effective in capturing the impact of the Android system on both the control and data of an app’s execution. The part below the dotted line in Figure 1a highlights this idea: a dedicated environment for each component invokes the set of implemented callback methods; this is the control part of modeling Android’s environment. In addition, the environment also keeps tracks of the intents received by the component (e.g., Environment of Leaker remembers that p3 was sent to start Leaker) so that the intents could be made available when necessary (e.g., to serve getIntent() in the Leaker component); this is the data part of modeling Android’s environment. EC also passes the intent parameter when necessary for other relevant methods (e.g., onReceive).Amandroid generates Ec automatically. First, it collects basic information from the resource files in the apk and uses this information to collect layout callback methods. It then generates the body of Ec with lifecycle methods based on the type of C. Finally, it collects other callback methods (e.g., onLocationChanged) in C (through a reachability analysis) in an incremental fashion (following the FlowDroid approach). All of these are done before performing the data flow analysis as discussed in ``Section 3.3``.

.. _IDFG:

Inter-component Data Flow Graph (IDFG)
====================

.. _DDG:

Data Dependence Graph (DDG)
====================

Using Amandroid for Security Analyses