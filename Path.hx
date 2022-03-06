package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxG;

class Path
{
      // xDDdddDDDdd!!!1!1
      public static function getFrames(location:String)
      {
           return FlxAtlasFrames.fromSparrow('assets/images/' + location + '.png', 'assets/images/' + location + '.xml');
      }
      public static function getGraphic(?x:Float, ?y:Float, image:String)
      {
           return new FlxSprite(x,y).loadGraphic('assets/images/' + image + '.png');
      }
      public static function playSound(sound:String)
      {
           return FlxG.sound.play('assets/sounds/' + sound + TitleState.soundExt);
      }
}