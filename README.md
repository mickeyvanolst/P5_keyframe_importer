P5_keyframe_importer
====================

A simple script that can import recorded motion data from Processing into After Effects.

Implement the Processing sketch's XML function into your sketch and record the animations to the XML file.
Then simply run the AE Script and import the XML file, each object will become a shape layer (ellipse) and all your animations will be stored in keyframes.

This stuff comes as it is, feel free to improve or build upon. 

Note:
Importing a huge amount of objects is a very slow process, be patient!

Q: Why make this?
A: We needed a workflow where we could use box2D's physics in AE, people that work with the Newton plugin in AE will probably recognize this kind of method.
