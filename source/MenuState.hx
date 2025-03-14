package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import sinlib.utilities.TryCatch;

class MenuState extends FlxState
{
	public var selections:Map<String, Dynamic> = [
		"War of the seven worlds" => () ->
		{
			trace('Going to the story');
			FlxG.switchState(() -> new TaleSelectState(WAR_OF_THE_SEVEN_WORLDS));
		},
		#if sys "Leave" => () -> Sys.exit(0) #end
	];
	var selectionText:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
	var selected:Int = 0;
	public static var ranCreate:Bool = false;

	override public function create()
	{
		add(selectionText);
		updateSelectionText();

		super.create();
		ranCreate = true;
	}

	var max_selection:Int = 0;

	override public function update(elapsed:Float)
	{
		if (ControlManagement.anyJustReleased(ControlManagement.up_keys))
		{
			selected--;
			if (selected < 0)
			{
				trace('MIN');
				selected = 0;
			}
			updateSelectionText();
		}
		else if (ControlManagement.anyJustReleased(ControlManagement.down_keys))
		{
			selected++;
			if (selected > max_selection)
			{
				trace('MAX');
				selected = max_selection;
			}
			updateSelectionText();
		}

		if (ControlManagement.anyJustReleased(ControlManagement.selection_keys))
		{
			selections.get(selectionText.members[selected].text)();
		}

		super.update(elapsed);
	}

	function updateSelectionText():Void
	{
		TryCatch.tryCatch(() ->
		{
			for (member in selectionText.members)
			{
				member.destroy();
				selectionText.members.remove(member);
			}
		});

		var index:Int = 0;
		for (text in selections.keys())
		{
			if (!ranCreate)
			{
				trace(text);
			}
			var textfield:FlxText = new FlxText(16, 0, 0, text, 16);
			textfield.y = 16 + (24 * index);

			if (selected == index)
			{
				textfield.color = 0xFFFF00;
			}

			selectionText.add(textfield);

			index++;
		}
		max_selection = index - 1;
	}
}
