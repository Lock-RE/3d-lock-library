/*
 * American Lock Key
 *
 */
 
 // American Lock numbers these 1 through 8. INCHES
 AML_KEY_CUT_ROOT_DEPTH = [.2840, .2684, .2528, .2372, .2215, .2059, .1903, .1747];
 function american_lock_cut_root_depth(index) = AML_KEY_CUT_ROOT_DEPTH[index-1];
 
 // INCHES
 AML_FIRST_CUT = 0.156;
 // INCHES
 AML_CUT_SPACING = 0.125;