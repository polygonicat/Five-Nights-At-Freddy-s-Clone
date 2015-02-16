package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.FlxCamera;
import flixel.util.FlxRandom;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.plugin.MouseEventManager;

class ViewersSpecialTreat extends FlxState
{
	public static var honking_counter:Int = 0;
	public static var honk_trigger:Int = 0;
	
	override public function update():Void
	{
		super.update();
		
		if (honk_trigger == 1)
		{
			if (honking_counter == 2)
			{
				AssetsOfficeBackground.sfx_laugh_spook03.play();
				honk_trigger = 0;
			}
			else if (honking_counter == 5)
			{
				AssetsOfficeBackground.office_dark_background_blackveil.alive = true;
				AssetsOfficeBackground.office_dark_background_blackveil.exists = true;
		
				AssetsOfficeBackground.office_dark_background_blackveil.animation.play("flicker_gold");
			}
			else
			{
				honk_trigger = 0;
			}
		}
	}
}