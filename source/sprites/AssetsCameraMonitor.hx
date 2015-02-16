package sprites;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.plugin.MouseEventManager;

import sprites.AssetsOfficeBackground;


class AssetsCameraMonitor extends FlxState
{
	public static var room_buttons_group:FlxGroup;
	private static var room_maps:FlxSprite;
	private static var button_cam_1a:FlxSprite;
	private static var button_cam_1b:FlxSprite;
	private static var button_cam_1c:FlxSprite;
	private static var button_cam_2a:FlxSprite;
	private static var button_cam_2b:FlxSprite;
	private static var button_cam_3:FlxSprite;
	private static var button_cam_4a:FlxSprite;
	private static var button_cam_4b:FlxSprite;
	private static var button_cam_5:FlxSprite;
	private static var button_cam_6:FlxSprite;
	private static var button_cam_7:FlxSprite;
	
	public static var current_camera:String = "1a";
	public static var camera_changed:Int = 0;

	public function new() 
	{
		super();
		
		room_buttons_group = new FlxGroup();
		add(room_buttons_group);
		
		//-- Rooms Map
		room_maps = new FlxSprite(520, 196, "assets/images/monitor_stuff/map/camera_map.png");
		room_maps.scrollFactor.x = room_maps.scrollFactor.y = 0;
		room_maps.x = 520;
		room_maps.y = 196;
		room_buttons_group.add(room_maps);
		
		button_cam_1a = new FlxSprite();
		button_cam_1a.loadGraphic("assets/images/monitor_stuff/map/button_cam_1a.png", true, 43, 28, false);
		button_cam_1a.scrollFactor.x = button_cam_1a.scrollFactor.y = 0;
		button_cam_1a.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_1a.animation.add("off", [0], 0);
		button_cam_1a.x = 586;
		button_cam_1a.y = 183;
		room_buttons_group.add(button_cam_1a);
		
		button_cam_1b = new FlxSprite();
		button_cam_1b.loadGraphic("assets/images/monitor_stuff/map/button_cam_1b.png", true, 43, 28, false);
		button_cam_1b.scrollFactor.x = button_cam_1b.scrollFactor.y = 0;
		button_cam_1b.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_1b.animation.add("off", [0], 0);
		button_cam_1b.x = 574;
		button_cam_1b.y = 226;
		room_buttons_group.add(button_cam_1b);
		
		button_cam_1c = new FlxSprite();
		button_cam_1c.loadGraphic("assets/images/monitor_stuff/map/button_cam_1c.png", true, 43, 28, false);
		button_cam_1c.scrollFactor.x = button_cam_1c.scrollFactor.y = 0;
		button_cam_1c.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_1c.animation.add("off", [0], 0);
		button_cam_1c.x = 544;
		button_cam_1c.y = 285;
		room_buttons_group.add(button_cam_1c);
		
		button_cam_2a = new FlxSprite();
		button_cam_2a.loadGraphic("assets/images/monitor_stuff/map/button_cam_2a.png", true, 43, 28, false);
		button_cam_2a.scrollFactor.x = button_cam_2a.scrollFactor.y = 0;
		button_cam_2a.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_2a.animation.add("off", [0], 0);
		button_cam_2a.x = 595;
		button_cam_2a.y = 335;
		room_buttons_group.add(button_cam_2a);
		
		button_cam_2b = new FlxSprite();
		button_cam_2b.loadGraphic("assets/images/monitor_stuff/map/button_cam_2b.png", true, 43, 28, false);
		button_cam_2b.scrollFactor.x = button_cam_2b.scrollFactor.y = 0;
		button_cam_2b.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_2b.animation.add("off", [0], 0);
		button_cam_2b.x = 595;
		button_cam_2b.y = 365;
		room_buttons_group.add(button_cam_2b);
		
		button_cam_3 = new FlxSprite();
		button_cam_3.loadGraphic("assets/images/monitor_stuff/map/button_cam_3.png", true, 43, 28, false);
		button_cam_3.scrollFactor.x = button_cam_3.scrollFactor.y = 0;
		button_cam_3.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_3.animation.add("off", [0], 0);
		button_cam_3.x = 531;
		button_cam_3.y = 349;
		room_buttons_group.add(button_cam_3);
		
		button_cam_4a = new FlxSprite();
		button_cam_4a.loadGraphic("assets/images/monitor_stuff/map/button_cam_4a.png", true, 43, 28, false);
		button_cam_4a.scrollFactor.x = button_cam_4a.scrollFactor.y = 0;
		button_cam_4a.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_4a.animation.add("off", [0], 0);
		button_cam_4a.x = 675;
		button_cam_4a.y = 335;
		room_buttons_group.add(button_cam_4a);
		
		button_cam_4b = new FlxSprite();
		button_cam_4b.loadGraphic("assets/images/monitor_stuff/map/button_cam_4b.png", true, 43, 28, false);
		button_cam_4b.scrollFactor.x = button_cam_4b.scrollFactor.y = 0;
		button_cam_4b.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_4b.animation.add("off", [0], 0);
		button_cam_4b.x = 675;
		button_cam_4b.y = 365;
		room_buttons_group.add(button_cam_4b);
		
		button_cam_5 = new FlxSprite();
		button_cam_5.loadGraphic("assets/images/monitor_stuff/map/button_cam_5.png", true, 43, 28, false);
		button_cam_5.scrollFactor.x = button_cam_5.scrollFactor.y = 0;
		button_cam_5.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_5.animation.add("off", [0], 0);
		button_cam_5.x = 498;
		button_cam_5.y = 240;
		room_buttons_group.add(button_cam_5);
		
		button_cam_6 = new FlxSprite();
		button_cam_6.loadGraphic("assets/images/monitor_stuff/map/button_cam_6.png", true, 43, 28, false);
		button_cam_6.scrollFactor.x = button_cam_6.scrollFactor.y = 0;
		button_cam_6.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_6.animation.add("off", [0], 0);
		button_cam_6.x = 736;
		button_cam_6.y = 337;
		room_buttons_group.add(button_cam_6);
		
		button_cam_7 = new FlxSprite();
		button_cam_7.loadGraphic("assets/images/monitor_stuff/map/button_cam_7.png", true, 43, 28, false);
		button_cam_7.scrollFactor.x = button_cam_7.scrollFactor.y = 0;
		button_cam_7.animation.add("blink", [1, 0, 1, 0], 4);
		button_cam_7.animation.add("off", [0], 0);
		button_cam_7.x = 740;
		button_cam_7.y = 240;
		room_buttons_group.add(button_cam_7);
		
		MouseEventManager.add(button_cam_1a, null, pressed_cam_1a, null, null, false, true, true);
		MouseEventManager.add(button_cam_1b, null, pressed_cam_1b, null, null, false, true, true);
		MouseEventManager.add(button_cam_1c, null, pressed_cam_1c, null, null, false, true, true);
		MouseEventManager.add(button_cam_2a, null, pressed_cam_2a, null, null, false, true, true);
		MouseEventManager.add(button_cam_2b, null, pressed_cam_2b, null, null, false, true, true);
		MouseEventManager.add(button_cam_3, null, pressed_cam_3, null, null, false, true, true);
		MouseEventManager.add(button_cam_4a, null, pressed_cam_4a, null, null, false, true, true);
		MouseEventManager.add(button_cam_4b, null, pressed_cam_4b, null, null, false, true, true);
		MouseEventManager.add(button_cam_5, null, pressed_cam_5, null, null, false, true, true);
		MouseEventManager.add(button_cam_6, null, pressed_cam_6, null, null, false, true, true);
		MouseEventManager.add(button_cam_7, null, pressed_cam_7, null, null, false, true, true);
		
		room_buttons_group.setAll("alive", false);
		room_buttons_group.setAll("exists", false);
	}
	
