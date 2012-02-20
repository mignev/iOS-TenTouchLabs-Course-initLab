/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   SampleEffectUnit.r
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#include <AudioUnit/AudioUnit.r>

#include "SampleEffectUnitVersion.h"

// Note that resource IDs must be spaced 2 apart for the 'STR ' name and description
#define kAudioUnitResID_SampleEffectUnit				10000

// So you need to define these appropriately for your audio unit.
// For the name the convention is to provide your company name and end it with a ':',
// then provide the name of the AudioUnit.
// The Description can be whatever you want.
// For an effect unit the Type and SubType should be left the way they are defined here...
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// SampleEffectUnit
#define RES_ID			kAudioUnitResID_SampleEffectUnit
#define COMP_TYPE		kAudioUnitType_Effect
#define COMP_SUBTYPE	'Pass'	// this effect just passes audio through
#define COMP_MANUF		'Acme'	// note that Apple has reserved all all-lower-case 4-char codes for its own use.
                                // Be sure to include at least one upper-case character in each of your codes.
#define VERSION			kSampleEffectUnitVersion
#define NAME			"Acme Inc: SampleEffectUnit"
#define DESCRIPTION		"Acme Inc's favorite audio effect"
#define ENTRY_POINT		"SampleEffectUnitEntry"

#include "AUResources.r"
