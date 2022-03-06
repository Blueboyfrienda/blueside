package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import flixel.util.FlxTimer;

class OptionsState extends MusicBeatState
{
    public static var downscroll:FlxText;
	public static var ghosttap:FlxText;
    public static var dfjk:FlxText;
	public static var chaos:FlxText;
	public static var disappear:FlxText;
	public static var middlescroll:FlxText; // swapped but dc
	public static var antimash:FlxText;
	var offsettest:FlxText;
	var title:FlxText;
	var reminder:FlxText;
	var curOption:Int = 0;
	public static var shitass:Int = 0;
	public static var dipshitass:Int = 0;
	public static var dipshittyass:Int = 0;
	public static var dippyshittyass:Int = 0;
	var bg:FlxSprite;
    override function create()
    {
	    FlxG.mouse.visible = false;

        bg = Path.getGraphic("menuDesat");
		bg.scrollFactor.set();
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
        bg.color = 0xFF31b0d1;
		bg.antialiasing = true;
		add(bg);

        downscroll = new FlxText(1, 5, 0, "", 54);
		downscroll.scrollFactor.set();
		downscroll.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        downscroll.screenCenter();
		downscroll.x = 410;
		add(downscroll);

		/*
		   reminder that this shit is nearly as not as optimized as it should be
		   although it works so
		   if it works, its good to go for me
		*/

		title = new FlxText(1, 5, 0, "", 74);
		title.scrollFactor.set();
		title.setFormat("VCR OSD Mono", 74, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        title.screenCenter();
        title.text = "OPTIONS";
		title.x = downscroll.x + 100;
		title.y = downscroll.y - 125;
		add(title);

        dfjk = new FlxText(1, 5, 0, "", 54);
		dfjk.scrollFactor.set();
		dfjk.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        dfjk.x = downscroll.x;
        dfjk.y = downscroll.y + 50;
		add(dfjk);

		ghosttap = new FlxText(1, 5, 0, "", 54);
		ghosttap.scrollFactor.set();
		ghosttap.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        ghosttap.x = dfjk.x;
        ghosttap.y = dfjk.y + 50;
		add(ghosttap);

		chaos = new FlxText(1, 5, 0, "", 54);
		chaos.scrollFactor.set();
		chaos.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        chaos.x = ghosttap.x;
        chaos.y = ghosttap.y + 50;
		add(chaos);

		disappear = new FlxText(1, 5, 0, "", 54);
		disappear.scrollFactor.set();
		disappear.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        disappear.x = chaos.x;
        disappear.y = chaos.y + 50;
		add(disappear);

		middlescroll = new FlxText(1, 5, 0, "", 54);
		middlescroll.scrollFactor.set();
		middlescroll.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        middlescroll.x = disappear.x;
        middlescroll.y = disappear.y + 50;
		add(middlescroll);

		offsettest = new FlxText(1, 5, 0, "", 54);
		offsettest.scrollFactor.set();
		offsettest.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        offsettest.x = middlescroll.x;
        offsettest.y = middlescroll.y + 50;
		offsettest.text = "Set Offset";
		add(offsettest);

		antimash = new FlxText(1, 5, 0, "", 54);
		antimash.scrollFactor.set();
		antimash.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        antimash.x = downscroll.x;
        antimash.y = downscroll.y - 50;
		add(antimash);

		reminder = new FlxText(1, 5, 0, "", 54);
		reminder.scrollFactor.set();
		reminder.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        reminder.x = 20;
		reminder.text = "Press R to reset, ENTER to change";
		reminder.borderSize = 2;
		add(reminder);

		downscroll.text = "Middlescroll: OFF";
		dfjk.text = "DFJK Keybinds: OFF";
		ghosttap.text = "Ghost Arrows: OFF";
		chaos.text = "Chaos Mode: OFF";
		disappear.text = "Death Notes: OFF";
		middlescroll.text = "Downscroll: OFF";
		antimash.text = "Anti-Mashing: OFF";

		super.create();

		new FlxTimer().start(1.2, function(tmr:FlxTimer)
		{
		    if (bg.color == 0xFF31b0d1) FlxTween.color(bg, 1.2, 0xFF31b0d1, 0xFF66FF33, {ease: FlxEase.sineInOut});
			else if (bg.color == 0xFF66FF33) FlxTween.color(bg, 1.2, 0xFF66FF33, 0xFFff0041, {ease: FlxEase.sineInOut});
			else if (bg.color == 0xFFff0041) FlxTween.color(bg, 1.2, 0xFFff0041, 0xFFa800ff, {ease: FlxEase.sineInOut});
			else if (bg.color == 0xFFa800ff) FlxTween.color(bg, 1.2, 0xFFa800ff, 0xFF31b0d1, {ease: FlxEase.sineInOut});
			tmr.reset(1.2);
		});

		changeOption();
    }
	override function update (elapsed:Float)
	{
	   if (controls.UP_P)
	   {
	       FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
	       changeOption(-1);
	   }
	   if (controls.DOWN_P)
	   {
	       FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
	       changeOption(1);
	   }
	   if (controls.ACCEPT)
	   {
	      FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
	      switch (curOption)
		  {
		     case 0:
			    downscroll.text = "Middlescroll: ON";
				shitass += 1;
				if (shitass > 1)
				    shitass = 1;
				FlxG.save.data.middlescroll = true;
			 case 1:
			    dfjk.text = "DFJK Keybinds: ON";
				// Controls.scheme.Custom = true;
				FlxG.save.data.dfjk = true;
			 case 2:
				// Controls.scheme.Custom = true;
				dipshitass += 1;
				if (dipshitass > 1)
				    dipshitass = 1;
				FlxG.save.data.ghosttaping = true;
				if (FlxG.save.data.ghosttaping)
				    ghosttap.text = "Ghost Arrows: ON";
			 case 3:
			    chaos.text = "Chaos Mode: ON";
				dipshittyass += 1;
				if (dipshittyass > 1)
				    dipshittyass = 1;
				FlxG.save.data.chaos = true;
			 case 4:
			    disappear.text = "Death Notes: ON";
				dippyshittyass += 1;
				if (dippyshittyass > 1)
				    dippyshittyass = 1;
				FlxG.save.data.deathnotes = true;
			case 5:
				FlxG.save.data.downscroll = true;
				if (FlxG.save.data.downscroll)
				    middlescroll.text = "Downscroll: ON";
			case 6:
			    FlxG.switchState(new OffsetState());
			case 7:
				FlxG.save.data.antimash = true;
				if (FlxG.save.data.antimash)
				    antimash.text = "Anti-Mashing: ON";
		   }
		   trace("death notes active? -> " + FlxG.save.data.deathnotes);
		   trace("chaos active? -> " + FlxG.save.data.chaos);
		   trace("ghosttapping active? -> " + FlxG.save.data.ghosttaping);
		   trace("middlescroll active? -> " + FlxG.save.data.middlescroll);
		   trace("dfjk active? -> " + FlxG.save.data.middlescroll);
		   trace("downscroll active? -> " + FlxG.save.data.downscroll);
		   if (FlxG.save.data.dfjk)
		       controls.setKeyboardScheme(DFJK, true);
		}
		if (controls.RESET)
		{
		  FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
		  if (dfjk.text == "DFJK Keybinds: ON" && FlxG.save.data.dfjk){
		        dfjk.text = "DFJK Keybinds: OFF";
				controls.setKeyboardScheme(Solo, true);
		   }

		   if (downscroll.text == "Middlescroll: ON" && FlxG.save.data.middlescroll){
		        downscroll.text = "Middlescroll: OFF";
		   }

		   if (ghosttap.text == "Ghost Arrows: ON" && FlxG.save.data.ghosttaping){
		        ghosttap.text = "Ghost Arrows: OFF";
		   }

		   if (chaos.text == "Chaos Mode: ON" && FlxG.save.data.chaos)
		   {
		       chaos.text = "Chaos Mode: OFF";
		   }

		   if (disappear.text == "Death Notes: ON" && FlxG.save.data.deathnotes)
		   {
		       disappear.text = "Death Notes: OFF";
		   }

		   if (middlescroll.text == "Downscroll: ON" && FlxG.save.data.downscroll)
		   {
		       middlescroll.text = "Downscroll: OFF";
		   }
		   if (antimash.text == "Anti-Mashing: ON" && FlxG.save.data.antimash)
		   {
		       antimash.text = "Anti-Mashing: OFF";
		   }

		   FlxG.save.data.deathnotes = false;
		   FlxG.save.data.chaos = false;
		   FlxG.save.data.ghosttaping = false;
		   FlxG.save.data.middlescroll = false;
		   FlxG.save.data.dfjk = false;
		   FlxG.save.data.downscroll = false;
		   FlxG.save.data.antimash = false;

		   shitass -= 1;
		   dipshitass -= 1;
		   dipshittyass -= 1;
		   dippyshittyass -= 1;

		   if (shitass < 0)
		       shitass = 0;
		   if (dipshitass < 0)
		       dipshitass = 0;
		   if (dipshittyass < 0)
		       dipshittyass = 0;
		   if (dippyshittyass < 0)
		       dippyshittyass = 0;

		   trace("death notes active? -> " + FlxG.save.data.deathnotes);
		   trace("chaos active? -> " + FlxG.save.data.chaos);
		   trace("ghosttapping active? -> " + FlxG.save.data.ghosttaping);
		   trace("middlescroll active? -> " + FlxG.save.data.middlescroll);
		   trace("dfjk active? -> " + FlxG.save.data.middlescroll);
		   trace("downscroll active? -> " + FlxG.save.data.downscroll);
		}
		if (controls.BACK)
		{
		   FlxG.switchState(new MainMenuState());
		}
		// actually having a mental breakdown over this

		super.update(elapsed);

		if (controls.keyboardScheme == DFJK)
		{
		     dfjk.text = "DFJK Keybinds: ON";
		}

		if (FlxG.save.data.middlescroll){
		     downscroll.text = "Middlescroll: ON";
		}
		if (FlxG.save.data.ghosttaping){
		     ghosttap.text = "Ghost Arrows: ON";
		}
		if (FlxG.save.data.chaos)
		{
		     chaos.text = "Chaos Mode: ON";
		}
		if (FlxG.save.data.deathnotes)
		{
		     disappear.text = "Death Notes: ON";
		}
		if (FlxG.save.data.downscroll)
		{
		     middlescroll.text = "Downscroll: ON";
		}
		if (FlxG.save.data.antimash)
		{
		     antimash.text = "Anti-Mashing: ON";
		}

		FlxG.save.flush();
	}
    function changeOption(change:Int = 0)
	{
		curOption += change;

		if (curOption < 0)
			curOption = 7;
		if (curOption > 7)
			curOption = 0;

		switch (curOption)
		{
			case 0:
			   downscroll.alpha = 1;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 0.6;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 0.6;
			case 1:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 1;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 0.6;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 0.6;
			case 2:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 1;
			   chaos.alpha = 0.6;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 0.6;
			case 3:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 1;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 0.6;
			case 4:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 0.6;
			   disappear.alpha = 1;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 0.6;
			case 5:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 0.6;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 1;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 0.6;
			case 6:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 0.6;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 1;
			   antimash.alpha = 0.6;
			case 7:
			   downscroll.alpha = 0.6;
			   dfjk.alpha = 0.6;
			   ghosttap.alpha = 0.6;
			   chaos.alpha = 0.6;
			   disappear.alpha = 0.6;
			   middlescroll.alpha = 0.6;
			   offsettest.alpha = 0.6;
			   antimash.alpha = 1;
		}
	}
}