	//-- Update Stuff
	override public function update()
	{
		if (camera_changed == 1)
		{
			reset_buttons();
			
			if (current_camera == "1a")
			{
			   button_cam_1a.animation.play("blink");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");
			}
			else if (current_camera == "1b")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("blink");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");
			}
			else if (current_camera == "1c")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("blink");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");
			}
			else if (current_camera == "2a")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("blink");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");
			}
			else if (current_camera == "2b")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("blink");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");
			}
			else if (current_camera == "3")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("blink");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");	
			}
			else if (current_camera == "4a")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("blink");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");	
			}
			else if (current_camera == "4b")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("blink");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");	
			}
			else if (current_camera == "5")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("blink");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("off");	
			}
			else if (current_camera == "6")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("blink");
			   button_cam_7.animation.play("off");	
			}
			else if (current_camera == "7")
			{
			   button_cam_1a.animation.play("off");
			   button_cam_1b.animation.play("off");
			   button_cam_1c.animation.play("off");
			   button_cam_2a.animation.play("off");
			   button_cam_2b.animation.play("off");
			   button_cam_3.animation.play("off");
			   button_cam_4a.animation.play("off");
			   button_cam_4b.animation.play("off");
			   button_cam_5.animation.play("off");
			   button_cam_6.animation.play("off");
			   button_cam_7.animation.play("blink");	
			}
			
			camera_changed = 0;
			
			if (AssetsOfficeBackground.sfx_static_blip.playing == true)
			{
				AssetsOfficeBackground.sfx_static_blip.stop();
			}
			
			AssetsOfficeBackground.sfx_static_blip.play();
			
			AssetsOfficeBackground.office_camera_monitor_flicker.animation.play("flicker");
		}
		
		super.update();
	}
	
	//-- Reset
	public static function reset_buttons():Void
	{
		button_cam_1a.animation.play("off");
	    button_cam_1b.animation.play("off");
	    button_cam_1c.animation.play("off");
	    button_cam_2a.animation.play("off");
	    button_cam_2b.animation.play("off");
	    button_cam_3.animation.play("off");
	    button_cam_4a.animation.play("off");
	    button_cam_4b.animation.play("off");
	    button_cam_5.animation.play("off");
	    button_cam_6.animation.play("off");
	    button_cam_7.animation.play("off");	
	}
	
	//-- Buttons presses
	
	private static function pressed_cam_1a(object:FlxObject)
	{
		if (current_camera != "1a" && camera_changed == 0)
		{
			current_camera = "1a";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_1b(object:FlxObject)
	{
		if (current_camera != "1b" && camera_changed == 0)
		{
			current_camera = "1b";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_1c(object:FlxObject)
	{
		if (current_camera != "1c" && camera_changed == 0)
		{
			current_camera = "1c";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_2a(object:FlxObject)
	{
		if (current_camera != "2a" && camera_changed == 0)
		{
			current_camera = "2a";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_2b(object:FlxObject)
	{
		if (current_camera != "2b" && camera_changed == 0)
		{
			current_camera = "2b";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_3(object:FlxObject)
	{
		if (current_camera != "3" && camera_changed == 0)
		{
			current_camera = "3";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_4a(object:FlxObject)
	{
		if (current_camera != "4a" && camera_changed == 0)
		{
			current_camera = "4a";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_4b(object:FlxObject)
	{
		if (current_camera != "4b" && camera_changed == 0)
		{
			current_camera = "4b";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_5(object:FlxObject)
	{
		if (current_camera != "5" && camera_changed == 0)
		{
			current_camera = "5";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_6(object:FlxObject)
	{
		if (current_camera != "6" && camera_changed == 0)
		{
			current_camera = "6";
			camera_changed = 1;
		}
	}
	
	private static function pressed_cam_7(object:FlxObject)
	{
		if (current_camera != "7" && camera_changed == 0)
		{
			current_camera = "7";
			camera_changed = 1;
		}
	}
}