//Auto Tilter
use <../lib/gears.scad>

SERVO_HEIGHT = 23.5;
SERVO_WIDTH = 23;
SERVO_DEPTH = 11.5;

BAR_HEIGHT = 24.33;
BAR_WIDTH = 25.75;

WAND_LENGTH = 28.13;
WAND_RADIUS = 2.75;

//Blind Hardware
//================

module bar(){
	cube(size = [300,BAR_WIDTH,BAR_HEIGHT]);
}

module WandTilter(){
	$fa = 1;
	$fs = 0.1;
	$fn = 40;
	difference(){
		cylinder(h=WAND_LENGTH, r = WAND_RADIUS);
		translate([-.4,1,0]) cube (size = [3.2,2.0,12.4]);
		translate([-.4,-3,0]) cube (size = [3.2,2.0,12.4]);
	}
}

module BlindAssembly(){
	bar();
	WandTilter();
}

module servoGear() {
	translate([0,-12 * 400 / 180,0]){
		rotate([0,0,360/24]) {
			gear (number_of_teeth=12,
				circular_pitch=400,
				hub_diameter=0);
		}
	}
}

module servo() {
	union() {
	translate([5.5,5.5,-3]) {
		union() {
			for (a =[0:1]) rotate([0,0,90*a]) 
				difference() {
				hull() for(b = [0:1]) mirror([0 ,b, 0]) translate([0,8.5,0]) cylinder(r=1.5, h=0.9);
				for(b = [0:1]) mirror([0 ,b, 0]) translate([0,8.5,0]) cylinder(r=0.4, h=1);
			}
			cylinder(h=3, r=2.75);
		}
	}
	cube(size= [SERVO_WIDTH, SERVO_DEPTH, SERVO_HEIGHT]);
	translate([-(32.5 - SERVO_WIDTH) / 2,0,0]) cube([32.5,SERVO_DEPTH,SERVO_HEIGHT - 17]);
	}
}

//Gears
//================
module WandGear(){
	difference(){
		gear (number_of_teeth=12,
			circular_pitch=400,
			hub_diameter=0);
		WandTilter();
	}
}

module gearAssembly() {
	rotate([-45,0,0]) translate([0 ,0,-25]) {
	translate([12 * 400 / 180 / 2,0,0]) {
		WandTilter();
		WandGear();
		servoGear();
	}
	translate([8,-(SERVO_DEPTH /2) - (12 * 400 / 180), 11]) servo();
};
}

module clip() {
	difference() {
		union() {
			translate([0,-15,5]) cube([SERVO_WIDTH + 20,30,BAR_HEIGHT]);
			translate([0,0,14.33]) cube([SERVO_WIDTH + 20,30,15]);
			translate([0,-30,10.33]) cube([(32.5 - SERVO_WIDTH) - 2,20,19]);
			translate([SERVO_WIDTH + 8,-30,10.33]) cube([(32.5 - SERVO_WIDTH) - 2,20,19]);
		}
		translate([(SERVO_WIDTH +10)/ 2 - 10,-16,-10]) cube([25,20,50]);
		bar();
		gearAssembly();
	}
}

bar();
gearAssembly();
clip();


