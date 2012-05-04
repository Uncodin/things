
module ioio() {
	for(i = [ [ 31.25,  12.5,  0],
		[31.25, -12.5, 0],
		[-31.25, 12.5, 0],
		[-31.25, -12.5, 0]])
	{
		translate(i)
		cylinder(r=2.5, h=6);
	}
}

module dual_holder() {
	translate([0,-15.5,0]) ioio();
	translate([0,15.5,0]) ioio();

	difference() {
		difference() {
			cube(size=[69,68,3], center=true);
			translate([0,-15,0]) cube(size=[50,20, 4], center=true);
		}
		translate([0,15,0]) cube(size=[50,20, 4], center=true);
	}
}


//color("SteelBlue") dual_holder();

difference() {
	translate([0,-32.5,0]) cube(size=[69,3,9], center=true);
	dual_holder();
}
difference() {
	translate([0,32.5,0]) cube(size=[69,3,9], center=true);
	dual_holder();
}

difference() {
	difference() {
		difference() {
			difference() {
				translate([0,0,23/2-4.5]) cube(size=[75,75,23], center=true);
				translate([0,0,23/2-1.5]) cube(size=[69,68,23], center=true);		
			}	
			translate([36,-15,12.1]) cube([5,15,8], center=true);
		}
		translate([36,15,12.1]) cube([5,15,8], center=true);
	}
	translate([-36,0,23/2-1.5]) cube(size=[7,68,23], center=true);
}

difference() {
difference() {
difference() {
	translate([0,0,-2]) cube(size=[80,80,5], center=true);
	translate([0,0,-2]) cube(size=[76,76,6], center=true);
}
translate([0,0,-2]) cube(size=[85,62,6], center=true);
}
translate([0,0,-2]) cube(size=[62,85,6], center=true);
}