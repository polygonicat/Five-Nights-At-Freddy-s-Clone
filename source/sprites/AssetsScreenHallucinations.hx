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

class AssetsScreenHallucinations extends FlxState
{
	public static var hallucinations_unite:FlxGroup;
	public static var golden_explosion:FlxTimer;
	
	//-- Hallucinations can kill or not they are mostly things that are above everything including camera monitor.
	public static var death_golden_freddy:FlxSprite;
	public static var hallucination_bonnie:FlxSprite;
	public static var hallucination_freddy:FlxSprite;
	
	public function new() 
	{
		super();
		
		golden_explosion = new FlxTimer();
		
		hallucinations_unite = new FlxGroup();
		add(hallucinations_unite);
		
		death_golden_freddy = new FlxSprite(0, 0, "assets/images/monsters_assets/death_golden_freddy.png");
		death_golden_freddy.scrollFactor.x = 0;
		hallucinations_unite.add(death_golden_freddy);
		
		death_golden_freddy.alive = false;
		death_golden_freddy.exists = false;
		
		hallucination_bonnie = new FlxSprite(0, 0);
		hallucination_bonnie.loadGraphic("assets/images/monsters_assets/hallucination_its_me_bonnie.png", true, 800, 450, false);
		hallucination_bonnie.animation.add("spook", [0, 1, 1, 1, 0, 2, 2, 2, 0, 3, 3, 3, 2, 2, 2, 0, 1, 1, 1, 0, 0], 60, false);
		hallucination_bonnie.scrollFactor.x = 0;
		hallucination_bonnie.animation.callback = hallucinate_bonnie;
		hallucinations_unite.add(hallucination_bonnie);
		
		hallucination_freddy = new FlxSprite(0, 0);
		hallucination_freddy.loadGraphic("assets/images/monsters_assets/hallucination_its_me_freddy.png", true, 800, 450, false);
		hallucination_freddy.animation.add("spook", [0, 1, 1, 1, 0, 2, 2, 2, 0, 3, 3, 3, 2, 2, 2, 0, 1, 1, 1, 0, 0], 60, false);
		hallucination_freddy.scrollFactor.x = 0;
		hallucination_freddy.animation.callback = hallucinate_freddy;
		hallucinations_unite.add(hallucination_freddy);
	}
	
	public static function golden_freddy_death(timer:FlxTimer):Void
	{
		AssetsOfficeBackground.night_blackveil.alive = true;
		AssetsOfficeBackground.night_blackveil.exists = true;
		
		AssetsOfficeBackground.office_camera_monitor_toggle.alive = false;
		AssetsOfficeBackground.office_camera_monitor_toggle.exists = false;
		
		death_golden_freddy.alive = true;
		death_golden_freddy.exists = true;
		
		if (AssetsOfficeBackground.sfx_scream_golden.playing == true)
		{
			AssetsOfficeBackground.sfx_scream_golden.stop();
		}
		
		AssetsOfficeBackground.sfx_scream_golden.play();
		AssetsOfficeBackground.game_over_start_function();
	}
	
	private static function hallucinate_bonnie(name:String, frame_number:Int, frame_index:Int):Void
	{
		if (frame_index == 0 )
		{
			AssetsOfficeBackground.sfx_hallucinating_static.stop();
		}
		else
		{
			if (AssetsOfficeBackground.sfx_hallucinating_static.playing == true)
			{
				AssetsOfficeBackground.sfx_hallucinating_static.stop();
			}
			
			AssetsOfficeBackground.sfx_hallucinating_static.play();
		}
	}
	
	private static function hallucinate_freddy(name:String, frame_number:Int, frame_index:Int):Void
	{
		if (frame_index == 0 )
		{
			AssetsOfficeBackground.sfx_hallucinating_static.stop();
		}
		else
		{
			if (AssetsOfficeBackground.sfx_hallucinating_static.playing == true)
			{
				AssetsOfficeBackground.sfx_hallucinating_static.stop();
			}
			
			AssetsOfficeBackground.sfx_hallucinating_static.play();
		}
	}
	
	override public function update():Void
	{
		super.update();
	}
}