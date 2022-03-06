package;

import flixel.FlxG;

class DefaultData
{
   public static function setDefault()
   {
       if (FlxG.save.data.middlescroll == null)
           FlxG.save.data.middlescroll = false;

       if (FlxG.save.data.deathnotes == null)
           FlxG.save.data.deathnotes = false;

       if (FlxG.save.data.ghosttaping == null)
           FlxG.save.data.ghosttaping = false;

       if (FlxG.save.data.chaos == null)
           FlxG.save.data.chaos = false;

       if (FlxG.save.data.dfjk == null)
           FlxG.save.data.dfjk = false;

       if (FlxG.save.data.downscroll == null)
           FlxG.save.data.downscroll = false;

       if (FlxG.save.data.antimash == null)
           FlxG.save.data.antimash = false;
    }
}