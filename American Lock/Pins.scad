/*
 * American Lock Pins
 *
 */
 
// American Lock numbers these from 1 to 8. Increment is nominally .0155. INCHES
AML_KEY_PINS = [.1100, .1255, .1411, .1567, .1724, .1880, .2036, .2192];
function american_lock_key_pin_depth(index) = AML_KEY_PINS[index-1];

// Key pin diameter. INCHES
AML_KEY_PIN_DIAMETER = .093;