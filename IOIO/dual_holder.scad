
BoxHeight = 32;
BoxWidth = 100;
BoxLength = 75;
ScrewHoleRadius = 5;

CoverHoles = [ [ BoxWidth / 2 - ScrewHoleRadius,  BoxLength / 2 - ScrewHoleRadius,  BoxHeight/2-4.5],
	[BoxWidth / 2 - ScrewHoleRadius, -1 * BoxLength / 2 + ScrewHoleRadius, BoxHeight/2-4.5],
	[-1 *BoxWidth / 2 + ScrewHoleRadius, BoxLength / 2 - ScrewHoleRadius, BoxHeight/2-4.5],
	[-1 * BoxWidth / 2 + ScrewHoleRadius, -1 * BoxLength / 2 + ScrewHoleRadius, BoxHeight/2-4.5]];

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


//translate([7,0,0]) color("SteelBlue") dual_holder();

difference() {
	translate([7,-32.5,0]) cube(size=[69,3,9], center=true);
	translate([7,0,0]) dual_holder();
}
difference() {
	translate([7,32.5,0]) cube(size=[69,3,9], center=true);
	translate([7,0,0]) dual_holder();
}

//translate([-37,0,10]) color("orange") cube(size=[18,52.5,26.5], center=true);

difference() {
union() {
	difference() {
		difference() {
			difference() {
				translate([0,0,BoxHeight/2-4.5]) cube(size=[BoxWidth,BoxLength,BoxHeight], center=true);
				translate([0,0,BoxHeight/2-1.5]) cube(size=[BoxWidth-6,BoxLength-7,BoxHeight], center=true);		
			}	
			translate([BoxWidth/2,-15,12.1]) cube([7,15,8], center=true);
		}
		translate([BoxWidth/2,15,12.1]) cube([7,15,8], center=true);
	}


	//top mounts
	for(i = CoverHoles)
	{
		translate(i) cylinder(r=ScrewHoleRadius, h=BoxHeight, center=true);	
	}
}

for (i = CoverHoles) {
	#translate([0,0,-1 * BoxHeight/2 + 1]) translate(i) cylinder(r=2.25, h=4, center=true, $fn=6);
	translate(i) cylinder(r=1.5, h=BoxHeight + 1, center=true);
}
}

//heat shields
difference() {
	difference() {
		difference() {
			translate([0,0,-2]) cube(size=[BoxWidth+5,BoxLength+5,5], center=true);
			translate([0,0,-2]) cube(size=[BoxWidth+2,BoxLength+2,6], center=true);
		}
		translate([0,0,-2]) cube(size=[BoxWidth+6,BoxLength-15,6], center=true);
	}
	translate([0,0,-2]) cube(size=[BoxLength+5,BoxLength+6,6], center=true);
}
