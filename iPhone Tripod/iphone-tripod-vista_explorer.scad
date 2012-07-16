
IPHONE_WIDTH = 9.3;

module base() {
	hull() {
		cube(size = [43,43,1], center = true);
 		translate([0,0,7]) cube(size = [35,35,1], center = true);
	}
}

module holder(width) {
	difference() {
		cube(size= [width * 2, width * 1.5, width * 1.5], center = true);
		cube(size = [width, width * 2, width * 1.5], center = true);
	}
}

base();
translate ([0,0,IPHONE_WIDTH]) holder(IPHONE_WIDTH);
