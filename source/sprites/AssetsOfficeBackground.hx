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

class AssetsOfficeBackground extends FlxState
{
	//-- Assets
	public static var office_group:FlxGroup;
	public static var night_blackveil:FlxSprite;
	public static var night_timestamp:FlxText;
	public static var night_daystamp:FlxText;
	public static var night_flicker:FlxSprite;
	private static var office_camera:FlxCamera;
	private static var office_mole:FlxSprite;
	public static var office_background:FlxSprite;
	public static var office_honking_button:FlxSprite;
	public static var office_dark_background:FlxSprite;
	public static var office_dark_background_blackveil:FlxSprite;
	public static var golden_freddy_suit:FlxSprite;
	public static var office_fan:FlxSprite;
	public static var office_camera_monitor:FlxSprite;
	public static var office_camera_monitor_flicker:FlxSprite;
	public static var office_camera_monitor_toggle:FlxSprite;
	public static var office_right_door:FlxSprite;
	public static var office_right_light:FlxSprite;
	public static var office_right_button_panel:FlxSprite;
	public static var office_right_button_door:FlxSprite;
	public static var office_right_button_light:FlxSprite;
	public static var office_left_door:FlxSprite;
	public static var office_left_light:FlxSprite;
	public static var office_left_button_panel:FlxSprite;
	public static var office_left_button_door:FlxSprite;
	public static var office_left_button_light:FlxSprite;
	public static var static_game_over:FlxSprite;
	public static var screen_game_over:FlxSprite;
	
	
	public static var camera_monitor_linings:FlxSprite;
	public static var glorious_timestamp:FlxSprite;
	public static var universal_static:FlxSprite;
	private static var monitor_cooldown:FlxTimer;
	private static var show_night_cooldown:FlxTimer;
	private static var show_glory_cooldown:FlxTimer;
	private static var game_over_start:FlxTimer;
	private static var game_over_screen:FlxTimer;
	private static var game_over_sustain:FlxTimer;
	private static var game_over_end:FlxTimer;
	
	//-- Inevitable Game Over (This consist of three timers with randomized times) I know it's tedious
	private static var show_freddy_01:FlxTimer;  //-- This will initiate the dark room and footsteps
	private static var show_freddy_02:FlxTimer;  //-- Seconds away before the jump scares
	private static var show_freddy_03:FlxTimer;  //-- Seconds away before the jump scares
	
	private static var delay_song_start:Float = 0;  //-- 2 to 4 seconds (Debatable)
	private static var song_duration:Float = 0;  //-- 15 to 27 seconds (Debatable)
	private static var footsteps_duration:Float = 0; //-- 2 to 7 seconds (Debatable)
		
	//-- Sounds
	private static var sfx_left_door:FlxSound;
	private static var sfx_right_door:FlxSound;
	private static var sfx_nose_honk:FlxSound;
	private static var sfx_laugh_normal:FlxSound;
	public static var sfx_laugh_spook01:FlxSound;
	public static var sfx_laugh_spook02:FlxSound;
	public static var sfx_laugh_spook03:FlxSound;
	private static var sfx_power_off:FlxSound;
	private static var sfx_left_lights:FlxSound;
	private static var sfx_right_lights:FlxSound;
	private static var sfx_monitor_down:FlxSound;
	private static var sfx_monitor_up:FlxSound;
	private static var sfx_deny_panel_left:FlxSound;
	private static var sfx_deny_panel_right:FlxSound;
	public static var sfx_static_blip:FlxSound;
	public static var sfx_hallucinating_static:FlxSound;
	private static var sfx_door_bell:FlxSound;
	private static var sfx_yay_cheers:FlxSound;
	private static var sfx_music_box:FlxSound;
	public static var sfx_scream_normal:FlxSound;
	public static var sfx_scream_golden:FlxSound;
	private static var sfx_background_01:FlxSound;
	private static var sfx_background_02:FlxSound;
	private static var sfx_background_03:FlxSound;
	private static var sfx_power_down:FlxSound;
	public static var sfx_deep_steps:FlxSound;
	
	//-- Process Variables
	private static var distance_x:Float = 0;
	private static var distance_y:Float = 0;
	private static var distance:Float = 0;
	private static var camera_toggle:Int = 0;
	private static var door_left_toggle:Int = 0;
	private static var door_left_halt_press:Int = 0;
	private static var door_right_toggle:Int = 0;
	private static var door_right_halt_press:Int = 0;
	private static var light_left_toggle:Int = 0;
	private static var light_right_toggle:Int = 0;
	public static var door_left_shut:Int = 0;
	public static var door_right_shut:Int = 0;
	public static var light_left_shut:Int = 0;
	public static var light_right_shut:Int = 0;
	
	//-- Power Variables
	public static var power_left:Int = 99;
	public static var power_clock:Float = 0;
	public static var power_elapse:Float = 0.05;
	public static var power_tick:Float = 50;
	public static var power_multiplier:Float = 0.13;
	public static var power_shut:Int = 0;
	
	//-- Time Variables
	public static var time_increment:Int = 0;
	public static var time_clock:Float = 0;
	public static var time_elapse:Float = 0.05;
	public static var time_tick:Float = 100;
	public static var time_shut:Int = 0;
	
	//-- Night Variables
	public static var night_counter:Int = 0;
	public static var max_night:Int = 5;
	
