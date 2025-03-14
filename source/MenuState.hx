package;

import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class MenuState extends FlxState
{
	var selections:Map<String, Dynamic> = [
		"War of the seven worlds" => () -> new MenuState(),
		#if sys "Leave" => () -> Sys.exit(0) #end
	];
	var selectionText:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();

	override public function create()
	{
		add(selectionText);

		var index:Int = 0;
		for (text in selections.keys())
		{
			trace(text);
			var textfield:FlxText = new FlxText(16, 0, 0, text, 16);
			textfield.y = 16 + (24 * index);

			selectionText.add(textfield);

			index++;
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
