//Auto Tilter
use <../lib/gears.scad>

//Blind Hardware
//================

module bar(){
	width = 25.75;
	height = 24.33;
	cube(size = [300,width,height]);
}

module WandTilter(){
	$fa = 1;
	$fs = 0.1;
	$fn = 40;
	height = 28.13;
	radius = 2.75;
	difference(){
		cylinder(h=height, r = radius);
		translate([-.4,1,0]) cube (size = [3.2,2.0,12.4]);
		translate([-.4,-3,0]) cube (size = [3.2,2.0,12.4]);
	}
}

module BlindAssembly(){
	bar();
	WandTilter();
}

//Gears
//================
module WandGear(){
	difference(){
		translate([0,0,1])gear (circular_pitch=200,
		      gear_thickness = 2,
		      rim_thickness = 2,
		      bore_diameter = 0,
		      hub_thickness = 2,
		      circles=0);
		WandTilter();
	}
}
//WandTilter();
WandGear();
