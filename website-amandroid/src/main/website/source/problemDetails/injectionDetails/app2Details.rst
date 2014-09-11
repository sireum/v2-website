com.kamagames.notepad 
######################

Intent Injection Details
*****************************

App **name**: com.kamagames.notepad.apk

Public **Component**: com.kamagames.notepad.NotesList

Found 1 path in the data dependency graph (DDG).

The path is: 

from **Source**: (com.kamagames.notepad.NotesList:EntryNode, icc_source)

to **Sink**: (L002dde, icc_sink)

The nodes and edges on the path are: 
::
	Entry@(environment method of NotesList) -> Call@(onListItemClick,L002d74)-> Call@(onListItemClick,L002d7c)-> Call@(onListItemClick,L002dde)

More details:

The *NotesList* Activity is a public component, and it extends *ListActivity*. So, upon user’s  action, the following method (*onListItemClick*) in *NotesList* can be invoked. Inside this method, we observe that at **Line 002dde** an Intent is sent out, which contains an *Uri* that originated from the **incoming Intent**.

The *onListItemClick* method of *NodeList* illustrates the above path:
::

	procedure `void` `onListItemClick` (`NotesList` v3, `ListView` v4 , `View` v5, `int` v6, `long` v7) {
	 temp, v0, v1, v2, v8;
	 #L002d6c.   call temp:=  `com.kamagames.notepad.NotesList.getIntent`(v3);
	 #L002d72.   v0:= temp  @type `object`; // This is the incoming Intent
	 #L002d74.   call temp:=  `android.content.Intent.getData`(v0);
	 #L002d7a.   v0:= temp  @type `object`; // This is the Uri in the Incoming Intent
	 #L002d7c.   call temp:=  `android.content.ContentUris.withAppendedId`(v0, v7, v8);
	 #L002d82.   v0:= temp  @type `object`;
	 #L002d84.   call temp:=  `com.kamagames.notepad.NotesList.getIntent`(v3);
	 #L002d8a.   v1:= temp  @type `object`;
	 #L002d8c.   call temp:=  `android.content.Intent.getAction`(v1);
	 #L002d92.   v1:= temp  @type `object`;
	 #L002d94.   v2:= "android.intent.action.PICK" @type `object`;
	 #L002d98.   call temp:=  `java.lang.String.equals`(v2, v1);
	 #L002d9e.   v2:= temp;
	 #L002da0.   if v2 != 0 then goto L002db4;
	 #L002da4.   v2:= "android.intent.action.GET_CONTENT" @type `object`;
	 #L002da8.   call temp:=  `java.lang.String.equals`(v2, v1);
	 #L002dae.   v1:= temp;
	 #L002db0.   if v1 == 0 then goto L002dd0;
	 #L002db4.   v1:= -1I  @length `4`;
	 #L002db6.   v2:= new `android.content.Intent`;
	 #L002dba.   call temp:=  `android.content.Intent.<init>`(v2);
	 #L002dc0.   call temp:=  `android.content.Intent.setData`(v2, v0);
	 #L002dc6.   v0:= temp  @type `object`;
	 #L002dc8.   call temp:=  `com.kamagames.notepad.NotesList.setResult`(v3, v1, v0);
	 #L002dce.   return @void ;
	 #L002dd0.   v1:= new `android.content.Intent`;
	 #L002dd4.   v2:= "android.intent.action.EDIT" @type `object`;
	 #L002dd8.   call temp:=  `android.content.Intent.<init>`(v1, v2, v0); // v0 is the incoming Uri
	 #L002dde.   call temp:=  `com.kamagames.notepad.NotesList.startActivity`(v3, v1); // The destination activity will depend on Uri v0, which is an injection vulnerability.
	 #L002de4.   goto L002dce;
	}


