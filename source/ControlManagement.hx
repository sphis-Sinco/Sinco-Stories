package;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class ControlManagement
{

        // Singular
        public static function pressed(Key:FlxKey):Bool
        {
                return anyPressed([Key]);
        }
        
        public static function justReleased(Key:FlxKey):Bool
        {
                return anyJustReleased([Key]);
        }
        
        public static function justPressed(Key:FlxKey):Bool
        {
                return anyJustPressed([Key]);
        }

        // Multiple
        public static function anyPressed(KeyArray:Array<FlxKey>):Bool
        {
                return FlxG.keys.anyPressed(KeyArray);
        }
        
        public static function anyJustReleased(KeyArray:Array<FlxKey>):Bool
        {
                return FlxG.keys.anyJustReleased(KeyArray);
        }
        
        public static function anyJustPressed(KeyArray:Array<FlxKey>):Bool
        {
                return FlxG.keys.anyJustPressed(KeyArray);
        }
        
}