module base() {
	hull() {
		cube(size = [32,32,1], center = true);
 		translate([0,0,7]) cube(size = [23,23,1], center = true);
	}
}

module mount() {
	union() {
		rotate([90,0,0]) import("kinect_mount_wide.stl");
		translate([0,0,3]) cube(size=[23,23,7], center=true);
	}
}

union() {
	mount();
	translate([0,0,-7]) base();
}