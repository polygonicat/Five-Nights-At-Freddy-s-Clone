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

class AssetsScreenMonsters extends FlxState
{
	//-- Variables
	public static var monsters_unite:FlxGroup; //-- For easy mode wipe of screen.
	
	//-- These are all prototypes
	private static var death_normal_freddy:FlxSprite;  //-- The man himself Kruger Part 1
	private static var death_blackout_freddy:FlxSprite;  //-- The man himself Kruger Part 2
	
	public function new() 
	{
		super();
		
		//-- Group
		monsters_unite = new FlxGroup();
		add(monsters_unite);
		
		//-- Add monsters
		death_blackout_freddy = new FlxSprite(0, 0);
		death_blackout_freddy.loadGraphic("assets/images/monsters_assets/death_freddy.png", true, 800, 450, false);
		death_blackout_freddy.animation.add("boo", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 40, false);
		death_blackout_freddy.scrollFactor.x = 0;
		monsters_unite.add(death_blackout_freddy);
		
		monsters_unite.setAll("alive", false);
		monsters_unite.setAll("exists", false);
	}
	
	public static function normal_freddy_blackout_death_trigger():Void
	{
		death_blackout_freddy.alive = true;
		death_blackout_freddy.exists = true;
		
		if (AssetsOfficeBackground.sfx_scream_normal.playing == true)
		{
			AssetsOfficeBackground.sfx_scream_normal.stop();
		}
		
		AssetsOfficeBackground.sfx_scream_normal.play();
		
		death_blackout_freddy.animation.play("boo");
	}
	
	override public function update():Void
	{
		super.update();
	}
	
	
}