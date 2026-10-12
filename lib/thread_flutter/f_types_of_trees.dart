// *************** Widget tree ***************

/*
Scaffold
 ├── AppBar
 │    └── Text("Demo")
 └── Center
      └── Column
           ├── Text("Hello")
           └── ElevatedButton
                └── Text("Click")

 Parent Widgets holds the child widgets

Defines UI structure
Rebuilt during Build Phase
Compared (diffed) to update UI efficiently
*/


// *************** Element tree ***************

/*
ScaffoldElement
 ├── AppBarElement
 │    └── TextElement("Demo")
 └── CenterElement
      └── ColumnElement
           ├── TextElement("Hello")
           └── ElevatedButtonElement
                └── TextElement("Click")

👉 Every widget creates a corresponding Element
✔ Reuse TextElement
✔ Update only data

Without Element tree
--------------------
❌ Entire UI recreated every time

With Element tree
-----------------
✔ Only changed parts update
✔ Better performance
*/


// *************** Raster tree ***************

/*
RenderView
 └── RenderScaffold
      ├── RenderAppBar
      │    └── RenderParagraph("Demo")
      └── RenderPositionedBox (Center)
           └── RenderFlex (Column)
                ├── RenderParagraph("Hello")
                └── RenderConstrainedBox (Button)
                     └── RenderParagraph("Click")

The render tree is responsible for actual UI, rendering made of render objects.
Handles layout (Size & Position), Painting (drawing pixels), Hit testing (touch detection) and mutable type.

*/
