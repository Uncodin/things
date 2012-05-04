translate([0,0,10]) {
rotate([0,180,0]) {


union() {
translate([0,0,5]) {
	difference() {
		cube(size=[57.5,44.5,10], center=true);
		union() {
			cube(size=[53.5, 40.5,11], center=true);
			translate([30,0,3]) cube(size=[16.5,10,11],center=true);
		}
	}
	difference() {
		cube(size=[20,15,10], center=true);
		cube(size=[15,10,10.1], center=true);
	}
}
cube(size=[61.5,48.3,5], center=true);
}

rotate([0,0,180]) translate([-25,-25,-6]) scale([.5,.5,0]) linear_extrude(height=5) import("uncodin-icon.dxf");

}
}