package ;

import flixel.FlxState;
import sprites.AssetsCameraMonitor;
import sprites.AssetsOfficeBackground;
import sprites.AssetsMonitorLayout;
import sprites.AssetsTitleScreen;
import sprites.AssetsScreenMonsters;
import sprites.AssetsScreenHallucinations;

//-- Debug Stuff
import sprites.ViewersSpecialTreat;

class Variables extends FlxState
{
	//-- Layout Assets
	public static var office_main:AssetsOfficeBackground;
	public static var monitor_main:AssetsMonitorLayout;
	public static var map_monitor_main:AssetsCameraMonitor;
	public static var title_screen:AssetsTitleScreen;
	public static var screen_monsters:AssetsScreenMonsters;
	public static var screen_hallucinations:AssetsScreenHallucinations;
	
	//-- Debug Stuff
	public static var viewers_choice:ViewersSpecialTreat;
	
	//-- Global Variables (These are needed for some reasons)
	public static var halt_stuff:Int = 0; //-- Just in any case.
}