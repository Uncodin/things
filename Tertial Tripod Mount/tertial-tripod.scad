Base_Height = 8.5;

//Tripod Base
module base() {
	hull() {
		cube(size = [32,32,1], center = true);
 		translate([0,0,Base_Height]) cube(size = [23,23,1], center = true);
	}
}
//Holder Withlout subtraction for rod
module holder() {
	translate([0,0,Base_Height]) cylinder (h=26, r1 = 11, r2 = 9);
}

//Entire Assembly without subtraction for rod
module assembly(){
	base();
	holder();
}

//Diffrence of the assembly and the rod so that is goes into the base a bit.
difference (){
	assembly();
	translate([0,0,Base_Height-5]) cylinder(h=50, r=6.5);
}
