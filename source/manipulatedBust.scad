
module bust() {
	translate([-190,-200,-200]) {
		import("chrisBust.stl");
	}
}//end of bust




module halfSphere() {
	difference() {
			sphere(r=12);
		translate([0,10,0]) {
			cube([12,18,15], center=true);
		}
	}
}//end of halfSphere




module headSphere() {
	union() {
		translate([0,-4.5,16]) {
			halfSphere();
		}
		difference() {
			bust();
			translate([0,0,-8.5]) {
				cube([40,40,30],center=true);
			}
			translate([0,-10,0]) {
				cube([40,15,60],center=true);
			}
			translate([12,0,-5]) {
				cube([15,15,30],center=true);
			}
			translate([-14,0,2]) {
				cube([15,15,30],center=true);
			}
		}
	}
}//end of headSphere




module headSphereBoxSide() {
	for (i = [1:4]) {
		rotate([0,i*90,0]) {
			headSphere();
		}
	}
	
	for (i = [1:2]) {
		rotate([0,i*90,0]) {
			translate([0,-4.8,0]) {
				cylinder(r=2.5, h=20, center=true);
			}
		}
	}
}//end of headSphereBoxSide






union() {
	headSphereBoxSide();
		rotate([180,0,0]) {
			translate([0,10,0]) {
				headSphereBoxSide();
			}
		}
}//end of union





