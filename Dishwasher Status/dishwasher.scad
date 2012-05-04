HANDLE_RADIUS = 25;
CLIP_WIDTH = 40;
SNAP_RADIUS=5;
CLIP_THICKNESS=2;	

module deaf_fish() {
	scale(v=[.75,.75,.75]) translate(v=[-105,-25,0]) import_stl("dead_fish.stl", convexity = 5);
}

module happy_fish() {
	scale(v=[.75,.75,.75]) translate(v=[-105,-25,0]) import_stl("happy_fish.stl", convexity = 5);
}

module clip() {
difference() {
	difference() {
		union() {
			cylinder(h=CLIP_WIDTH, r=HANDLE_RADIUS+CLIP_THICKNESS, center=true);
			translate(v=[-1* CLIP_WIDTH / 2 - CLIP_THICKNESS, -1* CLIP_WIDTH / 2 - CLIP_THICKNESS, 0]) {
				rotate(a=[0,90,45]) {
					difference() {
						union() {
							cylinder(h=SNAP_RADIUS*3, r=SNAP_RADIUS, center=true);
							translate([0,0,-1 * SNAP_RADIUS*2]) cylinder(h=SNAP_RADIUS, r1=SNAP_RADIUS, r2=SNAP_RADIUS*1.5, center=true);
						}
						cube(size=[1,SNAP_RADIUS*3,SNAP_RADIUS*6], center=true);
					}
				}
			}
		}
		cylinder(h=CLIP_WIDTH + 2, r=HANDLE_RADIUS, center=true);
	}
	translate(v=[CLIP_WIDTH / 2, CLIP_WIDTH / 2,0]) cube(size = CLIP_WIDTH + 2, center = true);
}
}

module indicator() {
difference() {
translate([-1 * HANDLE_RADIUS, -1 * HANDLE_RADIUS,0]) {
	rotate([0,-90,45]) {
		difference() {
		difference() {
			translate([0,0,-5]) cube(size=[CLIP_WIDTH, CLIP_WIDTH * 2, 5], center=true);
			translate([0, -1 * CLIP_WIDTH,0]) rotate([0,0,180]) deaf_fish();
		}
			translate([0,CLIP_WIDTH,0]) happy_fish();
		}
		
	}
}
clip();
}
}

indicator();
//clip();

