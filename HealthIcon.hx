package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic('assets/images/iconGrid.png', true, 150, 150);

		antialiasing = true;
		animation.add('bf', [30, 0, 1], 1, false, isPlayer);
		animation.add('bf-car', [30, 0, 1], 1, false, isPlayer);
		animation.add('bf-christmas', [30, 0, 1], 1, false, isPlayer);
		animation.add('bf-pixel', [40, 21, 41], 1, false, isPlayer);
		animation.add('spooky', [31, 2, 3], 1, false, isPlayer);
		animation.add('pico', [32, 4, 5], 1, false, isPlayer);
		animation.add('mom', [33, 6, 7], 1, false, isPlayer);
		animation.add('mom-car', [33, 6, 7], 1, false, isPlayer);
		animation.add('tankman', [8, 8, 9], 1, false, isPlayer);
		animation.add('face', [38, 10, 11], 1, false, isPlayer);
		animation.add('dad', [34, 12, 13], 1, false, isPlayer);
		animation.add('senpai', [43, 22, 42], 1, false, isPlayer);
		animation.add('senpai-angry', [46, 44, 45], 1, false, isPlayer);
		animation.add('spirit', [48, 23, 47], 1, false, isPlayer);
		animation.add('bf-old', [39, 14, 15], 1, false, isPlayer);
		animation.add('gf', [35, 16, 52], 1, false, isPlayer);
		animation.add('parents-christmas', [36, 17, 18], 1, false, isPlayer);
		animation.add('monster', [37, 19, 20], 1, false, isPlayer);
		animation.add('monster-christmas', [37, 19, 20], 1, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}
}
