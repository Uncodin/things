Base_Height = 7;

module base() {
	hull() {
		cube(size = [32,32,1], center = true);
 		translate([0,0,Base_Height]) cube(size = [23,23,1], center = true);
	}
}

module holder() {
	difference(){
		translate([0,0,Base_Height]) cylinder (h=40, r1 = 11, r2 = 9);
		translate([0,0,Base_Height+5]) cylinder(h=50, r=7.25);
	}
}

base();
holder(Base_Height);
