import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("Five Nights at Freddy's complete Regular");
		types.push (AssetType.FONT);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_1a.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_1b.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_1c.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_2a.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_2b.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_4a.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_4b.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_5.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_6.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/button_cam_7.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/map/camera_map.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monitor_stuff/usage_bar.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monsters_assets/death_freddy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monsters_assets/death_golden_freddy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monsters_assets/golden_freddy_suit.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monsters_assets/hallucination_its_me_bonnie.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/monsters_assets/hallucination_its_me_freddy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/black_out_screen.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_actual_interaction_left.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_actual_interaction_right.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/buttons/button_honking.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/camera_monitor.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/camera_monitor_flickering.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/camera_monitor_linings.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/camera_monitor_toggle.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/door_left.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/door_right.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/game_over_screen.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/glorious_timestamp.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/lights_left_side.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/lights_right_side.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/office_fan.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/office_main.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/office_main_dark.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/office_stuff/universal_screen_static.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_1a.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_1b.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_1c.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_2a.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_2b.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_4a.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_4b.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_5.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/rooms/camera_7.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/title_stuff/main_title_text.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/title_stuff/new_game_button.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/title_stuff/title_screen_filler.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/title_stuff/title_screen_flicker.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/background_sound_01.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/background_sound_02.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/background_sound_03.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/deep_steps.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/door_bell.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/door_sound_effects.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/freddy_nose_honk.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hallucinating_static.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/laugh_normal.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/laugh_spook_01.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/laugh_spook_02.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/laugh_spook_03.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/light_sound_effects.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monitor_down.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monitor_up.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/music_box.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/panel_deny.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/scream_golden.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/scream_normal.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/shutting_power.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/static_blips.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/title_screen_music.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/yay_cheers.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/door_sound_effects.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/freddy_nose_honk.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/laugh_normal.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/laugh_spook_01.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/laugh_spook_02.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/laugh_spook_03.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/light_sound_effects.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/monitor_down.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/monitor_up.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/panel_deny.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/static_blips.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/door_bell.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/yay_cheers.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/title_screen_music.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/shutting_power.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/music_box.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/scream_normal.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/scream_golden.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/deep_steps.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/hallucinating_static.wav");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/background_sound_01.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/background_sound_02.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/background_sound_03.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (AssetType.MUSIC);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (450),
			orientation: "portrait",
			resizable: true,
			stencilBuffer: false,
			title: "Five Nights at AJ's",
			vsync: false,
			width: Std.int (800),
			
		}
		
		#if js
		#if (munit || utest)
		flash.Lib.embed (null, 800, 450, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
