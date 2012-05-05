/*
	Components:
		Topplate.stl
		Servomountplate.stl
		Upperarm.stl

*/

Thickness = 4; //4mm thickness for all part


translate([0,0,0]) import("../Individual Parts/Topplate-fixed.stl");
translate([0,40,2.5]) import("../Individual Parts/Servopmountplate-fixed.stl");
translate([0,0,2.5]) import("../Individual Parts/Servopmountplate-fixed.stl");
translate([0,0,2.9]) import("../Individual Parts/Upperarm-fixed.stl");

