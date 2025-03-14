package;

import flixel.FlxG;
import sinlib.utilities.FileManager.PathTypes;
import sinlib.utilities.FileManager;

class TaleSelectState extends MenuState
{
	override public function new(ourtale:PathTypes = DEFAULT)
	{
		super();

		selections = [];

                var index:Int = 0;
                var talefolder:Array<String> = FileManager.readDirectory(FileManager.getDataFile('stories/', ourtale));
                talefolder.remove('data-goes-here.txt');

                for (tale in talefolder)
                {
                        var talename:String = tale.split('.')[0];
                        trace(talename);

                        selections.set(talename, () ->
                        {
                                FlxG.switchState(() -> new MenuState());
                        });

                        index++;
                }

		selections.set("Back", () ->
		{
			FlxG.switchState(() -> new MenuState());
		});
	}
}
