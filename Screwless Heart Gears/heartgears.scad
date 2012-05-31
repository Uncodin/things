// Screwless Heart Gears

use <../lib/involute_gears.scad>// GregFrost's Thing:3575
include <../lib/pins.scad>// tbuser's Thing:10541

//gear2();// render each gear (1 to 8)
//fourgears();// render small gears on a plate (1,3,5,7)
//rotate([0,90-theta,0])center();// render central block
pin1();translate([12,0,0])pin2();// render pins
//twogears();// check two-gear meshing
//complete();// render total assembly (slow)

// get heart.stl from emmett's Thing:6190
hs=100;// heart size (width)
hz=-10;// heart z-position (motion relative to 100mm original height)
rf1=0.6*hs;// distance from center of cube to cut corner faces
cp=0.2;// percentage of rf1 for the center block
ph=8;// pin height in center block
ph1=rf1*0.3;// pin height in large gears
ph2=rf1*0.2;// pin height in small gears
pd=7;// pin shaft diameter
b=0.5;// backlash

n1=18;// number of teeth on gear1
n2=9;// number of teeth on gear2
// Run gearopt.m (from Thing:6073) with inputs of n1 and n2 above, copy outputs r1 and r2 below.
r1=0.7493;
r2=0.3746;

// -------------- Don't edit below here unless you know what you're doing.
dc=rf1/sqrt(1-pow(r1,2));
theta=asin(1/sqrt(3));
pitch=360*r1*dc/n1;
rf2=sqrt(pow(dc,2)-pow(r2*dc,2));
L1=ph1+ph;
L2=ph2+ph;

module halfpin(){
difference(){
	pinpeg(h=L2,r=pd/2);
	translate([0,rf1/2,0])cube(size=rf1,center=true);
}}

module pin1(){
union(){
	translate([0,L2-L1,0])halfpin();
	rotate([90,0,0])translate([0,0,-0.1])
		linear_extrude(height=L1-L2+0.2)projection(cut=true)rotate([-90,0,0])halfpin();
	mirror([0,1,0])halfpin();
}}

module pin2(){
pinpeg(h=L2,r=pd/2);
}

module box(){
translate([0,0,-(rf2-rf1)*cp/2])difference(){
	cube(size=[dc,dc,(rf1+rf2)*cp],center=true);
	translate([0,0,-(rf1+rf2)*cp/2-.01])pinhole(h=ph,r=pd/2,tight=true);
	rotate([180,0,0])translate([0,0,-(rf1+rf2)*cp/2-.01])pinhole(h=ph,r=pd/2,tight=true);
}}

module center(){
rotate(a=[180,0,0])
intersection(){
	rotate(a=[-90-theta,0,0])box();
	rotate(a=[-90-theta,0,180])box();
	rotate(a=[90-theta,0,90])box();
	rotate(a=[90-theta,0,-90])box();
}}

module gearA(){
	render()
	rotate(a=[180,0,0])translate([0,0,-rf1])
	difference(){
		bevel_gear (number_of_teeth=n1,
			outside_circular_pitch=pitch,
			cone_distance=dc,
			face_width=dc*(1-cp),
			bore_diameter=0,
			backlash=b,
			finish=0);
		translate([0,0,rf1*(1-cp)])rotate([180,0,0])pinhole(h=ph1,r=pd/2,tight=false);
	}
}

module gearB(){
	render()
	rotate(a=[180,0,0])translate([0,0,-rf2])
	difference(){
		bevel_gear (number_of_teeth=n2,
			outside_circular_pitch=pitch,
			cone_distance=dc,
			face_width=dc*(1-cp),
			bore_diameter=0,
			backlash=b);
		translate([0,0,rf2*(1-cp)])rotate([180,0,0])pinhole(h=ph2,r=pd/2,tight=false);
	}
}

module twogears(){
	rotate(a=[90-theta,0,0])gearA();
	rotate(a=[0,90-theta,0])gearB();
}

module fourgears(){
translate([-25,25,0])gear1();
translate([25,25,0])gear3();
translate([-25,-25,0])gear5();
translate([25,-25,0])gear7();
}

module complete(){
intersection(){
scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
rotate(a=[0,theta-90,0])union(){
	center();
	twogears();
	rotate(a=[0,0,180])twogears();
	rotate(a=[0,180,90])twogears();
	rotate(a=[0,180,-90])twogears();
}}}

module gear1(){
rotate(a=-[0,90-theta,0])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,90-theta,0])gearB();
}}

module gear2(){
rotate(a=-[90-theta,0,0])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[90-theta,0,0])gearA();
}}

module gear3(){
rotate(a=-[0,90-theta,0])rotate(a=[0,0,180])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[0,90-theta,0])gearB();
}}

module gear4(){
rotate(a=-[90-theta,0,0])rotate(a=[0,0,180])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[90-theta,0,0])gearA();
}}

module gear5(){
rotate(a=-[0,90-theta,0])rotate(a=[0,180,90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[0,90-theta,0])gearB();
}}

module gear6(){
rotate(a=-[90-theta,0,0])rotate(a=[0,180,90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[90-theta,0,0])gearA();
}}

module gear7(){
rotate(a=-[0,90-theta,0])rotate(a=[0,180,-90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[0,90-theta,0])gearB();
}}

module gear8(){
rotate(a=-[90-theta,0,0])rotate(a=[0,180,-90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[90-theta,0,0])gearA();
}}

module complete1(){
	rotate(a=[0,theta-90,0])center();
	rotate(a=[0,theta-90,0])rotate(a=[0,90-theta,0])gear1();
	rotate(a=[0,theta-90,0])rotate(a=[90-theta,0,0])gear2();
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[0,90-theta,0])gear3();
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[90-theta,0,0])gear4();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[0,90-theta,0])gear5();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[90-theta,0,0])gear6();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[0,90-theta,0])gear7();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[90-theta,0,0])gear8();
}
