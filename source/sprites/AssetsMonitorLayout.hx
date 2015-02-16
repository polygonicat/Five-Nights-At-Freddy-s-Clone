package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.plugin.MouseEventManager;

class AssetsMonitorLayout extends FlxState
{
	//-- Assets
	public static var monitor_elements:FlxGroup;
	public static var office_camera_blackveil:FlxSprite;
	private static var power_indicator:FlxText;
	public static var power_percentage:FlxText;
	private static var usage_indicator:FlxText;
	private static var usage_range:FlxSprite;
	public static var hours_text:FlxText;
	public static var night_text:FlxText;
	
	//-- Process Variables
	public static var usage_consumption:Float = 1;
	
	public function new() 
	{
		super();
		
		monitor_elements = new FlxGroup();
		add(monitor_elements);
		
		office_camera_blackveil = new FlxSprite(0, 0);
		office_camera_blackveil.makeGraphic(800, 450, FlxColor.BLACK, false);
		office_camera_blackveil.scrollFactor.x = 0;
		monitor_elements.add(office_camera_blackveil);
		
		office_camera_blackveil.alive = false;
		office_camera_blackveil.exists = false;
		
		power_indicator = new FlxText(16, 382, 140, "Power Left:");
		power_indicator.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 14, 0xFFFFFF, "left");
		power_indicator.scrollFactor.x = 0;
		monitor_elements.add(power_indicator);
		
		power_percentage = new FlxText((power_indicator.width - 27), (382 - 4), 65, "");
		power_percentage.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 18, 0xFFFFFF, "right");
		power_percentage.scrollFactor.x = 0;
		monitor_elements.add(power_percentage);
		
		power_percentage.text = Std.string(AssetsOfficeBackground.power_left) + "%";
		
		usage_indicator = new FlxText(16, ((power_indicator.y + power_indicator.height) + 12), 0, "Usage:");
		usage_indicator.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 14, 0xFFFFFF, "left");
		usage_indicator.scrollFactor.x = 0;
		monitor_elements.add(usage_indicator);
		
		usage_range = new FlxSprite(82, 405);
		usage_range.loadGraphic("assets/images/monitor_stuff/usage_bar.png", true, 98, 25, false);
		usage_range.animation.add("1", [0], 0, false);
		usage_range.animation.add("2", [1], 0, false);
		usage_range.animation.add("3", [2], 0, false);
		usage_range.animation.add("4", [3], 0, false);
		usage_range.animation.add("5", [4], 0, false);
		usage_range.scrollFactor.x = 0;
		monitor_elements.add(usage_range);
		
		hours_text = new FlxText(685, 19, 100, "6 AM");
		hours_text.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 24, 0xFFFFFF, "right");
		hours_text.scrollFactor.x = 0;
		monitor_elements.add(hours_text);
		
		night_text = new FlxText(685, (hours_text.height + hours_text.y + 15), 100, "Night 1");
		night_text.setFormat("assets/data/Five-Nights-at-Freddys.ttf", 14, 0xFFFFFF, "right");
		night_text.scrollFactor.x = 0;
		monitor_elements.add(night_text);
	}
	
	override public function update():Void
	{
		super.update();
		
		//-- Updating the consumption bar
		if (usage_consumption <= 0)
		{
			usage_consumption = 1;
		}
		
		usage_range.animation.play(Std.string(usage_consumption));
	}
}