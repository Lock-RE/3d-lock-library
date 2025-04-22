/*
 * PACLOCK PRO (PR1) Keyway & Key
 */
use <../Common/Measurement.scad>

KEY_CUT_1 = 6; // [1 2 3 4 5 6]
KEY_CUT_2 = 2; // [1 2 3 4 5 6]
KEY_CUT_3 = 1; // [1 2 3 4 5 6]
KEY_CUT_4 = 2; // [1 2 3 4 5 6]
KEY_CUT_5 = 1; // [1 2 3 4 5 6]
KEY_CUT_6 = 2; // [1 2 3 4 5 6]
KEY_CUT_7 = 1; // [1 2 3 4 5 6]

/* [Hidden] */
// MM
PL_KEY_WIDTH = 2;
//MM
PL_KEY_HEIGHT = 25.4;

// Standard flat CW-1011 cutter
PL_KEY_CUT_BASE = inch_to_mm(0.044);
PL_KEY_CUT_ANGLE = 90;
// CW-1011 cutter is 1/4" wide. MM
PL_KEY_CUT_WIDTH = 25.4/4;

// Key spacing from measurements.
PL_KEY_FIRST_CUT = inch_to_mm(0.145);
PL_KEY_CUT_SPACING = inch_to_mm(0.1375);

// Paclock numbers these 1 through 6. Inches
// These were initially measured from keys, and then
// the following rough guess was made.

// Rough guess on how Paclock made these:
// 1, 2 - American Lock cuts
// 3 - Halfway between American 2 and 5.
// 4 - American 5
// 5 - Halfway between American 5 and 8.
// 6 - American 8
PL_KEY_CUT_DEPTH = [0.2840,0.2684,0.2450,0.2215,0.1981,0.1747];
function paclock_pr1_cut_depth(index) = inch_to_mm(PL_KEY_CUT_DEPTH[index-1]);

// Shoulder inset length. mm.
PL_KEY_SHOULDER_START = 36;
// Bottom surface start. mm.
PL_KEY_BOTTOM_START = 9;

PL_KEY_CUT_1_X = PL_KEY_SHOULDER_START + PL_KEY_FIRST_CUT;
PL_KEY_CUT_2_X = PL_KEY_CUT_1_X + PL_KEY_CUT_SPACING;
PL_KEY_CUT_3_X = PL_KEY_CUT_2_X + PL_KEY_CUT_SPACING;
PL_KEY_CUT_4_X = PL_KEY_CUT_3_X + PL_KEY_CUT_SPACING;
PL_KEY_CUT_5_X = PL_KEY_CUT_4_X + PL_KEY_CUT_SPACING;
PL_KEY_CUT_6_X = PL_KEY_CUT_5_X + PL_KEY_CUT_SPACING;
PL_KEY_CUT_7_X = PL_KEY_CUT_6_X + PL_KEY_CUT_SPACING;

PL_KEY_CUT_1_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_1);
PL_KEY_CUT_2_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_2);
PL_KEY_CUT_3_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_3);
PL_KEY_CUT_4_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_4);
PL_KEY_CUT_5_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_5);
PL_KEY_CUT_6_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_6);
PL_KEY_CUT_7_Y = PL_KEY_BOTTOM_START + paclock_pr1_cut_depth(KEY_CUT_7);

difference() {
    paclock_pr1_blank();
    translate([PL_KEY_CUT_1_X, PL_KEY_CUT_1_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_CUT_2_X, PL_KEY_CUT_2_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_CUT_3_X, PL_KEY_CUT_3_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_CUT_4_X, PL_KEY_CUT_4_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_CUT_5_X, PL_KEY_CUT_5_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_CUT_6_X, PL_KEY_CUT_6_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_CUT_7_X, PL_KEY_CUT_7_Y])
        paclock_pr1_key_cutter();
    translate([PL_KEY_SHOULDER_START,PL_KEY_BOTTOM_START,PL_KEY_WIDTH])
        rotate([0,90,0])
            linear_extrude(100)
            paclock_pr1_keyway_cutter();
}


module paclock_pr1_blank() {
    rotate([180,0,0])
    translate([0,-PL_KEY_HEIGHT,-PL_KEY_WIDTH])
    linear_extrude(PL_KEY_WIDTH)
    import("PR1 Blank.svg");
}

// Creates a shape used to cut the key
module paclock_pr1_key_cutter() {
    a = PL_KEY_CUT_BASE/2;   
    b = PL_KEY_CUT_WIDTH/2;
    c = b*tan(PL_KEY_CUT_ANGLE/2);
    
    translate([0,0,-0.001])
    linear_extrude(PL_KEY_WIDTH+0.005)
    polygon([[-a,0],[a,0],[b,c],[b,c+10],[-b,c+10],[-b,c]]);
}

// Make an inverse of the keyway to use for cutting
module paclock_pr1_keyway_cutter() {
    difference() {
        square([2.2,7.6]);
        translate([2,0,0])
            offset(0.005)
            mirror([1,0,0])
            paclock_pr1_keyway();
    }
}
 
// Taken from key measurements. MM
module paclock_pr1_keyway() {
    polygon([[0,0],[0,1],[1,1],[0,2],[1,3],[0,3],[0,5],[1,6],[0.75,6.5],[0.75,7.5],[1.5,7.5],[1.5,6.75],[2,6.75],[2,5.75],[1,5],[2,4.25],[2,2.25],[1,2.25],[2,1],[2,0]]);
}