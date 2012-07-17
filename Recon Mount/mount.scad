RECON_HEIGHT = 11;
RECON_START_WIDTH = 46;
RECON_END_WIDTH = 49;
RECON_LENGTH = 35;

CLIP_LENGTH = 17;
CLIP_DEPTH = 6;
CLIP_THICKNESS = 3;

module recon() {
	hull() {
		translate([(RECON_END_WIDTH - RECON_START_WIDTH) / 2,-1,0]) cube([RECON_START_WIDTH, 1, RECON_HEIGHT]);
		translate([0, RECON_LENGTH, 0]) cube([RECON_END_WIDTH, 1, RECON_HEIGHT]);
	}
	
	//notch
	#translate([-4,9,RECON_HEIGHT - 3]) cube([6,6,2]);
}

module clip() {

	RECON_BUMP_WIDTH = RECON_END_WIDTH - (CLIP_DEPTH * 2);

	difference() {
		translate([(-1*CLIP_THICKNESS) / 2, 0, (-1*CLIP_THICKNESS) / 2]) 
		difference() {
			hull() {
				cube([RECON_END_WIDTH + CLIP_THICKNESS, CLIP_LENGTH, RECON_HEIGHT + CLIP_THICKNESS]);
				sphere(r=1, $fn=20);
				translate([0,CLIP_LENGTH,0]) sphere(r=1, $fn=20);
				translate([0,CLIP_LENGTH,RECON_HEIGHT + CLIP_THICKNESS]) sphere(r=1, $fn=20);
				translate([0,0,RECON_HEIGHT + CLIP_THICKNESS]) sphere(r=1, $fn=20);
				translate([RECON_END_WIDTH + CLIP_THICKNESS,0,0]) {
					sphere(r=1, $fn=20);
				translate([0,CLIP_LENGTH,0]) sphere(r=1, $fn=20);
				translate([0,CLIP_LENGTH,RECON_HEIGHT + CLIP_THICKNESS]) sphere(r=1, $fn=20);
				translate([0,0,RECON_HEIGHT + CLIP_THICKNESS]) sphere(r=1, $fn=20);
				}
			}
			#translate([CLIP_DEPTH + (CLIP_THICKNESS / 2),-5,CLIP_THICKNESS]) cube([RECON_BUMP_WIDTH, CLIP_LENGTH + 10, RECON_HEIGHT + CLIP_THICKNESS]);	
		}
		recon();
	}

	#translate([RECON_START_WIDTH - (CLIP_THICKNESS / 2),2,0]) cube([4,1,RECON_HEIGHT]);

}

//recon();
clip();
