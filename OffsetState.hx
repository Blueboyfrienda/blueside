package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;
import lime.app.Application;

class OffsetState extends MusicBeatState
{
    public static var sick:FlxSprite;
    public var tracking:Bool = false;
    // public var followMouse:FlxPoint;
	public var strumLine:FlxSprite;
	public var strumLineNotes:FlxTypedGroup<FlxSprite> = null;
	public var playerStrums:FlxTypedGroup<FlxSprite> = null;
	public var aiStrums:FlxTypedGroup<FlxSprite> = null;
	// var checkControls:Array<Bool> = [controls.LEFT_P, controls.DOWN_P, controls.UP_P, controls.RIGHT_P];
	// var replicate:Array<String> = ['left', 'down', 'up', 'right'];
	var guide:FlxText;
    override public function create()
    {
        FlxG.mouse.useSystemCursor = false;
		FlxG.mouse.load("assets/images/weeb/pixelUI/hand_textbox.png", 3, 0, 0);

		FlxG.mouse.visible = true;

		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic('assets/images/stageback.png');
		bg.antialiasing = true;
		bg.setGraphicSize(Std.int(bg.width * 0.75));
		bg.updateHitbox();
		bg.scrollFactor.set();
		bg.x += 350;
		add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic('assets/images/stagefront.png');
		stageFront.setGraphicSize(Std.int(stageFront.width * 0.85));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set();
		stageFront.x += 350;
		add(stageFront);

		var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic('assets/images/stagecurtains.png');
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.65));
		stageCurtains.updateHitbox();
		stageCurtains.antialiasing = true;
		stageCurtains.x += 350;
		stageCurtains.scrollFactor.set();

		add(stageCurtains);

		var guide:FlxText = new FlxText(0,0, "", 32);
		guide.setFormat("assets/fonts/vcr.ttf", 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		guide.borderQuality = 1;
		guide.borderSize = 1.5;
		guide.text = "Guide\n\nClick to change the rating's offset\n(You can also use controls to change the offset)\nEsc to confirm and go back\nYou can also use the notes to locate your offset\n";
		guide.screenCenter();
		add(guide);

        sick = Path.getGraphic("sick");
		sick.screenCenter();
		sick.antialiasing = true;
		sick.setGraphicSize(Std.int(sick.width * 0.7));
		sick.updateHitbox();

		sick.x = FlxG.save.data.offsetx;
		sick.y = FlxG.save.data.offsety;

		add(sick);

		strumLine = new FlxSprite(0, 50).makeGraphic(1, 10);
		strumLine.scrollFactor.set();

		playerStrums = new FlxTypedGroup<FlxSprite>();
		aiStrums = new FlxTypedGroup<FlxSprite>();

		if (FlxG.save.data.downscroll)
			strumLine.y = FlxG.height - 165;

		strumLineNotes = new FlxTypedGroup<FlxSprite>();
		add(strumLineNotes);

		/* followMouse = new FlxPoint(0, 0);
        followMouse.x = sick.getGraphicMidpoint().x;
        followMouse.y = sick.getGraphicMidpoint().y;

        FlxG.camera.focusOn(followMouse); */

		generateArrows(0);
		generateArrows(1);

        super.create();
    }
    override function update (elapsed:Float)
    {
	   playerStrums.forEach(function(spr:FlxSprite)
	   {
		  spr.animation.play("static", true);
	   });
       if (controls.LEFT_P)
           sick.x -= 10;
       if (controls.RIGHT_P)
           sick.x += 10;
       if (controls.UP_P)
           sick.y -= 10;
       if (controls.DOWN_P)
           sick.y += 10;
       else if (FlxG.mouse.justPressed){
           sick.x = FlxG.mouse.x - 35;
           sick.y = FlxG.mouse.y - 50;
       }
       if (controls.BACK)
	   {
	       FlxG.save.data.offsetx = sick.x;
		   FlxG.save.data.offsety = sick.y;

           FlxG.switchState(new OptionsState());
	   }

	   FlxG.save.flush();
    }

    function generateArrows(player:Int):Void
    {
        for (i in 0...4)
		{
			// FlxG.log.add(i);

			var babyArrow:FlxSprite = new FlxSprite(0, strumLine.y);

			babyArrow.frames = FlxAtlasFrames.fromSparrow('assets/images/NOTE_assets.png', 'assets/images/NOTE_assets.xml');
			babyArrow.animation.addByPrefix('green', 'arrowUP');
			babyArrow.animation.addByPrefix('blue', 'arrowDOWN');
			babyArrow.animation.addByPrefix('purple', 'arrowLEFT');
			babyArrow.animation.addByPrefix('red', 'arrowRIGHT');

			babyArrow.antialiasing = true;
			babyArrow.setGraphicSize(Std.int(babyArrow.width * 0.7));

			switch (Math.abs(i))
			{
				case 0:
					babyArrow.x += Note.swagWidth * 0;
					babyArrow.animation.addByPrefix('static', 'arrowLEFT');
				case 1:
					babyArrow.x += Note.swagWidth * 1;
					babyArrow.animation.addByPrefix('static', 'arrowDOWN');
				case 2:
					babyArrow.x += Note.swagWidth * 2;
					babyArrow.animation.addByPrefix('static', 'arrowUP');
				case 3:
					babyArrow.x += Note.swagWidth * 3;
					babyArrow.animation.addByPrefix('static', 'arrowRIGHT');
			}

			babyArrow.ID = i;

			babyArrow.updateHitbox();
		    babyArrow.scrollFactor.set();

		    switch (player)
		    {
			     case 0:
				     aiStrums.add(babyArrow);
			     case 1:
				     playerStrums.add(babyArrow);
		    }

	 	    babyArrow.animation.play('static');
		    babyArrow.x += 50;
		    babyArrow.x += ((FlxG.width / 2) * player);

	        strumLineNotes.add(babyArrow);
		}
	}
}