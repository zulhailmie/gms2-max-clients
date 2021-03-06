function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // o_bserver
	global.__objectDepths[1] = 0; // o_bclient
	global.__objectDepths[2] = 0; // o_server
	global.__objectDepths[3] = 0; // o_client
	global.__objectDepths[4] = 0; // o_draw
	global.__objectDepths[5] = 0; // o_px


	global.__objectNames[0] = "o_bserver";
	global.__objectNames[1] = "o_bclient";
	global.__objectNames[2] = "o_server";
	global.__objectNames[3] = "o_client";
	global.__objectNames[4] = "o_draw";
	global.__objectNames[5] = "o_px";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