	public function new() 
	{
		super();
		FlxG.autoPause = false;
		
		//-- Timers
		monitor_cooldown = new FlxTimer();
		show_night_cooldown = new FlxTimer();
		show_glory_cooldown = new FlxTimer();
		show_freddy_01 = new FlxTimer();
		show_freddy_02 = new FlxTimer();
		show_freddy_03 = new FlxTimer();
		
		game_over_start = new FlxTimer();
		game_over_screen = new FlxTimer();
		game_over_sustain = new FlxTimer();
		game_over_end = new FlxTimer();
		
		//-- Sound Effects
		sfx_background_01 = new FlxSound();
		sfx_background_01.loadEmbedded("background_01", true);
		sfx_background_01.volume = 0.02;
		add(sfx_background_01);
		
		sfx_background_02 = new FlxSound();
		sfx_background_02.loadEmbedded("background_02", true);
		sfx_background_02.volume = 0.03;
		add(sfx_background_02);
		
		sfx_background_03 = new FlxSound();
		sfx_background_03.loadEmbedded("background_03", true);
		sfx_background_03.volume = 0.03;
		add(sfx_background_03);
		
		sfx_music_box = new FlxSound();
		sfx_music_box.loadEmbedded("music_box");
		sfx_music_box.volume = 0.1;
		add(sfx_music_box);
		
		sfx_nose_honk = new FlxSound();
		sfx_nose_honk.loadEmbedded("nose_honk");
		sfx_nose_honk.volume = 0.1;
		add(sfx_nose_honk);
		
		sfx_power_down = new FlxSound();
		sfx_power_down.loadEmbedded("shutting_power");
		sfx_power_down.volume = 0.03;
		add(sfx_power_down);
		
		sfx_static_blip = new FlxSound();
		sfx_static_blip.loadEmbedded("static_blip");
		sfx_static_blip.volume = 0.1;
		add(sfx_static_blip);
		
		sfx_hallucinating_static = new FlxSound();
		sfx_hallucinating_static.loadEmbedded("hallucinating_static");
		sfx_hallucinating_static.volume = 1;
		add(sfx_hallucinating_static);
		
		sfx_monitor_up = new FlxSound();
		sfx_monitor_up.loadEmbedded("monitor_up");
		sfx_monitor_up.volume = 0.2;
		add(sfx_monitor_up);
		
		sfx_monitor_down = new FlxSound();
		sfx_monitor_down.loadEmbedded("monitor_down");
		sfx_monitor_down.volume = 0.2;
		add(sfx_monitor_down);
		
		sfx_left_door = new FlxSound();
		sfx_left_door.loadEmbedded("door_sound");
		sfx_left_door.volume = 0.1;
		add(sfx_left_door);
		
		sfx_right_door = new FlxSound();
		sfx_right_door.loadEmbedded("door_sound");
		sfx_right_door.volume = 0.1;
		add(sfx_right_door);
		
		sfx_power_off = new FlxSound();
		sfx_power_off.loadEmbedded("light_sounds");
		sfx_power_off.volume = 0.09;
		add(sfx_power_off);
		
		sfx_left_lights = new FlxSound();
		sfx_left_lights.loadEmbedded("light_sounds");
		sfx_left_lights.volume = 0.09;
		add(sfx_left_lights);
		
		sfx_right_lights = new FlxSound();
		sfx_right_lights.loadEmbedded("light_sounds");
		sfx_right_lights.volume = 0.09;
		add(sfx_right_lights);
		
		sfx_deny_panel_left = new FlxSound();
		sfx_deny_panel_left.loadEmbedded("panel_deny");
		sfx_deny_panel_left.volume = 0.09;
		add(sfx_deny_panel_left);
		
		sfx_deny_panel_right = new FlxSound();
		sfx_deny_panel_right.loadEmbedded("panel_deny");
		sfx_deny_panel_right.volume = 0.09;
		add(sfx_deny_panel_right);
		
		sfx_door_bell = new FlxSound();
		sfx_door_bell.loadEmbedded("door_bell");
		sfx_door_bell.volume = 0.1;
		add(sfx_door_bell);
		
		sfx_yay_cheers = new FlxSound();
		sfx_yay_cheers.loadEmbedded("yay_cheers");
		sfx_yay_cheers.volume = 0.1;
		add(sfx_yay_cheers);
		
		sfx_deep_steps = new FlxSound();
		sfx_deep_steps.loadEmbedded("deep_steps");
		sfx_deep_steps.volume = 0.3;
		add(sfx_deep_steps);
		
		sfx_scream_normal = new FlxSound();
		sfx_scream_normal.loadEmbedded("scream_normal", false);
		add(sfx_scream_normal);
		
		sfx_scream_golden = new FlxSound();
		sfx_scream_golden.loadEmbedded("scream_golden", false);
		add(sfx_scream_golden);
		
		sfx_laugh_spook01 = new FlxSound();
		sfx_laugh_spook01.loadEmbedded("laugh_spook_01", false);
		sfx_laugh_spook01.volume = 0.3;
		add(sfx_laugh_spook01);
		
		sfx_laugh_spook02 = new FlxSound();
		sfx_laugh_spook02.loadEmbedded("laugh_spook_02", false);
		sfx_laugh_spook02.volume = 0.3;
		add(sfx_laugh_spook02);
		
		sfx_laugh_spook03 = new FlxSound();
		sfx_laugh_spook03.loadEmbedded("laugh_spook_03", false);
		sfx_laugh_spook03.volume = 0.3;
		add(sfx_laugh_spook03);
		
		//-- Assets
		office_mole = new FlxSprite(488, 0);
		office_mole.makeGraphic(1, 1, FlxColor.WHITE, false);
		add(office_mole);
		
		office_group = new FlxGroup();
		add(office_group);
		
		office_background = new FlxSprite(0, 0, "assets/images/office_stuff/office_main.png");
		office_group.add(office_background);
		
		office_honking_button = new FlxSprite(0, 0, "assets/images/office_stuff/buttons/button_honking.png");
		add(office_honking_button);
		
		office_left_light = new FlxSprite(0, 0);
		office_left_light.loadGraphic("assets/images/office_stuff/lights_left_side.png", true, 488, 450, false);
		office_left_light.animation.add("flicker", [1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0], 30, false);
		office_left_light.animation.add("close", [0], 0, false);
		office_left_light.animation.add("open", [1], 0, false);
		office_left_light.animation.callback = left_light_animation;
		office_group.add(office_left_light);
		
		office_right_light = new FlxSprite(488, 0);
		office_right_light.loadGraphic("assets/images/office_stuff/lights_right_side.png", true, 488, 450, false);
		office_right_light.animation.add("flicker", [1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0], 30, false);
		office_right_light.animation.add("close", [0], 0, false);
		office_right_light.animation.add("open", [1], 0, false);
		office_right_light.animation.callback = right_light_animation;
		office_group.add(office_right_light);
		
		office_fan = new FlxSprite(487, 188);
		office_fan.loadGraphic("assets/images/office_stuff/office_fan.png", true, 87, 124, false);
		office_fan.animation.add("fan_go", [0, 1, 2], 60, true);
		office_group.add(office_fan);
		
		office_fan.animation.play("fan_go");
		
		golden_freddy_suit = new FlxSprite(242, 134, "assets/images/monsters_assets/golden_freddy_suit.png");
		office_group.add(golden_freddy_suit);
		
		golden_freddy_suit.alive = false;
		golden_freddy_suit.exists = false;
		
		//-- Office dark
		office_dark_background = new FlxSprite(0, 0, "assets/images/office_stuff/office_main_dark.png");
		office_group.add(office_dark_background);
		
		office_dark_background.alive = false;
		office_dark_background.exists = false;
		
		office_left_door = new FlxSprite(42, 0);
		office_left_door.loadGraphic("assets/images/office_stuff/door_left.png", true, 139, 450, false);
		office_left_door.animation.callback = left_door_animation;
		office_left_door.animation.add("start", [13], 0, false);
		office_left_door.animation.add("close", [13, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 30, false);
		office_left_door.animation.add("open", [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13], 30, false);
		office_group.add(office_left_door);
		
		office_left_door.animation.play("start");
		
		//-- Buttons Here
		office_left_button_panel = new FlxSprite(0, 191, "assets/images/office_stuff/buttons/button_actual_interaction_left.png");
		office_group.add(office_left_button_panel);
		
		office_left_button_door = new FlxSprite(0, 0);
		office_left_button_door.loadGraphic("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png", true, 27, 36, false);
		office_left_button_door.animation.add("close", [0], 0, false);
		office_left_button_door.animation.add("open", [1], 0, false);
		office_left_button_door.x = office_left_button_panel.x + 17;
		office_left_button_door.y = office_left_button_panel.y + 31;
		office_group.add(office_left_button_door);
		
		office_left_button_door.animation.play("open");
		
		office_left_button_light = new FlxSprite(0, 0);
		office_left_button_light.loadGraphic("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png", true, 27, 36, false);
		office_left_button_light.animation.add("close", [0], 0, false);
		office_left_button_light.animation.add("open", [1], 0, false);
		office_left_button_light.x = office_left_button_panel.x + 17;
		office_left_button_light.y = office_left_button_panel.y + 81;
		office_group.add(office_left_button_light);
		
		office_right_door = new FlxSprite(797, 0);
		office_right_door.loadGraphic("assets/images/office_stuff/door_right.png", true, 139, 450, false);
		office_right_door.animation.callback = right_door_animation;
		office_right_door.animation.add("start", [13], 0, false);
		office_right_door.animation.add("close", [13, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 30, false);
		office_right_door.animation.add("open", [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13], 30, false);
		office_group.add(office_right_door);
		
		office_right_door.animation.play("start");
		
		office_right_button_panel = new FlxSprite(919, 191, "assets/images/office_stuff/buttons/button_actual_interaction_right.png");
		office_group.add(office_right_button_panel);
		
		office_right_button_door = new FlxSprite(0, 0);
		office_right_button_door.loadGraphic("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png", true, 27, 36, false);
		office_right_button_door.animation.add("close", [0], 0, false);
		office_right_button_door.animation.add("open", [1], 0, false);
		office_right_button_door.x = office_right_button_panel.x + 13;
		office_right_button_door.y = office_right_button_panel.y + 31;
		office_group.add(office_right_button_door);
		
		office_right_button_door.animation.play("open");
		
		office_right_button_light = new FlxSprite(0, 0);
		office_right_button_light.loadGraphic("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png", true, 27, 36, false);
		office_right_button_light.animation.add("close", [0], 0, false);
		office_right_button_light.animation.add("open", [1], 0, false);
		office_right_button_light.x = office_right_button_panel.x + 13;
		office_right_button_light.y = office_right_button_panel.y + 81;
		office_group.add(office_right_button_light);
		
		office_dark_background_blackveil = new FlxSprite(0, 0);
		office_dark_background_blackveil.loadGraphic("assets/images/office_stuff/black_out_screen.png", true, 800, 450, false);
		office_dark_background_blackveil.animation.add("flicker", [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0], 60, false);
		office_dark_background_blackveil.animation.add("flicker_gold", [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1], 60, false);
		office_dark_background_blackveil.animation.callback = power_off_animation;
		office_dark_background_blackveil.scrollFactor.x = 0;
		office_group.add(office_dark_background_blackveil);
		
		office_dark_background_blackveil.alive = false;
		office_dark_background_blackveil.exists = false;
		
		Variables.monitor_main = new AssetsMonitorLayout();
		add(Variables.monitor_main);
		
		Variables.screen_monsters = new AssetsScreenMonsters();
		add(Variables.screen_monsters);
		
		office_camera_monitor = new FlxSprite(0, 0);
		office_camera_monitor.loadGraphic("assets/images/office_stuff/camera_monitor.png", true, 800, 450, false);
		office_camera_monitor.scrollFactor.x = 0;
		office_camera_monitor.animation.add("start", [0], 0, false);
		office_camera_monitor.animation.add("open", [0, 1, 2, 3, 4, 5, 6], 30, false);
		office_camera_monitor.animation.add("close", [6, 5, 4, 3, 2, 1, 0], 30, false);
		office_camera_monitor.animation.callback = camera_monitor_animation;
		add(office_camera_monitor);
		
		office_camera_monitor.alive = false;
		office_camera_monitor.exists = false;
		
		//-- Map Here
		Variables.map_monitor_main = new AssetsCameraMonitor();
		add(Variables.map_monitor_main);
		
		
		office_camera_monitor_flicker = new FlxSprite(0, 20);
		office_camera_monitor_flicker.loadGraphic("assets/images/office_stuff/camera_monitor_flickering.png", true, 800, 450, false);
		office_camera_monitor_flicker.animation.add("start", [7], 0, false);
		office_camera_monitor_flicker.animation.add("flicker", [0, 1, 2, 3, 4, 5, 6, 7], 100, false);
		office_camera_monitor_flicker.scrollFactor.x = 0;
		office_camera_monitor_flicker.alpha = 1;
		add(office_camera_monitor_flicker);
		
		office_camera_monitor_flicker.alive = false;
		office_camera_monitor_flicker.exists = false;
		
		universal_static = new FlxSprite(0, 0);
		universal_static.loadGraphic("assets/images/office_stuff/universal_screen_static.png", true, 800, 450, false);
		universal_static.scrollFactor.x = 0;
		universal_static.alpha = 0.2;
		universal_static.animation.add("static", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
		add(universal_static);
		
		universal_static.animation.play("static");
		
		universal_static.alive = false;
		universal_static.exists = false;
		
		camera_monitor_linings = new FlxSprite(0, 0);
		camera_monitor_linings.loadGraphic("assets/images/office_stuff/camera_monitor_linings.png", true, 800, 450, false);
		camera_monitor_linings.animation.add("recording", [0, 1], 3, true);
		camera_monitor_linings.scrollFactor.x = 0;
		add(camera_monitor_linings);
		
		camera_monitor_linings.animation.play("recording");
		
		camera_monitor_linings.alive = false;
		camera_monitor_linings.exists = false;
		
		office_camera_monitor_toggle = new FlxSprite(0, 0, "assets/images/office_stuff/camera_monitor_toggle.png");
		office_camera_monitor_toggle.x = (FlxG.stage.stageWidth / 2) - (office_camera_monitor_toggle.width / 2);
		office_camera_monitor_toggle.y = (FlxG.stage.stageHeight - office_camera_monitor_toggle.height) - 15;
		office_camera_monitor_toggle.alpha = 0.5;
		office_camera_monitor_toggle.scrollFactor.x = 0;
		add(office_camera_monitor_toggle);
		
		night_blackveil = new FlxSprite(0, 0);
		night_blackveil.makeGraphic(800, 450, FlxColor.BLACK, false);
		night_blackveil.scrollFactor.x = 0;
		add(night_blackveil);
		
		night_timestamp = new FlxText(0, 0, 800," ");
		night_timestamp.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 22, 0xFFFFFF, "center");
		night_timestamp.scrollFactor.x = 0;
		add(night_timestamp);
		
		night_daystamp = new FlxText(0, 0, 800," ");
		night_daystamp.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 22, 0xFFFFFF, "center");
		night_daystamp.scrollFactor.x = 0;
		add(night_daystamp);
		
		night_flicker = new FlxSprite(0, 20);
		night_flicker.loadGraphic("assets/images/office_stuff/camera_monitor_flickering.png", true, 800, 450, false);
		night_flicker.animation.add("flicker", [0, 1, 2, 3, 4, 5, 6, 7], 100, false);
		night_flicker.scrollFactor.x = 0;
		add(night_flicker);
		
		night_flicker.alive = false;
		night_flicker.exists = false;
		
		glorious_timestamp = new FlxSprite(0, 0);
		glorious_timestamp.loadGraphic("assets/images/office_stuff/glorious_timestamp.png", true, 174, 72, false);
		glorious_timestamp.animation.add("start", [0], 0, false);
		glorious_timestamp.animation.add("end", [69], 0, false);
		glorious_timestamp.animation.add("saved", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69], 35, false);
		glorious_timestamp.animation.callback = glorious_timestamp_animation;
		glorious_timestamp.scrollFactor.x = 0;
		glorious_timestamp.x = 400 - (glorious_timestamp.width / 2);
		glorious_timestamp.y = 225 - (glorious_timestamp.height / 2);
		add(glorious_timestamp);
		
		glorious_timestamp.alive = false;
		glorious_timestamp.exists = false;
		
		Variables.screen_hallucinations = new AssetsScreenHallucinations();
		add(Variables.screen_hallucinations);
		
		Variables.title_screen = new AssetsTitleScreen();
		add(Variables.title_screen);
		
		screen_game_over = new FlxSprite(0, 0);
		screen_game_over.loadGraphic("assets/images/office_stuff/game_over_screen.png", true, 800, 450, false);
		screen_game_over.scrollFactor.x = 0;
		add(screen_game_over);
		
		screen_game_over.alive = false;
		screen_game_over.exists = false;
		
		static_game_over = new FlxSprite(0, 0);
		static_game_over.loadGraphic("assets/images/office_stuff/universal_screen_static.png", true, 800, 450, false);
		static_game_over.scrollFactor.x = 0;
		static_game_over.animation.add("static", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
		add(static_game_over);
		
		static_game_over.animation.play("static");
		
		static_game_over.alive = false;
		static_game_over.exists = false;
		
		//-- Setting up camera
		var center_camera:Int = Std.int((office_background.width / 2) -  200);
		office_camera = new FlxCamera(0, 0, 800, 450);
		office_camera.setBounds(0, 0, 976, 450);
		office_camera.follow(office_mole, 0);
		FlxG.cameras.add(office_camera);
		
		//-- Mouse Events
		MouseEventManager.add(office_camera_monitor_toggle, null, null, camera_monitor_operation, null, false, true, true);
		MouseEventManager.add(office_left_button_door,left_door_triggering, null, null, null, false, true, true);
		MouseEventManager.add(office_right_button_door, right_door_triggering, null, null, null, false, true, true);
		MouseEventManager.add(office_left_button_light, left_light_triggering, null, null, null, false, true, true);
		MouseEventManager.add(office_right_button_light, right_light_triggering, null, null, null, false, true, true);
		MouseEventManager.add(office_honking_button, nose_honking_trigger, null, null, null, false, true, true);
		
		//-- Debug Stuff
		Variables.viewers_choice = new ViewersSpecialTreat();
		add(Variables.viewers_choice);
	}
	
	private static function camera_monitor_operation(sprite:FlxSprite):Void
	{
		if (night_blackveil.alive == false)
		{
			if (camera_toggle == 0)
			{
				AssetsMonitorLayout.usage_consumption += 1;
				
				office_camera_monitor_toggle.alive = false;
				office_camera_monitor_toggle.exists = false;
				
				office_camera_monitor.alive = true;
				office_camera_monitor.exists = true;
				
				office_camera_monitor.animation.play("open");
				
				sfx_monitor_up.play();
				
				camera_toggle = 1;
			}
			else if (camera_toggle == 1)
			{
				AssetsMonitorLayout.usage_consumption -= 1;
				
				office_camera_monitor.alive = true;
				office_camera_monitor.exists = true;
				
				office_camera_monitor_toggle.alive = false;
				office_camera_monitor_toggle.exists = false;
				
				universal_static.alive = false;
				universal_static.exists = false;
				
				camera_monitor_linings.alive = false;
				camera_monitor_linings.exists = false;
				
				office_camera_monitor_flicker.alive = false;
				office_camera_monitor_flicker.exists = false;
				
				AssetsCameraMonitor.reset_buttons();
				AssetsCameraMonitor.room_buttons_group.setAll("alive", false);
				AssetsCameraMonitor.room_buttons_group.setAll("exists", false);
				
				AssetsMonitorLayout.office_camera_blackveil.alive = false;
				AssetsMonitorLayout.office_camera_blackveil.exists = false;
				
				if(sfx_monitor_up.playing == true)
				{
					sfx_monitor_up.stop();
				}
				
				sfx_monitor_down.play();
				
				office_camera_monitor.animation.play("close");
			}
		}
	}
	
	public static function game_over_start_function():Void
	{
		game_over_start.start(1, game_over_static_function, 1);
	}
	
	public static function game_over_static_function(timer:FlxTimer):Void
	{
		sfx_scream_normal.stop();
		sfx_scream_golden.stop();
		
		static_game_over.alive = true;
		static_game_over.exists = true;
		
		game_over_screen.start(2,game_over_screen_function,1);
	}
	
	public static function game_over_screen_function(timer:FlxTimer):Void
	{
		static_game_over.alive = false;
		static_game_over.exists = false;
		
		screen_game_over.alive = true;
		screen_game_over.exists = true;
		
		game_over_sustain.start(2, game_over_end_function, 1);
	}
	
	public static function game_over_end_function(timer:FlxTimer):Void
	{
		night_counter = 0;
		FlxG.resetGame();
	}
	
	private static function power_off_animation(name:String, frame_number:Int, frame_index:Int)
	{
		if (frame_index == 0)
		{
			if (sfx_power_off.playing == true)
			{
				sfx_power_off.stop();
			}
			
			sfx_power_off.play();
		}
		else if (frame_index == 1)
		{
			sfx_power_off.stop();
		}
		
		
		//-- Debug Stuff
		if (name == "flicker_gold" && frame_number == 21)
		{
			golden_freddy_suit.alive = true;
			golden_freddy_suit.exists = true;
		}
		else if (name == "flicker_gold" && frame_number == 23)
		{
			sfx_power_off.stop();
			
			ViewersSpecialTreat.honking_counter++;
			golden_freddy_suit.alive = true;
			golden_freddy_suit.exists = true;
			
			if (sfx_laugh_spook03.playing == true)
			{
				sfx_laugh_spook03.stop();
			}
			
			sfx_laugh_spook03.play();
			
			light_left_shut = 1;
			light_right_shut = 1;
			door_left_shut = 1;
			door_right_shut = 1;
			
			AssetsScreenHallucinations.hallucination_freddy.animation.play("spook");
			AssetsScreenHallucinations.golden_explosion.start(5, AssetsScreenHallucinations.golden_freddy_death, 1);
		}
		//-- Debug Stuff
	}
	
	private static function camera_monitor_animation(name:String, frame_number:Int, frame_index:Int):Void
	{
		if (name == "close" && frame_index == 1)
		{
			office_camera_monitor.alive = false;
			office_camera_monitor.exists = false;
			
			if (power_shut == 0)
			{
				monitor_cooldown.start(0.3, open_show_monitor_toggle, 1);
			}
			
			camera_toggle = 0;
		}
		else if (name == "open" && frame_index == 5)
		{
			universal_static.alive = true;
			universal_static.exists = true;
			
			office_camera_monitor.alive = false;
			office_camera_monitor.exists = false;
			
			AssetsMonitorLayout.office_camera_blackveil.alive = true;
			AssetsMonitorLayout.office_camera_blackveil.exists = true;
			
			camera_monitor_linings.alive = true;
			camera_monitor_linings.exists = true;
			
			office_camera_monitor_flicker.alive = true;
			office_camera_monitor_flicker.exists = true;
			
			
			AssetsCameraMonitor.reset_buttons();
			AssetsCameraMonitor.room_buttons_group.setAll("alive", true);
			AssetsCameraMonitor.room_buttons_group.setAll("exists", true);
			
			office_camera_monitor_flicker.animation.play("flicker");
			
			if (sfx_static_blip.playing == true)
			{
				sfx_static_blip.stop();
			}
			
			sfx_static_blip.play();
			
			monitor_cooldown.start(0.3, open_show_monitor_toggle, 1);
		}
	}
	
	private static function left_door_animation(name:String, frame_number:Int, frame_index:Int):Void
	{
		//FlxG.log.add(frame_index);
		if (name == "close" && frame_index == 11)
		{
			door_left_halt_press = 0;
		}
		else if (name == "open" && frame_index == 1)
		{
			door_left_halt_press = 0;
		}
	}
	
	private static function right_door_animation(name:String, frame_number:Int, frame_index:Int):Void
	{
		//FlxG.log.add(frame_index);
		if (name == "close" && frame_index == 11)
		{
			door_right_halt_press = 0;
		}
		else if (name == "open" && frame_index == 1)
		{
			door_right_halt_press = 0;
		}
	}
	
	private static function left_light_animation(name:String, frame_number:Int, frame_index:Int):Void
	{
		if (frame_index == 0)
		{
			if (sfx_left_lights.playing == true)
			{
				sfx_left_lights.stop();
			}
			
			sfx_left_lights.play();
		}
		else if (frame_index == 1)
		{
			sfx_left_lights.stop();
		}
	}
	
	private static function right_light_animation(name:String, frame_number:Int, frame_index:Int):Void
	{
		if (frame_index == 0)
		{
			if (sfx_right_lights.playing == true)
			{
				sfx_right_lights.stop();
			}
			
			sfx_right_lights.play();
		}
		else if (frame_index == 1)
		{
			sfx_right_lights.stop();
		}
	}
	
	private static function glorious_timestamp_animation(name:String, frame_number:Int, frame_index:Int):Void
	{
		if (name == "saved" && frame_index == 68)
		{
			show_glory_cooldown.start(3, glorious_cooldown, 1);
			glorious_timestamp.animation.play("end");
			sfx_yay_cheers.play();
		}
	}
	
	private static function light_resetting():Void
	{
		if (office_left_light.animation.finished == true && light_left_toggle == 1)
		{
			light_left_toggle = 0;
			AssetsMonitorLayout.usage_consumption -= 1;
			office_left_light.animation.play("close");
			office_left_button_light.animation.play("close");
		}
		
		if (office_right_light.animation.finished == true && light_right_toggle == 1)
		{
			light_right_toggle = 0;
			AssetsMonitorLayout.usage_consumption -= 1;
			office_right_light.animation.play("close");
			office_right_button_light.animation.play("close");
		}
	}
	
	private static function open_show_monitor_toggle(timer:FlxTimer):Void
	{
		office_camera_monitor_toggle.alive = true;
		office_camera_monitor_toggle.exists = true;
	}
	
	private static function nose_honking_trigger(sprite:FlxSprite):Void
	{
		FlxG.log.add("HONK!");
		
		if (sfx_nose_honk.playing == false && golden_freddy_suit.alive == false)
		{
			sfx_nose_honk.play();
			
			//-- Debug Stuff
			ViewersSpecialTreat.honking_counter++;
			ViewersSpecialTreat.honk_trigger = 1;
		}
	}
	
	private static function left_door_triggering(sprite:FlxSprite):Void
	{
		if (night_blackveil.alive == false)
		{
			//-- 1 means the normal stuff, 2 means you are fucked.
			if (door_left_halt_press == 0 && office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_left_shut == 0)
			{
				if (door_left_toggle == 0)
				{
					AssetsMonitorLayout.usage_consumption += 1;
					
					office_left_button_door.animation.play("close");
					office_left_door.animation.play("close");
					door_left_toggle = 1;
					door_left_halt_press = 1;
					
					if (sfx_left_door.playing == true)
					{
						sfx_left_door.stop();
					}
					
					sfx_left_door.play();
				}
				else if (door_left_toggle == 1)
				{
					AssetsMonitorLayout.usage_consumption -= 1;
					
					office_left_button_door.animation.play("open");
					office_left_door.animation.play("open");
					door_left_toggle = 0;
					door_left_halt_press = 1;
					
					if (sfx_left_door.playing == true)
					{
						sfx_left_door.stop();
					}
					
					sfx_left_door.play();
				}
			}
			else if (door_left_halt_press == 0 && office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_left_shut == 1)
			{
				if(sfx_deny_panel_left.playing == true)
				{
					sfx_deny_panel_left.stop();
				}
				
				sfx_deny_panel_left.play();
			}
		}
	}
	
	private static function right_door_triggering(sprite:FlxSprite):Void
	{
		if (night_blackveil.alive == false)
		{
			//-- 1 means the normal stuff, 2 means you are fucked.
			if (door_right_halt_press == 0 && office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_right_shut == 0)
			{
				if (door_right_toggle == 0)
				{
					AssetsMonitorLayout.usage_consumption += 1;
					
					office_right_button_door.animation.play("close");
					office_right_door.animation.play("close");
					door_right_toggle = 1;
					door_right_halt_press = 1;
					
					if (sfx_right_door.playing == true)
					{
						sfx_right_door.stop();
					}
					
					sfx_right_door.play();
				}
				else if (door_right_toggle == 1)
				{
					AssetsMonitorLayout.usage_consumption -= 1;
					
					office_right_button_door.animation.play("open");
					office_right_door.animation.play("open");
					door_right_toggle = 0;
					door_right_halt_press = 1;
					
					if (sfx_right_door.playing == true)
					{
						sfx_right_door.stop();
					}
					
					sfx_right_door.play();
				}
			}
			else if (door_right_halt_press == 0 && office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_right_shut == 1)
			{
				if(sfx_deny_panel_right.playing == true)
				{
					sfx_deny_panel_right.stop();
				}
				
				sfx_deny_panel_right.play();
			}
		}
	}
	
	private static function left_light_triggering(sprite:FlxSprite):Void
	{
		if (night_blackveil.alive == false)
		{
			if (office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_left_shut == 0)
			{
				if (light_left_toggle == 0)
				{
					AssetsMonitorLayout.usage_consumption += 1;
					light_left_toggle = 1;
					office_left_button_light.animation.play("open");
					office_left_light.animation.play("flicker");
				}
				else
				{
					AssetsMonitorLayout.usage_consumption -= 1;
					light_left_toggle = 0;
					office_left_button_light.animation.play("close");
					office_left_light.animation.play("close");
				}
			}
			else if (office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_left_shut == 1)
			{
				if(sfx_deny_panel_left.playing == true)
				{
					sfx_deny_panel_left.stop();
				}
				
				sfx_deny_panel_left.play();
			}
		}
	}
	
	private static function right_light_triggering(sprite:FlxSprite):Void
	{
		if (night_blackveil.alive == false)
		{
			if (office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_right_shut == 0)
			{
				if (light_right_toggle == 0)
				{
					AssetsMonitorLayout.usage_consumption += 1;
					light_right_toggle = 1;
					office_right_button_light.animation.play("open");
					office_right_light.animation.play("flicker");
				}
				else
				{
					AssetsMonitorLayout.usage_consumption -= 1;
					light_right_toggle = 0;
					office_right_button_light.animation.play("close");
					office_right_light.animation.play("close");
				}
			}
			else if (office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false && light_right_shut == 1)
			{
				if(sfx_deny_panel_right.playing == true)
				{
					sfx_deny_panel_right.stop();
				}
				
				sfx_deny_panel_right.play();
			}
		}
	}
	
	public static function start_night_shift():Void
	{
		night_counter++;
		
		night_flicker.alive = true;
		night_flicker.exists = true;
		
		night_timestamp.alive = true;
		night_timestamp.exists = true;
		
		night_daystamp.alive = true;
		night_daystamp.exists = true;
		
		night_blackveil.alive = true;
		night_blackveil.exists = true;
		
		night_timestamp.alpha = 1;
		night_daystamp.alpha = 1;
		
		night_flicker.animation.play("flicker");
		
		if (sfx_static_blip.playing == true)
		{
			sfx_static_blip.stop();
		}
		
		sfx_static_blip.play();
		
		if (night_counter == 1)
		{
			night_timestamp.text = "12:00 AM";
			night_daystamp.text  = night_counter + "st night";
		}
		else if (night_counter == 2)
		{
			night_timestamp.text = "12:00 AM";
			night_daystamp.text  = night_counter + "nd night";
		}
		else if (night_counter == 3)
		{
			night_timestamp.text = "12:00 AM";
			night_daystamp.text  = night_counter + "rd night";
		}
		else if (night_counter == 4 || night_counter == 5)
		{
			night_timestamp.text = "12:00 AM";
			night_daystamp.text  = night_counter + "th night";
		}
		
		AssetsMonitorLayout.night_text.text = "Night " + night_counter;
		
		night_timestamp.y = (FlxG.stage.stageHeight / 2) - (night_timestamp.height + 12);
		night_daystamp.y = ((FlxG.stage.stageHeight / 2) + 12);
		reset_office();
		show_night_cooldown.start(1, timestamp_cooldown, 1);
	}
	
	public static function timestamp_cooldown(timer:FlxTimer):Void
	{
		FlxTween.tween(night_timestamp, { alpha:0 }, 0.5);
		FlxTween.tween(night_daystamp, { alpha:0 }, 0.5, { complete:timestamp_exit } );
	}
	
	public static function timestamp_exit(tween:FlxTween):Void
	{
		night_flicker.alive = false;
		night_flicker.exists = false;
		
		night_timestamp.alive = false;
		night_timestamp.exists = false;
		
		night_daystamp.alive = false;
		night_daystamp.exists = false;
		
		night_blackveil.alive = false;
		night_blackveil.exists = false;
		
		sfx_background_01.play();
		sfx_background_02.play();
		sfx_background_03.play();
	}
	
	public static function successful_night():Void
	{
		//-- shut_office_down();
		
		//-- Deny Blackout Freddy
		show_freddy_01.cancel();
		show_freddy_02.cancel();
		show_freddy_03.cancel();
		
		//-- Deny Golden Freddy
		golden_freddy_suit.alive = false;
		golden_freddy_suit.exists = false;
		
		//-- Insert here denial of all the other set animatronics that are bound to attack you
		
		night_blackveil.alive = true;
		night_blackveil.exists = true;
		
		glorious_timestamp.alive = true;
		glorious_timestamp.exists = true;
		
		night_blackveil.alpha = 0;
		glorious_timestamp.alpha = 0;
		
		sfx_door_bell.play();
		
		FlxTween.tween(glorious_timestamp,{alpha:1},0.5);
		FlxTween.tween(night_blackveil,{alpha:1},0.5,{complete:glorious_time_change});
	}
	
	public static function  glorious_time_change(tween:FlxTween):Void
	{
		glorious_timestamp.animation.play("saved");
	}
	
	public static function glorious_cooldown(timer:FlxTimer):Void
	{
		FlxTween.tween(glorious_timestamp,{alpha:1},0.5, {complete:glorious_end});
	}
	
	public static function glorious_end(tween:FlxTween):Void
	{
		FlxTween.tween(glorious_timestamp,{alpha:0},0.5, {complete:glorious_reset});
	}
	
	public static function glorious_reset(tween:FlxTween):Void
	{
		glorious_timestamp.alive = false;
		glorious_timestamp.exists = false;
		
		if (night_counter == max_night)
		{
			//-- THE END OF THE HELLISH NIGHTMARE
		}
		else
		{
			//-- MORE!
			reset_office();
			start_night_shift();
		}
	}
	
	public static function shut_office_down():Void
	{
		AssetsMonitorLayout.monitor_elements.setAll("alive", false);
		AssetsMonitorLayout.monitor_elements.setAll("exists", false);
		
		office_dark_background.alive = true;
		office_dark_background.exists = true;
		
		office_camera_monitor_toggle.alive = false;
		office_camera_monitor_toggle.exists = false;
		
		if (sfx_power_down.playing == true)
		{
			sfx_power_down.stop();
		}
		
		sfx_power_down.play();
		
		if (camera_toggle == 1)
		{
			office_camera_monitor.alive = true;
			office_camera_monitor.exists = true;
			
			office_camera_monitor_toggle.alive = false;
			office_camera_monitor_toggle.exists = false;
			
			universal_static.alive = false;
			universal_static.exists = false;
			
			camera_monitor_linings.alive = false;
			camera_monitor_linings.exists = false;
			
			office_camera_monitor_flicker.alive = false;
			office_camera_monitor_flicker.exists = false;
			
			AssetsCameraMonitor.reset_buttons();
			AssetsCameraMonitor.room_buttons_group.setAll("alive", false);
			AssetsCameraMonitor.room_buttons_group.setAll("exists", false);
			
			AssetsMonitorLayout.office_camera_blackveil.alive = false;
			AssetsMonitorLayout.office_camera_blackveil.exists = false;
			
			if(sfx_monitor_up.playing == true)
			{
				sfx_monitor_up.stop();
			}
			
			sfx_monitor_down.play();
			
			office_camera_monitor.animation.play("close");
		}
		
		light_left_shut = 2;
		light_right_shut = 2;
		door_left_shut = 2;
		door_right_shut = 2;
		
		if (light_left_toggle == 1)
		{
			light_left_toggle = 0;
			office_left_button_light.animation.play("close");
			office_left_light.animation.play("close");
		}
		
		if (light_right_toggle == 1)
		{
			light_right_toggle = 0;
			office_right_button_light.animation.play("close");
			office_right_light.animation.play("close");
		}
		
		if (door_left_toggle == 1)
		{
			office_left_button_door.animation.play("open");
			office_left_door.animation.play("open");
			door_left_toggle = 0;
			door_left_halt_press = 1;
			
			if (sfx_left_door.playing == true)
			{
				sfx_left_door.stop();
			}
			
			sfx_left_door.play();
		}
		
		if (door_right_toggle == 1)
		{
			office_right_button_door.animation.play("open");
			office_right_door.animation.play("open");
			door_right_toggle = 0;
			door_right_halt_press = 1;
			
			if (sfx_right_door.playing == true)
			{
				sfx_right_door.stop();
			}
			
			sfx_right_door.play();
		}
		
		//-- Time you want him to start sing
		var start_delay = FlxRandom.floatRanged(2, 4);
		show_freddy_01.start(start_delay, singing_freddy_sequence, 1);
	}
	
	public static function singing_freddy_sequence(timer:FlxTimer):Void
	{
		//-- Insert the singing bastard in here
		if (sfx_music_box.playing == true)
		{
			sfx_music_box.stop();
		}
		
		sfx_music_box.play();
		
		var singing_delay = FlxRandom.floatRanged(5, 8);
		show_freddy_02.start(singing_delay, walking_freddy_sequence, 1);
	}
	
	public static function walking_freddy_sequence(timer:FlxTimer):Void
	{
		//-- Insert some walking stuff in here
		if (sfx_music_box.playing == true)
		{
			sfx_music_box.stop();
		}
		
		office_dark_background_blackveil.alive = true;
		office_dark_background_blackveil.exists = true;
		
		office_dark_background_blackveil.animation.play("flicker");
		
		if (sfx_deep_steps.playing == true)
		{
			sfx_deep_steps.stop();
		}
		
		sfx_deep_steps.play();
		
		var walking_delay = FlxRandom.floatRanged(1, 3);
		show_freddy_03.start(walking_delay, peekaboo_freddy_sequence, 1);
	}
	
	public static function peekaboo_freddy_sequence(timer:FlxTimer):Void
	{
		FlxG.log.add("Boo?");
		
		time_shut = 1;
		
		//-- BOOM YOU ARE DEAD!
		if (sfx_music_box.playing == true)
		{
			sfx_music_box.stop();
		}
		
		if (sfx_deep_steps.playing == true)
		{
			sfx_deep_steps.stop();
		}
		
		AssetsScreenMonsters.normal_freddy_blackout_death_trigger();
		game_over_start_function();
	}
	
	public static function reset_office():Void
	{
		//-- Relocating stuff in order to adjust them accordingly to the starting point
		
		AssetsMonitorLayout.monitor_elements.setAll("alive", true);
		AssetsMonitorLayout.monitor_elements.setAll("exists", true);
		
		office_camera_monitor_toggle.alive = true;
		office_camera_monitor_toggle.exists = true;
		
		universal_static.alive = false;
		universal_static.exists = false;
		
		camera_monitor_linings.alive = false;
		camera_monitor_linings.exists = false;
		
		office_camera_monitor_flicker.alive = false;
		office_camera_monitor_flicker.exists = false;
		
		office_dark_background.alive = false;
		office_dark_background.exists = false;
		
		office_dark_background_blackveil.alive = false;
		office_dark_background_blackveil.exists = false;
		
		
		AssetsCameraMonitor.reset_buttons();
		AssetsCameraMonitor.room_buttons_group.setAll("alive", false);
		AssetsCameraMonitor.room_buttons_group.setAll("exists", false);
		
		office_left_door.animation.play("start");
		office_right_door.animation.play("start");
		office_left_light.animation.play("close");
		office_right_light.animation.play("close");
		
		office_right_button_door.animation.play("open");
		office_left_button_door.animation.play("open");
		office_right_button_light.animation.play("close");
		office_left_button_light.animation.play("close");
		
		office_camera_monitor.animation.play("start");
		
		AssetsMonitorLayout.office_camera_blackveil.alive = false;
		AssetsMonitorLayout.office_camera_blackveil.exists = false;
		
		//-- Reseting Variables in order to clean up the mess done on the last night
		//-- Process Variables
		camera_toggle = 0;
		door_left_toggle = 0;
		door_left_halt_press = 0;
		door_right_toggle = 0;
		door_right_halt_press = 0;
		light_left_toggle = 0;
		light_right_toggle = 0;
		door_left_shut = 0;
		door_right_shut = 0;
		light_left_shut = 0;
		light_right_shut = 0;
		
		//-- Power Variables
		power_left = 99;
		power_clock = 0;
		power_shut = 0;
		AssetsMonitorLayout.usage_consumption = 1;
		
		//-- Time Variables
		time_increment = 0;
		time_clock = 0;
		time_shut = 0;
		
		if (time_increment == 0)
		{
			AssetsMonitorLayout.hours_text.text = "12 AM";
			AssetsMonitorLayout.night_text.text = "Night " + night_counter;
		}
		else
		{
			AssetsMonitorLayout.hours_text.text = time_increment + " AM";
			AssetsMonitorLayout.night_text.text = "Night " + night_counter;
		}
		
		AssetsMonitorLayout.power_percentage.text = Std.string(AssetsOfficeBackground.power_left) + "%";
	}
	
	override public function update():Void
	{
		super.update();
		
		if (night_blackveil.alive == false)
		{
			//-- DEBUG BUTTONS
			if (FlxG.keys.justPressed.A)
			{
				power_left = 1;
				AssetsMonitorLayout.power_percentage.text = Std.string(AssetsOfficeBackground.power_left) + "%";
			}
			
			//-- Camera Simulation - For real life turning head mode
			distance_x = FlxG.mouse.x - office_mole.x;
			distance_y = FlxG.mouse.y - office_mole.y;
			distance = Math.sqrt(distance_x * distance_x + distance_y * distance_y);
			
			if (distance > 1 && office_camera_monitor.alive == false && AssetsMonitorLayout.office_camera_blackveil.alive == false)
			{
				office_mole.x +=  distance_x * 0.02;
				office_mole.y +=  distance_y * 0.02;
			}
			
			//-- Checking if lights are still open after the flickering have been completed then closing it.
			light_resetting();
			
			if (power_shut == 0)
			{
				//-- Power Usage
				if (power_clock >= power_tick)
				{
					if (power_left == 0)
					{
						//-- DUN DUN DUUUUUUUUUUUUUUUUUUUUUUUUUUUN!
						power_shut = 1;
						sfx_background_01.stop();
						sfx_background_02.stop();
						sfx_background_03.stop();
						shut_office_down();
					}
					else
					{
						power_left--;
						AssetsMonitorLayout.power_percentage.text = Std.string(AssetsOfficeBackground.power_left) + "%";
						power_clock = 0;
					}
				}
				else
				{
					power_clock += (power_elapse + (power_multiplier * AssetsMonitorLayout.usage_consumption));
				}
			}
			
			//-- Time is Gold~
			if (time_shut == 0)
			{
				if (time_clock >= time_tick)
				{
					if (time_increment == 5)
					{
						if (power_shut == 1)
						{
							//-- DIVINE INTERVENTION!!!!!!!!!!!!!!
							successful_night();
						}
						else
						{
							//-- GOOD JOB!!!!!!!!!!!!!!
							if (sfx_background_01.playing == true)
							{
								sfx_background_01.stop();
							}
								
							if (sfx_background_02.playing == true)
							{
								sfx_background_02.stop();
							}
							
							if (sfx_background_03.playing == true)
							{
								sfx_background_03.stop();
							}
							
							if (sfx_power_down.playing == true)
							{
								sfx_power_down.stop();
							}
							
							successful_night();
						}
						
						time_shut = 1;
					}
					else
					{
						time_increment++;
						time_clock = 0;
					}
				}
				else
				{
					time_clock += time_elapse;
				}
				
				if (time_increment == 0)
				{
					AssetsMonitorLayout.hours_text.text = "12 AM";
					AssetsMonitorLayout.night_text.text = "Night " + night_counter;
				}
				else
				{
					AssetsMonitorLayout.hours_text.text = time_increment + " AM";
					AssetsMonitorLayout.night_text.text = "Night " + night_counter;
				}
			}
		}
	}	
}