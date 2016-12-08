$fn = 30; //Number of fragments

module squareSample() {
  //Draw 10mm spehere
  cube(10);
}

module sphereSample() {
  //Draw 10mm radius sphere
  color("Lime")sphere(r=10);
}

module modifierSample() {
  //Draw 10mm radius sphere
  //% background - draw in grey, exclude from render tree.
  //# debug - Draw unmodified in pink
  //! root - ignore rest of design and draw just this.
  #sphere(r=10);
  %cube(15); 
}


module modifiedCubeSample() {
	cube([5,10,15]);
}

module variableExplanation() {
   a = 0;
   echo(a);  // 5
   a = 3;
   echo(a);  // 5
   a = 5;
}

module cubeSampleVariable() {
    cube_size = 20;
    echo(cube_size);
    cube(cube_size);
}

module cubeSampleParameter(cube_size) {
    cube(cube_size);
}

module unionSample() {
  //Draw two objects unioned, one is centered.
	union()  {
		sphere(r =10);
		cube(center=true, 15);
	}
}

module hullSample() {
    hull()  {
		sphere(r =10);
		cube(center=true, 13);
	}
}

module translateSample() {
          //Draw two objects unioned with one translated by x =0, y =0 and z = 20
	union()  {
		translate([0,0,20]) sphere(r =10);
		cube(12);
	}
}

module diffSample() {
  //Draw two objects unioned, one is centered.
	difference()  {
		cube(center=true, 10);
		translate([0,0,2]) cube(center=true, [5,5,10]);
	}
}

module iteratorSample() {
	//Iterate from 0 to 5 increment by 1 
	for ( i = [0 : 1 : 5] ) {
   		rotate( i * 360 / 6, [1, 0, 0])
  		translate([0, 10, 0])
   		sphere(r = 3);
	}
}

//Stock example
module example001() {
	function r_from_dia(d) = d / 2;

	module rotcy(rot, r, h) {
		rotate(90, rot)
			cylinder(r = r, h = h, center = true);
	}

	difference() {
		sphere(r = r_from_dia(size));
		rotcy([0, 0, 0], cy_r, cy_h);
		rotcy([1, 0, 0], cy_r, cy_h);
		rotcy([0, 1, 0], cy_r, cy_h);
	}

	size = 50;
	hole = 25;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);
}

module animation() {
    //Animate is under view!
    rotate([0,0,$t*360]) translate([50,0,0]) sphere(10);
}

//squareSample();
//sphereSample();
//modifierSample();
//modifiedCubeSample();
//variableExplanation();
//cubeSampleVariable();
//cubeSampleParameter(40);
//unionSample();
//hullSample();
//translateSample();
//diffSample();
//iteratorSample();
//example001();
//animation();
