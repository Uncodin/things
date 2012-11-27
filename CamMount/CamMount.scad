
//Wall Mount Shim for Camera

module Wall(){
	union(){
		cube(size = [500,20,100]);
		translate([0,20,0]) cube(size = [500,20,85]);
	}
}

module Mount(){
	cube(size = [50,60,110]);
}

difference(){
	translate([0,-30,10]) Mount();
	Wall();
}
