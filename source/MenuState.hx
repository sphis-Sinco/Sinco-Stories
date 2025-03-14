package;

import flixel.FlxState;

class MenuState extends FlxState
{
	var selections:Map<String, Dynamic> = [
		"War of the seven worlds" => () -> new MenuState(),
		#if sys "Leave" => () -> Sys.exit(0) #end
	];

	override public function create()
	{
		for (text in selections.keys())
		{
			trace(text);
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
