package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/Five-Nights-at-Freddys.ttf", __ASSET__assets_data_five_nights_at_freddys_ttf);
		type.set ("assets/data/Five-Nights-at-Freddys.ttf", AssetType.FONT);
		className.set ("assets/images/monitor_stuff/map/button_cam_1a.png", __ASSET__assets_images_monitor_stuff_map_button_cam_1a_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_1a.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_1b.png", __ASSET__assets_images_monitor_stuff_map_button_cam_1b_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_1b.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_1c.png", __ASSET__assets_images_monitor_stuff_map_button_cam_1c_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_1c.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_2a.png", __ASSET__assets_images_monitor_stuff_map_button_cam_2a_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_2a.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_2b.png", __ASSET__assets_images_monitor_stuff_map_button_cam_2b_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_2b.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_3.png", __ASSET__assets_images_monitor_stuff_map_button_cam_3_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_3.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_4a.png", __ASSET__assets_images_monitor_stuff_map_button_cam_4a_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_4a.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_4b.png", __ASSET__assets_images_monitor_stuff_map_button_cam_4b_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_4b.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_5.png", __ASSET__assets_images_monitor_stuff_map_button_cam_5_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_5.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_6.png", __ASSET__assets_images_monitor_stuff_map_button_cam_6_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_6.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/button_cam_7.png", __ASSET__assets_images_monitor_stuff_map_button_cam_7_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_7.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/map/camera_map.png", __ASSET__assets_images_monitor_stuff_map_camera_map_png);
		type.set ("assets/images/monitor_stuff/map/camera_map.png", AssetType.IMAGE);
		className.set ("assets/images/monitor_stuff/usage_bar.png", __ASSET__assets_images_monitor_stuff_usage_bar_png);
		type.set ("assets/images/monitor_stuff/usage_bar.png", AssetType.IMAGE);
		className.set ("assets/images/monsters_assets/death_freddy.png", __ASSET__assets_images_monsters_assets_death_freddy_png);
		type.set ("assets/images/monsters_assets/death_freddy.png", AssetType.IMAGE);
		className.set ("assets/images/monsters_assets/death_golden_freddy.png", __ASSET__assets_images_monsters_assets_death_golden_freddy_png);
		type.set ("assets/images/monsters_assets/death_golden_freddy.png", AssetType.IMAGE);
		className.set ("assets/images/monsters_assets/golden_freddy_suit.png", __ASSET__assets_images_monsters_assets_golden_freddy_suit_png);
		type.set ("assets/images/monsters_assets/golden_freddy_suit.png", AssetType.IMAGE);
		className.set ("assets/images/monsters_assets/hallucination_its_me_bonnie.png", __ASSET__assets_images_monsters_assets_hallucination_its_me_bonnie_png);
		type.set ("assets/images/monsters_assets/hallucination_its_me_bonnie.png", AssetType.IMAGE);
		className.set ("assets/images/monsters_assets/hallucination_its_me_freddy.png", __ASSET__assets_images_monsters_assets_hallucination_its_me_freddy_png);
		type.set ("assets/images/monsters_assets/hallucination_its_me_freddy.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/black_out_screen.png", __ASSET__assets_images_office_stuff_black_out_screen_png);
		type.set ("assets/images/office_stuff/black_out_screen.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_left.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_left.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_door_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_light_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_right.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_right.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_door_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_light_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/buttons/button_honking.png", __ASSET__assets_images_office_stuff_buttons_button_honking_png);
		type.set ("assets/images/office_stuff/buttons/button_honking.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/camera_monitor.png", __ASSET__assets_images_office_stuff_camera_monitor_png);
		type.set ("assets/images/office_stuff/camera_monitor.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/camera_monitor_flickering.png", __ASSET__assets_images_office_stuff_camera_monitor_flickering_png);
		type.set ("assets/images/office_stuff/camera_monitor_flickering.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/camera_monitor_linings.png", __ASSET__assets_images_office_stuff_camera_monitor_linings_png);
		type.set ("assets/images/office_stuff/camera_monitor_linings.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/camera_monitor_toggle.png", __ASSET__assets_images_office_stuff_camera_monitor_toggle_png);
		type.set ("assets/images/office_stuff/camera_monitor_toggle.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/door_left.png", __ASSET__assets_images_office_stuff_door_left_png);
		type.set ("assets/images/office_stuff/door_left.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/door_right.png", __ASSET__assets_images_office_stuff_door_right_png);
		type.set ("assets/images/office_stuff/door_right.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/game_over_screen.png", __ASSET__assets_images_office_stuff_game_over_screen_png);
		type.set ("assets/images/office_stuff/game_over_screen.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/glorious_timestamp.png", __ASSET__assets_images_office_stuff_glorious_timestamp_png);
		type.set ("assets/images/office_stuff/glorious_timestamp.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/lights_left_side.png", __ASSET__assets_images_office_stuff_lights_left_side_png);
		type.set ("assets/images/office_stuff/lights_left_side.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/lights_right_side.png", __ASSET__assets_images_office_stuff_lights_right_side_png);
		type.set ("assets/images/office_stuff/lights_right_side.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/office_fan.png", __ASSET__assets_images_office_stuff_office_fan_png);
		type.set ("assets/images/office_stuff/office_fan.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/office_main.png", __ASSET__assets_images_office_stuff_office_main_png);
		type.set ("assets/images/office_stuff/office_main.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/office_main_dark.png", __ASSET__assets_images_office_stuff_office_main_dark_png);
		type.set ("assets/images/office_stuff/office_main_dark.png", AssetType.IMAGE);
		className.set ("assets/images/office_stuff/universal_screen_static.png", __ASSET__assets_images_office_stuff_universal_screen_static_png);
		type.set ("assets/images/office_stuff/universal_screen_static.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_1a.png", __ASSET__assets_images_rooms_camera_1a_png);
		type.set ("assets/images/rooms/camera_1a.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_1b.png", __ASSET__assets_images_rooms_camera_1b_png);
		type.set ("assets/images/rooms/camera_1b.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_1c.png", __ASSET__assets_images_rooms_camera_1c_png);
		type.set ("assets/images/rooms/camera_1c.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_2a.png", __ASSET__assets_images_rooms_camera_2a_png);
		type.set ("assets/images/rooms/camera_2a.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_2b.png", __ASSET__assets_images_rooms_camera_2b_png);
		type.set ("assets/images/rooms/camera_2b.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_3.png", __ASSET__assets_images_rooms_camera_3_png);
		type.set ("assets/images/rooms/camera_3.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_4a.png", __ASSET__assets_images_rooms_camera_4a_png);
		type.set ("assets/images/rooms/camera_4a.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_4b.png", __ASSET__assets_images_rooms_camera_4b_png);
		type.set ("assets/images/rooms/camera_4b.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_5.png", __ASSET__assets_images_rooms_camera_5_png);
		type.set ("assets/images/rooms/camera_5.png", AssetType.IMAGE);
		className.set ("assets/images/rooms/camera_7.png", __ASSET__assets_images_rooms_camera_7_png);
		type.set ("assets/images/rooms/camera_7.png", AssetType.IMAGE);
		className.set ("assets/images/title_stuff/main_title_text.png", __ASSET__assets_images_title_stuff_main_title_text_png);
		type.set ("assets/images/title_stuff/main_title_text.png", AssetType.IMAGE);
		className.set ("assets/images/title_stuff/new_game_button.png", __ASSET__assets_images_title_stuff_new_game_button_png);
		type.set ("assets/images/title_stuff/new_game_button.png", AssetType.IMAGE);
		className.set ("assets/images/title_stuff/title_screen_filler.png", __ASSET__assets_images_title_stuff_title_screen_filler_png);
		type.set ("assets/images/title_stuff/title_screen_filler.png", AssetType.IMAGE);
		className.set ("assets/images/title_stuff/title_screen_flicker.png", __ASSET__assets_images_title_stuff_title_screen_flicker_png);
		type.set ("assets/images/title_stuff/title_screen_flicker.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/background_sound_01.mp3", __ASSET__assets_sounds_background_sound_01_mp3);
		type.set ("assets/sounds/background_sound_01.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/background_sound_02.mp3", __ASSET__assets_sounds_background_sound_02_mp3);
		type.set ("assets/sounds/background_sound_02.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/background_sound_03.mp3", __ASSET__assets_sounds_background_sound_03_mp3);
		type.set ("assets/sounds/background_sound_03.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/deep_steps.wav", __ASSET__assets_sounds_deep_steps_wav);
		type.set ("assets/sounds/deep_steps.wav", AssetType.SOUND);
		className.set ("assets/sounds/door_bell.wav", __ASSET__assets_sounds_door_bell_wav);
		type.set ("assets/sounds/door_bell.wav", AssetType.SOUND);
		className.set ("assets/sounds/door_sound_effects.wav", __ASSET__assets_sounds_door_sound_effects_wav);
		type.set ("assets/sounds/door_sound_effects.wav", AssetType.SOUND);
		className.set ("assets/sounds/freddy_nose_honk.wav", __ASSET__assets_sounds_freddy_nose_honk_wav);
		type.set ("assets/sounds/freddy_nose_honk.wav", AssetType.SOUND);
		className.set ("assets/sounds/hallucinating_static.wav", __ASSET__assets_sounds_hallucinating_static_wav);
		type.set ("assets/sounds/hallucinating_static.wav", AssetType.SOUND);
		className.set ("assets/sounds/laugh_normal.wav", __ASSET__assets_sounds_laugh_normal_wav);
		type.set ("assets/sounds/laugh_normal.wav", AssetType.SOUND);
		className.set ("assets/sounds/laugh_spook_01.wav", __ASSET__assets_sounds_laugh_spook_01_wav);
		type.set ("assets/sounds/laugh_spook_01.wav", AssetType.SOUND);
		className.set ("assets/sounds/laugh_spook_02.wav", __ASSET__assets_sounds_laugh_spook_02_wav);
		type.set ("assets/sounds/laugh_spook_02.wav", AssetType.SOUND);
		className.set ("assets/sounds/laugh_spook_03.wav", __ASSET__assets_sounds_laugh_spook_03_wav);
		type.set ("assets/sounds/laugh_spook_03.wav", AssetType.SOUND);
		className.set ("assets/sounds/light_sound_effects.wav", __ASSET__assets_sounds_light_sound_effects_wav);
		type.set ("assets/sounds/light_sound_effects.wav", AssetType.SOUND);
		className.set ("assets/sounds/monitor_down.wav", __ASSET__assets_sounds_monitor_down_wav);
		type.set ("assets/sounds/monitor_down.wav", AssetType.SOUND);
		className.set ("assets/sounds/monitor_up.wav", __ASSET__assets_sounds_monitor_up_wav);
		type.set ("assets/sounds/monitor_up.wav", AssetType.SOUND);
		className.set ("assets/sounds/music_box.mp3", __ASSET__assets_sounds_music_box_mp3);
		type.set ("assets/sounds/music_box.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/panel_deny.wav", __ASSET__assets_sounds_panel_deny_wav);
		type.set ("assets/sounds/panel_deny.wav", AssetType.SOUND);
		className.set ("assets/sounds/scream_golden.wav", __ASSET__assets_sounds_scream_golden_wav);
		type.set ("assets/sounds/scream_golden.wav", AssetType.SOUND);
		className.set ("assets/sounds/scream_normal.wav", __ASSET__assets_sounds_scream_normal_wav);
		type.set ("assets/sounds/scream_normal.wav", AssetType.SOUND);
		className.set ("assets/sounds/shutting_power.wav", __ASSET__assets_sounds_shutting_power_wav);
		type.set ("assets/sounds/shutting_power.wav", AssetType.SOUND);
		className.set ("assets/sounds/static_blips.wav", __ASSET__assets_sounds_static_blips_wav);
		type.set ("assets/sounds/static_blips.wav", AssetType.SOUND);
		className.set ("assets/sounds/title_screen_music.mp3", __ASSET__assets_sounds_title_screen_music_mp3);
		type.set ("assets/sounds/title_screen_music.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/yay_cheers.wav", __ASSET__assets_sounds_yay_cheers_wav);
		type.set ("assets/sounds/yay_cheers.wav", AssetType.SOUND);
		className.set ("door_sound", __ASSET__assets_sounds_door_sound_effects_wav1);
		type.set ("door_sound", AssetType.MUSIC);
		className.set ("nose_honk", __ASSET__assets_sounds_freddy_nose_honk_wav1);
		type.set ("nose_honk", AssetType.MUSIC);
		className.set ("laugh_normal", __ASSET__assets_sounds_laugh_normal_wav1);
		type.set ("laugh_normal", AssetType.MUSIC);
		className.set ("laugh_spook_01", __ASSET__assets_sounds_laugh_spook_2);
		type.set ("laugh_spook_01", AssetType.MUSIC);
		className.set ("laugh_spook_02", __ASSET__assets_sounds_laugh_spook_3);
		type.set ("laugh_spook_02", AssetType.MUSIC);
		className.set ("laugh_spook_03", __ASSET__assets_sounds_laugh_spook_4);
		type.set ("laugh_spook_03", AssetType.MUSIC);
		className.set ("light_sounds", __ASSET__assets_sounds_light_sound_effects_wav1);
		type.set ("light_sounds", AssetType.MUSIC);
		className.set ("monitor_down", __ASSET__assets_sounds_monitor_down_wav1);
		type.set ("monitor_down", AssetType.MUSIC);
		className.set ("monitor_up", __ASSET__assets_sounds_monitor_up_wav1);
		type.set ("monitor_up", AssetType.MUSIC);
		className.set ("panel_deny", __ASSET__assets_sounds_panel_deny_wav1);
		type.set ("panel_deny", AssetType.MUSIC);
		className.set ("static_blip", __ASSET__assets_sounds_static_blips_wav1);
		type.set ("static_blip", AssetType.MUSIC);
		className.set ("door_bell", __ASSET__assets_sounds_door_bell_wav1);
		type.set ("door_bell", AssetType.MUSIC);
		className.set ("yay_cheers", __ASSET__assets_sounds_yay_cheers_wav1);
		type.set ("yay_cheers", AssetType.MUSIC);
		className.set ("title_music", __ASSET__assets_sounds_title_screen_music_mp4);
		type.set ("title_music", AssetType.MUSIC);
		className.set ("shutting_power", __ASSET__assets_sounds_shutting_power_wav1);
		type.set ("shutting_power", AssetType.MUSIC);
		className.set ("music_box", __ASSET__assets_sounds_music_box_mp4);
		type.set ("music_box", AssetType.MUSIC);
		className.set ("scream_normal", __ASSET__assets_sounds_scream_normal_wav1);
		type.set ("scream_normal", AssetType.MUSIC);
		className.set ("scream_golden", __ASSET__assets_sounds_scream_golden_wav1);
		type.set ("scream_golden", AssetType.MUSIC);
		className.set ("deep_steps", __ASSET__assets_sounds_deep_steps_wav1);
		type.set ("deep_steps", AssetType.MUSIC);
		className.set ("hallucinating_static", __ASSET__assets_sounds_hallucinating_static_wav1);
		type.set ("hallucinating_static", AssetType.MUSIC);
		className.set ("background_01", __ASSET__assets_sounds_background_sound_2);
		type.set ("background_01", AssetType.MUSIC);
		className.set ("background_02", __ASSET__assets_sounds_background_sound_3);
		type.set ("background_02", AssetType.MUSIC);
		className.set ("background_03", __ASSET__assets_sounds_background_sound_4);
		type.set ("background_03", AssetType.MUSIC);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/Five-Nights-at-Freddys.ttf";
		className.set (id, __ASSET__assets_data_five_nights_at_freddys_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/monitor_stuff/map/button_cam_1a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_1b.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_1c.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_2a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_2b.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_4a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_4b.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/button_cam_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/map/camera_map.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monitor_stuff/usage_bar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monsters_assets/death_freddy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monsters_assets/death_golden_freddy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monsters_assets/golden_freddy_suit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monsters_assets/hallucination_its_me_bonnie.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/monsters_assets/hallucination_its_me_freddy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/black_out_screen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_actual_interaction_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_actual_interaction_left_door.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_actual_interaction_left_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_actual_interaction_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_actual_interaction_right_door.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_actual_interaction_right_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/buttons/button_honking.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/camera_monitor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/camera_monitor_flickering.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/camera_monitor_linings.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/camera_monitor_toggle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/door_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/door_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/game_over_screen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/glorious_timestamp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/lights_left_side.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/lights_right_side.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/office_fan.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/office_main.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/office_main_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/office_stuff/universal_screen_static.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_1a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_1b.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_1c.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_2a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_2b.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_4a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_4b.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rooms/camera_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_stuff/main_title_text.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_stuff/new_game_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_stuff/title_screen_filler.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_stuff/title_screen_flicker.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/background_sound_01.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/background_sound_02.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/background_sound_03.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/deep_steps.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/door_bell.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/door_sound_effects.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/freddy_nose_honk.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/hallucinating_static.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/laugh_normal.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/laugh_spook_01.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/laugh_spook_02.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/laugh_spook_03.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/light_sound_effects.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monitor_down.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monitor_up.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/music_box.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/panel_deny.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/scream_golden.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/scream_normal.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/shutting_power.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/static_blips.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/title_screen_music.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/yay_cheers.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "door_sound";
		path.set (id, "assets/sounds/door_sound_effects.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "nose_honk";
		path.set (id, "assets/sounds/freddy_nose_honk.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "laugh_normal";
		path.set (id, "assets/sounds/laugh_normal.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "laugh_spook_01";
		path.set (id, "assets/sounds/laugh_spook_01.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "laugh_spook_02";
		path.set (id, "assets/sounds/laugh_spook_02.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "laugh_spook_03";
		path.set (id, "assets/sounds/laugh_spook_03.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "light_sounds";
		path.set (id, "assets/sounds/light_sound_effects.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "monitor_down";
		path.set (id, "assets/sounds/monitor_down.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "monitor_up";
		path.set (id, "assets/sounds/monitor_up.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "panel_deny";
		path.set (id, "assets/sounds/panel_deny.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "static_blip";
		path.set (id, "assets/sounds/static_blips.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "door_bell";
		path.set (id, "assets/sounds/door_bell.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "yay_cheers";
		path.set (id, "assets/sounds/yay_cheers.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "title_music";
		path.set (id, "assets/sounds/title_screen_music.mp3");
		
		type.set (id, AssetType.MUSIC);
		id = "shutting_power";
		path.set (id, "assets/sounds/shutting_power.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "music_box";
		path.set (id, "assets/sounds/music_box.mp3");
		
		type.set (id, AssetType.MUSIC);
		id = "scream_normal";
		path.set (id, "assets/sounds/scream_normal.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "scream_golden";
		path.set (id, "assets/sounds/scream_golden.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "deep_steps";
		path.set (id, "assets/sounds/deep_steps.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "hallucinating_static";
		path.set (id, "assets/sounds/hallucinating_static.wav");
		
		type.set (id, AssetType.MUSIC);
		id = "background_01";
		path.set (id, "assets/sounds/background_sound_01.mp3");
		
		type.set (id, AssetType.MUSIC);
		id = "background_02";
		path.set (id, "assets/sounds/background_sound_02.mp3");
		
		type.set (id, AssetType.MUSIC);
		id = "background_03";
		path.set (id, "assets/sounds/background_sound_03.mp3");
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		#else
		
		#if openfl
		
		openfl.text.Font.registerFont (__ASSET__assets_data_five_nights_at_freddys_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/Five-Nights-at-Freddys.ttf", __ASSET__assets_data_five_nights_at_freddys_ttf);
		type.set ("assets/data/Five-Nights-at-Freddys.ttf", AssetType.FONT);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_1a.png", __ASSET__assets_images_monitor_stuff_map_button_cam_1a_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_1a.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_1b.png", __ASSET__assets_images_monitor_stuff_map_button_cam_1b_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_1b.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_1c.png", __ASSET__assets_images_monitor_stuff_map_button_cam_1c_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_1c.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_2a.png", __ASSET__assets_images_monitor_stuff_map_button_cam_2a_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_2a.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_2b.png", __ASSET__assets_images_monitor_stuff_map_button_cam_2b_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_2b.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_3.png", __ASSET__assets_images_monitor_stuff_map_button_cam_3_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_3.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_4a.png", __ASSET__assets_images_monitor_stuff_map_button_cam_4a_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_4a.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_4b.png", __ASSET__assets_images_monitor_stuff_map_button_cam_4b_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_4b.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_5.png", __ASSET__assets_images_monitor_stuff_map_button_cam_5_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_5.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_6.png", __ASSET__assets_images_monitor_stuff_map_button_cam_6_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_6.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/button_cam_7.png", __ASSET__assets_images_monitor_stuff_map_button_cam_7_png);
		type.set ("assets/images/monitor_stuff/map/button_cam_7.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/map/camera_map.png", __ASSET__assets_images_monitor_stuff_map_camera_map_png);
		type.set ("assets/images/monitor_stuff/map/camera_map.png", AssetType.IMAGE);
		
		className.set ("assets/images/monitor_stuff/usage_bar.png", __ASSET__assets_images_monitor_stuff_usage_bar_png);
		type.set ("assets/images/monitor_stuff/usage_bar.png", AssetType.IMAGE);
		
		className.set ("assets/images/monsters_assets/death_freddy.png", __ASSET__assets_images_monsters_assets_death_freddy_png);
		type.set ("assets/images/monsters_assets/death_freddy.png", AssetType.IMAGE);
		
		className.set ("assets/images/monsters_assets/death_golden_freddy.png", __ASSET__assets_images_monsters_assets_death_golden_freddy_png);
		type.set ("assets/images/monsters_assets/death_golden_freddy.png", AssetType.IMAGE);
		
		className.set ("assets/images/monsters_assets/golden_freddy_suit.png", __ASSET__assets_images_monsters_assets_golden_freddy_suit_png);
		type.set ("assets/images/monsters_assets/golden_freddy_suit.png", AssetType.IMAGE);
		
		className.set ("assets/images/monsters_assets/hallucination_its_me_bonnie.png", __ASSET__assets_images_monsters_assets_hallucination_its_me_bonnie_png);
		type.set ("assets/images/monsters_assets/hallucination_its_me_bonnie.png", AssetType.IMAGE);
		
		className.set ("assets/images/monsters_assets/hallucination_its_me_freddy.png", __ASSET__assets_images_monsters_assets_hallucination_its_me_freddy_png);
		type.set ("assets/images/monsters_assets/hallucination_its_me_freddy.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/black_out_screen.png", __ASSET__assets_images_office_stuff_black_out_screen_png);
		type.set ("assets/images/office_stuff/black_out_screen.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_left.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_left.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_door_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_light_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_right.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_right.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_door_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png", __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_light_png);
		type.set ("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/buttons/button_honking.png", __ASSET__assets_images_office_stuff_buttons_button_honking_png);
		type.set ("assets/images/office_stuff/buttons/button_honking.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/camera_monitor.png", __ASSET__assets_images_office_stuff_camera_monitor_png);
		type.set ("assets/images/office_stuff/camera_monitor.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/camera_monitor_flickering.png", __ASSET__assets_images_office_stuff_camera_monitor_flickering_png);
		type.set ("assets/images/office_stuff/camera_monitor_flickering.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/camera_monitor_linings.png", __ASSET__assets_images_office_stuff_camera_monitor_linings_png);
		type.set ("assets/images/office_stuff/camera_monitor_linings.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/camera_monitor_toggle.png", __ASSET__assets_images_office_stuff_camera_monitor_toggle_png);
		type.set ("assets/images/office_stuff/camera_monitor_toggle.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/door_left.png", __ASSET__assets_images_office_stuff_door_left_png);
		type.set ("assets/images/office_stuff/door_left.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/door_right.png", __ASSET__assets_images_office_stuff_door_right_png);
		type.set ("assets/images/office_stuff/door_right.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/game_over_screen.png", __ASSET__assets_images_office_stuff_game_over_screen_png);
		type.set ("assets/images/office_stuff/game_over_screen.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/glorious_timestamp.png", __ASSET__assets_images_office_stuff_glorious_timestamp_png);
		type.set ("assets/images/office_stuff/glorious_timestamp.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/lights_left_side.png", __ASSET__assets_images_office_stuff_lights_left_side_png);
		type.set ("assets/images/office_stuff/lights_left_side.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/lights_right_side.png", __ASSET__assets_images_office_stuff_lights_right_side_png);
		type.set ("assets/images/office_stuff/lights_right_side.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/office_fan.png", __ASSET__assets_images_office_stuff_office_fan_png);
		type.set ("assets/images/office_stuff/office_fan.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/office_main.png", __ASSET__assets_images_office_stuff_office_main_png);
		type.set ("assets/images/office_stuff/office_main.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/office_main_dark.png", __ASSET__assets_images_office_stuff_office_main_dark_png);
		type.set ("assets/images/office_stuff/office_main_dark.png", AssetType.IMAGE);
		
		className.set ("assets/images/office_stuff/universal_screen_static.png", __ASSET__assets_images_office_stuff_universal_screen_static_png);
		type.set ("assets/images/office_stuff/universal_screen_static.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_1a.png", __ASSET__assets_images_rooms_camera_1a_png);
		type.set ("assets/images/rooms/camera_1a.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_1b.png", __ASSET__assets_images_rooms_camera_1b_png);
		type.set ("assets/images/rooms/camera_1b.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_1c.png", __ASSET__assets_images_rooms_camera_1c_png);
		type.set ("assets/images/rooms/camera_1c.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_2a.png", __ASSET__assets_images_rooms_camera_2a_png);
		type.set ("assets/images/rooms/camera_2a.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_2b.png", __ASSET__assets_images_rooms_camera_2b_png);
		type.set ("assets/images/rooms/camera_2b.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_3.png", __ASSET__assets_images_rooms_camera_3_png);
		type.set ("assets/images/rooms/camera_3.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_4a.png", __ASSET__assets_images_rooms_camera_4a_png);
		type.set ("assets/images/rooms/camera_4a.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_4b.png", __ASSET__assets_images_rooms_camera_4b_png);
		type.set ("assets/images/rooms/camera_4b.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_5.png", __ASSET__assets_images_rooms_camera_5_png);
		type.set ("assets/images/rooms/camera_5.png", AssetType.IMAGE);
		
		className.set ("assets/images/rooms/camera_7.png", __ASSET__assets_images_rooms_camera_7_png);
		type.set ("assets/images/rooms/camera_7.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_stuff/main_title_text.png", __ASSET__assets_images_title_stuff_main_title_text_png);
		type.set ("assets/images/title_stuff/main_title_text.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_stuff/new_game_button.png", __ASSET__assets_images_title_stuff_new_game_button_png);
		type.set ("assets/images/title_stuff/new_game_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_stuff/title_screen_filler.png", __ASSET__assets_images_title_stuff_title_screen_filler_png);
		type.set ("assets/images/title_stuff/title_screen_filler.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_stuff/title_screen_flicker.png", __ASSET__assets_images_title_stuff_title_screen_flicker_png);
		type.set ("assets/images/title_stuff/title_screen_flicker.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/background_sound_01.mp3", __ASSET__assets_sounds_background_sound_01_mp3);
		type.set ("assets/sounds/background_sound_01.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/background_sound_02.mp3", __ASSET__assets_sounds_background_sound_02_mp3);
		type.set ("assets/sounds/background_sound_02.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/background_sound_03.mp3", __ASSET__assets_sounds_background_sound_03_mp3);
		type.set ("assets/sounds/background_sound_03.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/deep_steps.wav", __ASSET__assets_sounds_deep_steps_wav);
		type.set ("assets/sounds/deep_steps.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/door_bell.wav", __ASSET__assets_sounds_door_bell_wav);
		type.set ("assets/sounds/door_bell.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/door_sound_effects.wav", __ASSET__assets_sounds_door_sound_effects_wav);
		type.set ("assets/sounds/door_sound_effects.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/freddy_nose_honk.wav", __ASSET__assets_sounds_freddy_nose_honk_wav);
		type.set ("assets/sounds/freddy_nose_honk.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/hallucinating_static.wav", __ASSET__assets_sounds_hallucinating_static_wav);
		type.set ("assets/sounds/hallucinating_static.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/laugh_normal.wav", __ASSET__assets_sounds_laugh_normal_wav);
		type.set ("assets/sounds/laugh_normal.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/laugh_spook_01.wav", __ASSET__assets_sounds_laugh_spook_01_wav);
		type.set ("assets/sounds/laugh_spook_01.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/laugh_spook_02.wav", __ASSET__assets_sounds_laugh_spook_02_wav);
		type.set ("assets/sounds/laugh_spook_02.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/laugh_spook_03.wav", __ASSET__assets_sounds_laugh_spook_03_wav);
		type.set ("assets/sounds/laugh_spook_03.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/light_sound_effects.wav", __ASSET__assets_sounds_light_sound_effects_wav);
		type.set ("assets/sounds/light_sound_effects.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monitor_down.wav", __ASSET__assets_sounds_monitor_down_wav);
		type.set ("assets/sounds/monitor_down.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monitor_up.wav", __ASSET__assets_sounds_monitor_up_wav);
		type.set ("assets/sounds/monitor_up.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/music_box.mp3", __ASSET__assets_sounds_music_box_mp3);
		type.set ("assets/sounds/music_box.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/panel_deny.wav", __ASSET__assets_sounds_panel_deny_wav);
		type.set ("assets/sounds/panel_deny.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/scream_golden.wav", __ASSET__assets_sounds_scream_golden_wav);
		type.set ("assets/sounds/scream_golden.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/scream_normal.wav", __ASSET__assets_sounds_scream_normal_wav);
		type.set ("assets/sounds/scream_normal.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/shutting_power.wav", __ASSET__assets_sounds_shutting_power_wav);
		type.set ("assets/sounds/shutting_power.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/static_blips.wav", __ASSET__assets_sounds_static_blips_wav);
		type.set ("assets/sounds/static_blips.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/title_screen_music.mp3", __ASSET__assets_sounds_title_screen_music_mp3);
		type.set ("assets/sounds/title_screen_music.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/yay_cheers.wav", __ASSET__assets_sounds_yay_cheers_wav);
		type.set ("assets/sounds/yay_cheers.wav", AssetType.SOUND);
		
		className.set ("door_sound", __ASSET__assets_sounds_door_sound_effects_wav1);
		type.set ("door_sound", AssetType.MUSIC);
		
		className.set ("nose_honk", __ASSET__assets_sounds_freddy_nose_honk_wav1);
		type.set ("nose_honk", AssetType.MUSIC);
		
		className.set ("laugh_normal", __ASSET__assets_sounds_laugh_normal_wav1);
		type.set ("laugh_normal", AssetType.MUSIC);
		
		className.set ("laugh_spook_01", __ASSET__assets_sounds_laugh_spook_2);
		type.set ("laugh_spook_01", AssetType.MUSIC);
		
		className.set ("laugh_spook_02", __ASSET__assets_sounds_laugh_spook_3);
		type.set ("laugh_spook_02", AssetType.MUSIC);
		
		className.set ("laugh_spook_03", __ASSET__assets_sounds_laugh_spook_4);
		type.set ("laugh_spook_03", AssetType.MUSIC);
		
		className.set ("light_sounds", __ASSET__assets_sounds_light_sound_effects_wav1);
		type.set ("light_sounds", AssetType.MUSIC);
		
		className.set ("monitor_down", __ASSET__assets_sounds_monitor_down_wav1);
		type.set ("monitor_down", AssetType.MUSIC);
		
		className.set ("monitor_up", __ASSET__assets_sounds_monitor_up_wav1);
		type.set ("monitor_up", AssetType.MUSIC);
		
		className.set ("panel_deny", __ASSET__assets_sounds_panel_deny_wav1);
		type.set ("panel_deny", AssetType.MUSIC);
		
		className.set ("static_blip", __ASSET__assets_sounds_static_blips_wav1);
		type.set ("static_blip", AssetType.MUSIC);
		
		className.set ("door_bell", __ASSET__assets_sounds_door_bell_wav1);
		type.set ("door_bell", AssetType.MUSIC);
		
		className.set ("yay_cheers", __ASSET__assets_sounds_yay_cheers_wav1);
		type.set ("yay_cheers", AssetType.MUSIC);
		
		className.set ("title_music", __ASSET__assets_sounds_title_screen_music_mp4);
		type.set ("title_music", AssetType.MUSIC);
		
		className.set ("shutting_power", __ASSET__assets_sounds_shutting_power_wav1);
		type.set ("shutting_power", AssetType.MUSIC);
		
		className.set ("music_box", __ASSET__assets_sounds_music_box_mp4);
		type.set ("music_box", AssetType.MUSIC);
		
		className.set ("scream_normal", __ASSET__assets_sounds_scream_normal_wav1);
		type.set ("scream_normal", AssetType.MUSIC);
		
		className.set ("scream_golden", __ASSET__assets_sounds_scream_golden_wav1);
		type.set ("scream_golden", AssetType.MUSIC);
		
		className.set ("deep_steps", __ASSET__assets_sounds_deep_steps_wav1);
		type.set ("deep_steps", AssetType.MUSIC);
		
		className.set ("hallucinating_static", __ASSET__assets_sounds_hallucinating_static_wav1);
		type.set ("hallucinating_static", AssetType.MUSIC);
		
		className.set ("background_01", __ASSET__assets_sounds_background_sound_2);
		type.set ("background_01", AssetType.MUSIC);
		
		className.set ("background_02", __ASSET__assets_sounds_background_sound_3);
		type.set ("background_02", AssetType.MUSIC);
		
		className.set ("background_03", __ASSET__assets_sounds_background_sound_4);
		type.set ("background_03", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_five_nights_at_freddys_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_1a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_1b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_1c_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_2a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_2b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_4a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_4b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_button_cam_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_map_camera_map_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monitor_stuff_usage_bar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monsters_assets_death_freddy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monsters_assets_death_golden_freddy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monsters_assets_golden_freddy_suit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monsters_assets_hallucination_its_me_bonnie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_monsters_assets_hallucination_its_me_freddy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_black_out_screen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_door_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_door_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_buttons_button_honking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_camera_monitor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_camera_monitor_flickering_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_camera_monitor_linings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_camera_monitor_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_door_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_door_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_game_over_screen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_glorious_timestamp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_lights_left_side_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_lights_right_side_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_office_fan_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_office_main_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_office_main_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_office_stuff_universal_screen_static_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_1a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_1b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_1c_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_2a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_2b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_4a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_4b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rooms_camera_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_stuff_main_title_text_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_stuff_new_game_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_stuff_title_screen_filler_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_stuff_title_screen_flicker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_background_sound_01_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_background_sound_02_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_background_sound_03_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_deep_steps_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_door_bell_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_door_sound_effects_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_freddy_nose_honk_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hallucinating_static_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_normal_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_spook_01_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_spook_02_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_spook_03_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_light_sound_effects_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monitor_down_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monitor_up_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_box_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_panel_deny_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_scream_golden_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_scream_normal_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shutting_power_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_static_blips_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_title_screen_music_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_yay_cheers_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_door_sound_effects_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_freddy_nose_honk_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_normal_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_spook_2 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_spook_3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laugh_spook_4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_light_sound_effects_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monitor_down_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monitor_up_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_panel_deny_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_static_blips_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_door_bell_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_yay_cheers_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_title_screen_music_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shutting_power_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_box_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_scream_normal_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_scream_golden_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_deep_steps_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hallucinating_static_wav1 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_background_sound_2 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_background_sound_3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_background_sound_4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

#if openfl
@:keep #if display private #end class __ASSET__assets_data_five_nights_at_freddys_ttf extends openfl.text.Font { public function new () { super (); fontName = "Five Nights at Freddy's complete Regular"; } } 








































































































#end

#else

#if openfl
@:keep class __ASSET__assets_data_five_nights_at_freddys_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/data/Five-Nights-at-Freddys.ttf"; fontName = "Five Nights at Freddy's complete Regular"; }}

#end

#if (windows || mac || linux)


@:font("assets/data/Five-Nights-at-Freddys.ttf") class __ASSET__assets_data_five_nights_at_freddys_ttf extends lime.graphics.Font {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_1a.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_1a_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_1b.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_1b_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_1c.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_1c_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_2a.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_2a_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_2b.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_2b_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_3.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_3_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_4a.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_4a_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_4b.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_4b_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_5.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_5_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_6.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_6_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/button_cam_7.png") class __ASSET__assets_images_monitor_stuff_map_button_cam_7_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/map/camera_map.png") class __ASSET__assets_images_monitor_stuff_map_camera_map_png extends lime.graphics.Image {}
@:bitmap("assets/images/monitor_stuff/usage_bar.png") class __ASSET__assets_images_monitor_stuff_usage_bar_png extends lime.graphics.Image {}
@:bitmap("assets/images/monsters_assets/death_freddy.png") class __ASSET__assets_images_monsters_assets_death_freddy_png extends lime.graphics.Image {}
@:bitmap("assets/images/monsters_assets/death_golden_freddy.png") class __ASSET__assets_images_monsters_assets_death_golden_freddy_png extends lime.graphics.Image {}
@:bitmap("assets/images/monsters_assets/golden_freddy_suit.png") class __ASSET__assets_images_monsters_assets_golden_freddy_suit_png extends lime.graphics.Image {}
@:bitmap("assets/images/monsters_assets/hallucination_its_me_bonnie.png") class __ASSET__assets_images_monsters_assets_hallucination_its_me_bonnie_png extends lime.graphics.Image {}
@:bitmap("assets/images/monsters_assets/hallucination_its_me_freddy.png") class __ASSET__assets_images_monsters_assets_hallucination_its_me_freddy_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/black_out_screen.png") class __ASSET__assets_images_office_stuff_black_out_screen_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_actual_interaction_left.png") class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_actual_interaction_left_door.png") class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_door_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_actual_interaction_left_light.png") class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_left_light_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_actual_interaction_right.png") class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_actual_interaction_right_door.png") class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_door_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_actual_interaction_right_light.png") class __ASSET__assets_images_office_stuff_buttons_button_actual_interaction_right_light_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/buttons/button_honking.png") class __ASSET__assets_images_office_stuff_buttons_button_honking_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/camera_monitor.png") class __ASSET__assets_images_office_stuff_camera_monitor_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/camera_monitor_flickering.png") class __ASSET__assets_images_office_stuff_camera_monitor_flickering_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/camera_monitor_linings.png") class __ASSET__assets_images_office_stuff_camera_monitor_linings_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/camera_monitor_toggle.png") class __ASSET__assets_images_office_stuff_camera_monitor_toggle_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/door_left.png") class __ASSET__assets_images_office_stuff_door_left_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/door_right.png") class __ASSET__assets_images_office_stuff_door_right_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/game_over_screen.png") class __ASSET__assets_images_office_stuff_game_over_screen_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/glorious_timestamp.png") class __ASSET__assets_images_office_stuff_glorious_timestamp_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/lights_left_side.png") class __ASSET__assets_images_office_stuff_lights_left_side_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/lights_right_side.png") class __ASSET__assets_images_office_stuff_lights_right_side_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/office_fan.png") class __ASSET__assets_images_office_stuff_office_fan_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/office_main.png") class __ASSET__assets_images_office_stuff_office_main_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/office_main_dark.png") class __ASSET__assets_images_office_stuff_office_main_dark_png extends lime.graphics.Image {}
@:bitmap("assets/images/office_stuff/universal_screen_static.png") class __ASSET__assets_images_office_stuff_universal_screen_static_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_1a.png") class __ASSET__assets_images_rooms_camera_1a_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_1b.png") class __ASSET__assets_images_rooms_camera_1b_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_1c.png") class __ASSET__assets_images_rooms_camera_1c_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_2a.png") class __ASSET__assets_images_rooms_camera_2a_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_2b.png") class __ASSET__assets_images_rooms_camera_2b_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_3.png") class __ASSET__assets_images_rooms_camera_3_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_4a.png") class __ASSET__assets_images_rooms_camera_4a_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_4b.png") class __ASSET__assets_images_rooms_camera_4b_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_5.png") class __ASSET__assets_images_rooms_camera_5_png extends lime.graphics.Image {}
@:bitmap("assets/images/rooms/camera_7.png") class __ASSET__assets_images_rooms_camera_7_png extends lime.graphics.Image {}
@:bitmap("assets/images/title_stuff/main_title_text.png") class __ASSET__assets_images_title_stuff_main_title_text_png extends lime.graphics.Image {}
@:bitmap("assets/images/title_stuff/new_game_button.png") class __ASSET__assets_images_title_stuff_new_game_button_png extends lime.graphics.Image {}
@:bitmap("assets/images/title_stuff/title_screen_filler.png") class __ASSET__assets_images_title_stuff_title_screen_filler_png extends lime.graphics.Image {}
@:bitmap("assets/images/title_stuff/title_screen_flicker.png") class __ASSET__assets_images_title_stuff_title_screen_flicker_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:sound("assets/sounds/background_sound_01.mp3") class __ASSET__assets_sounds_background_sound_01_mp3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/background_sound_02.mp3") class __ASSET__assets_sounds_background_sound_02_mp3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/background_sound_03.mp3") class __ASSET__assets_sounds_background_sound_03_mp3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/deep_steps.wav") class __ASSET__assets_sounds_deep_steps_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/door_bell.wav") class __ASSET__assets_sounds_door_bell_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/door_sound_effects.wav") class __ASSET__assets_sounds_door_sound_effects_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/freddy_nose_honk.wav") class __ASSET__assets_sounds_freddy_nose_honk_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/hallucinating_static.wav") class __ASSET__assets_sounds_hallucinating_static_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_normal.wav") class __ASSET__assets_sounds_laugh_normal_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_spook_01.wav") class __ASSET__assets_sounds_laugh_spook_01_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_spook_02.wav") class __ASSET__assets_sounds_laugh_spook_02_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_spook_03.wav") class __ASSET__assets_sounds_laugh_spook_03_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/light_sound_effects.wav") class __ASSET__assets_sounds_light_sound_effects_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/monitor_down.wav") class __ASSET__assets_sounds_monitor_down_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/monitor_up.wav") class __ASSET__assets_sounds_monitor_up_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/music_box.mp3") class __ASSET__assets_sounds_music_box_mp3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/panel_deny.wav") class __ASSET__assets_sounds_panel_deny_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/scream_golden.wav") class __ASSET__assets_sounds_scream_golden_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/scream_normal.wav") class __ASSET__assets_sounds_scream_normal_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/shutting_power.wav") class __ASSET__assets_sounds_shutting_power_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/static_blips.wav") class __ASSET__assets_sounds_static_blips_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/title_screen_music.mp3") class __ASSET__assets_sounds_title_screen_music_mp3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/yay_cheers.wav") class __ASSET__assets_sounds_yay_cheers_wav extends lime.audio.AudioSource {}
@:sound("assets/sounds/door_sound_effects.wav") class __ASSET__assets_sounds_door_sound_effects_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/freddy_nose_honk.wav") class __ASSET__assets_sounds_freddy_nose_honk_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_normal.wav") class __ASSET__assets_sounds_laugh_normal_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_spook_01.wav") class __ASSET__assets_sounds_laugh_spook_2 extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_spook_02.wav") class __ASSET__assets_sounds_laugh_spook_3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/laugh_spook_03.wav") class __ASSET__assets_sounds_laugh_spook_4 extends lime.audio.AudioSource {}
@:sound("assets/sounds/light_sound_effects.wav") class __ASSET__assets_sounds_light_sound_effects_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/monitor_down.wav") class __ASSET__assets_sounds_monitor_down_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/monitor_up.wav") class __ASSET__assets_sounds_monitor_up_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/panel_deny.wav") class __ASSET__assets_sounds_panel_deny_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/static_blips.wav") class __ASSET__assets_sounds_static_blips_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/door_bell.wav") class __ASSET__assets_sounds_door_bell_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/yay_cheers.wav") class __ASSET__assets_sounds_yay_cheers_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/title_screen_music.mp3") class __ASSET__assets_sounds_title_screen_music_mp4 extends lime.audio.AudioSource {}
@:sound("assets/sounds/shutting_power.wav") class __ASSET__assets_sounds_shutting_power_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/music_box.mp3") class __ASSET__assets_sounds_music_box_mp4 extends lime.audio.AudioSource {}
@:sound("assets/sounds/scream_normal.wav") class __ASSET__assets_sounds_scream_normal_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/scream_golden.wav") class __ASSET__assets_sounds_scream_golden_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/deep_steps.wav") class __ASSET__assets_sounds_deep_steps_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/hallucinating_static.wav") class __ASSET__assets_sounds_hallucinating_static_wav1 extends lime.audio.AudioSource {}
@:sound("assets/sounds/background_sound_01.mp3") class __ASSET__assets_sounds_background_sound_2 extends lime.audio.AudioSource {}
@:sound("assets/sounds/background_sound_02.mp3") class __ASSET__assets_sounds_background_sound_3 extends lime.audio.AudioSource {}
@:sound("assets/sounds/background_sound_03.mp3") class __ASSET__assets_sounds_background_sound_4 extends lime.audio.AudioSource {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,6/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends lime.audio.AudioSource {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,6/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends lime.audio.AudioSource {}



#end

#end
#end

