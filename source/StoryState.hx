package;

import flixel.FlxState;
import flixel.text.FlxText;
import sinlib.utilities.FileManager.PathTypes;
import sinlib.utilities.FileManager;

class StoryState extends FlxState
{
        var textfield:FlxText = new FlxText(0,0,0,"Hello world", 16);

        override public function new(ourtale:PathTypes = DEFAULT, story:String = 'tale1') {
                super();

                textfield.alignment = CENTER;
                textfield.text = FileManager.readFile(FileManager.getDataFile('stories/$story', ourtale));
                textfield.screenCenter();
        }

        override function create() {
                super.create();

                add(textfield);
        }
        
}