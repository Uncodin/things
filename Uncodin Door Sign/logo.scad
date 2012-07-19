translate([-25,65,0]) color("darkblue") linear_extrude(height = 4) import("drawing.dxf");
scale([.4,.4,.4]) {

union() {
union() {
color("DeepSkyBlue") linear_extrude(height = 3) import("one.dxf");
color("DarkBlue") linear_extrude(height = 4) import("blah.dxf");
}
color("gold") linear_extrude(height = 6) import("woko.dxf");
}
color("DarkOrange") linear_extrude(height = 5) import("waka.dxf");
translate([-.5,-.5,0]) color("orange") linear_extrude(height = 3) import("wiki.dxf");
}

