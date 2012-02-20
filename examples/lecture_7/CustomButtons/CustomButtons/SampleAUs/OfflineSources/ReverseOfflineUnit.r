/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   SampleEffectUnit.r
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#include <AudioUnit/AudioUnit.r>

#include "ReverseOfflineUnitVersion.h"

// Note that resource IDs must be spaced 2 apart for the 'STR ' name and description
#define kAudioUnitResID_ReverseOfflineUnit				10002

// So you need to define these appropriately for your audio unit.
// For the name the convention is to provide your company name and end it with a ':',
// then provide the name of the AudioUnit.
// The Description can be whatever you want.
// For an effect unit the Type and SubType should be left the way they are defined here...
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// SampleEffectUnit
#define RES_ID			kAudioUnitResID_ReverseOfflineUnit
#define COMP_TYPE		kAudioUnitType_OfflineEffect
#define COMP_SUBTYPE	'Rvrs'
#define COMP_MANUF		'Acme'	// note that Apple has reserved all all-lower-case 4-char codes for its own use.
                                // Be sure to include at least one upper-case character in each of your codes.
#define VERSION			kReverseOfflineUnitVersion
#define NAME			"Acme Inc: ReverseOfflineUnit"
#define DESCRIPTION		"Acme Inc's favourite offline audio effect"
#define ENTRY_POINT		"ReverseOfflineUnitEntry"

#include "AUResources.r"
