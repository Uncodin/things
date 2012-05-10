cup_holder_radius = 35;
cup_holder_height = 70;
pin_radius = 2;
start_pin = 90;
pin_spacing = 19;
base_thickness = 5;
wall_thickness = 3;

module base() {
  difference() {
    union() {
      translate([pin_spacing * 3, 0, 0]) {
        cylinder(h = base_thickness, r = pin_spacing);
      }

      translate([0, pin_spacing * 3, 0]) {
        cylinder(h = base_thickness, r = pin_spacing);
      }

      translate([-pin_spacing * 3, 0, 0]) {
        cylinder(h = base_thickness, r = pin_spacing);
      }

      translate([0, -pin_spacing * 3, 0]) {
        cylinder(h = base_thickness, r = pin_spacing);
      }

      translate([-pin_spacing * 3, -pin_spacing * 3, 0]) {
        cube(size=[pin_spacing * 6, pin_spacing * 6, base_thickness]);
      }
    }

    translate([pin_spacing * 3, pin_spacing * 3, 0]) {
      # cylinder(h = base_thickness, r = pin_spacing * 2);
    }

    translate([-pin_spacing * 3, pin_spacing * 3, 0]) {
      # cylinder(h = base_thickness, r = pin_spacing * 2);
    }

    translate([pin_spacing * 3, -pin_spacing * 3, 0]) {
      # cylinder(h = base_thickness, r = pin_spacing * 2);
    }

    translate([-pin_spacing * 3, -pin_spacing * 3, 0]) {
      # cylinder(h = base_thickness, r = pin_spacing * 2);
    }

    // Pin Holes
    translate([-pin_spacing * 3, 0, 0]) {
      # cylinder(h = base_thickness, r = pin_radius);
    }

    translate([pin_spacing * 3, 0, 0]) {
      # cylinder(h = base_thickness, r = pin_radius);
    }

    translate([0, -pin_spacing * 3, 0]) {
      # cylinder(h = base_thickness, r = pin_radius);
    }

    translate([0, pin_spacing * 3, 0]) {
      # cylinder(h = base_thickness, r = pin_radius);
    }
  }
}

module cup_holder() {
  difference() {
    cylinder(h  = cup_holder_height,
            r1 = cup_holder_radius + wall_thickness * 2,
            r2 = cup_holder_radius + wall_thickness);

    for (i = [0:30:180]) {
      hole(i);
    }
  }
}

module hole(x) {
  for (i = [0:2]) {
    rotate([90, 0, x + i * 45]) {
      translate([0, 20 + i * 20, -50]) {
        # cylinder(h = 100, r = 5);
      }
    }
  }
}

difference() {
  union() {
    base();
    cup_holder();
  }

  translate([0, 0, -10]) {
    # cylinder(h = cup_holder_height + 20, r = cup_holder_radius);
  }

}

