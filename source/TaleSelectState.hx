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

		selections.set("Back", () ->
		{
			FlxG.switchState(() -> new MenuState());
		});

                var index:Int = 0;
                var talefolder:Array<String> = FileManager.readDirectory(FileManager.getDataFile('stories/', ourtale));
                talefolder.remove('data-goes-here.txt');

                for (tale in talefolder)
                {
                        var talename:String = tale.split('.')[0];
                        trace(talename);

			selections.set('$talename', () -> switchToStoryState(ourtale, tale));

                        index++;
		}
	}

	function switchToStoryState(ourtale:PathTypes = DEFAULT, story:String = 'tale1'):Void
	{
		FlxG.switchState(() -> new StoryState(ourtale, story));
	}
}
