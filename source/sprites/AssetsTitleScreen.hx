package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.FlxCamera;
import flixel.system.FlxSound;
import flixel.system.frontEnds.SoundFrontEnd;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.plugin.MouseEventManager;

import sprites.AssetsOfficeBackground;

class AssetsTitleScreen extends FlxState
{
	public static var title_screen_group:FlxGroup;
	public static var title_text:FlxSprite;
	public static var new_game_button:FlxSprite;
	public static var title_screen_static:FlxSprite;
	public static var title_screen_flicker:FlxSprite;
	public static var title_static_line:FlxSprite;
	public static var title_music:FlxSound;
	public static var title_screen_filler:FlxSprite;
	
	public function new() 
	{
		super();
		
		title_music = new FlxSound();
		title_music.loadEmbedded("title_music", true);
		title_music.volume = 0.05;
		add(title_music);
		
		title_screen_group = new FlxGroup();
		add(title_screen_group);
		
		title_screen_filler = new FlxSprite(0, 0, "assets/images/title_stuff/title_screen_filler.png");
		title_screen_filler.scrollFactor.x = 0;
		title_screen_group.add(title_screen_filler);
		
		title_text = new FlxSprite(82, 61, "assets/images/title_stuff/main_title_text.png");
		title_text.scrollFactor.x = 0;
		title_screen_group.add(title_text);
		
		new_game_button = new FlxSprite(38, 292);
		new_game_button.loadGraphic("assets/images/title_stuff/new_game_button.png", true, 196, 34, false);
		new_game_button.scrollFactor.x = 0;
		new_game_button.animation.add("normal", [0], 0, false);
		new_game_button.animation.add("hover", [1], 0, false);
		title_screen_group.add(new_game_button);
		
		title_static_line = new FlxSprite(0, -27);
		title_static_line.makeGraphic(800, 27, FlxColor.WHITE, false);
		title_static_line.alpha = 0.2;
		title_static_line.scrollFactor.x = 0;
		title_screen_group.add(title_static_line);
		
		title_screen_flicker = new FlxSprite(0, 0);
		title_screen_flicker.loadGraphic("assets/images/title_stuff/title_screen_flicker.png", true, 800, 450, false);
		title_screen_flicker.scrollFactor.x = 0;
		title_screen_flicker.alpha = 0.2;
		title_screen_flicker.animation.add("flicker", [0, 1, 2, 3, 4, 5, 6, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8], 60, true);
		title_screen_group.add(title_screen_flicker);
		
		title_screen_flicker.animation.play("flicker");
		
		title_screen_static = new FlxSprite(0, 0);
		title_screen_static.loadGraphic("assets/images/office_stuff/universal_screen_static.png", true, 800, 450, false);
		title_screen_static.scrollFactor.x = 0;
		title_screen_static.alpha = 0.1;
		title_screen_static.animation.add("static", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
		title_screen_group.add(title_screen_static);
		
		title_screen_static.animation.play("static");
		
		MouseEventManager.add(new_game_button, new_game_button_click, null, new_game_button_hover, new_game_button_out, false, true);
		FlxTween.linearMotion(title_static_line, 0, -37, 0, 477, 10, true, { type:FlxTween.LOOPING } );
		title_music.play();
	}
	
	private static function new_game_button_hover(sprite:FlxSprite):Void
	{
		new_game_button.animation.play("hover");
	}
	
	private static function new_game_button_out(sprite:FlxSprite):Void
	{
		new_game_button.animation.play("normal");
	}
	
	private static function new_game_button_click(sprite:FlxSprite):Void
	{
		title_screen_group.setAll("alive", false);
		title_screen_group.setAll("exists", false);
		title_music.stop();
		AssetsOfficeBackground.start_night_shift();
	}
}