//////////////////////////////////////////////////////////////////
// Duke Eltan in the Ducal Palace after Sarevok is killed       //
// If the protagonist delivered him safely to the harbor master //
// Patched via eltan.tpa                                        //
//////////////////////////////////////////////////////////////////

// Need to modify the first triggers so he doesn't start asking about SharTeel and Corwin
// Though, if she's in the group, he should probably want to haul her off to prison
//ADD_STATE_TRIGGER BDELTAN 0 ~Global("#L_EltanTalkedToCorwin","MYAREA",0) AreaCheck("BD0102")~
//REPLACE_TRIGGER_TEXT BDELTAN ~Global("k9Sharteel_Talk_ELTAN","GLOBAL",0)~ ~Global("k9Sharteel_Talk_ELTAN","GLOBAL",0) GlobalGT("BD_plot","GLOBAL",40)~
//REPLACE_ACTION_TEXT BDELTAN ~SetGlobal("bd_plot_003","bd0102",1)~ ~SetGlobal("bd_plot_003","bd0102",1) SetGlobal("#L_EltanTalkedToCorwin","MYAREA",1)~

// Make sure stock dialogue doesn't fire while in the palace
ADD_STATE_TRIGGER DELTAN 0 ~Global("#L_BG1SarevokDead","GLOBAL",0)~
ADD_STATE_TRIGGER DELTAN 7 ~Global("#L_BG1SarevokDead","GLOBAL",0)~
ADD_STATE_TRIGGER DELTAN 12 ~Global("#L_BG1SarevokDead","GLOBAL",0)~
ADD_STATE_TRIGGER DELTAN 13 ~Global("#L_BG1SarevokDead","GLOBAL",0)~
ADD_STATE_TRIGGER DELTAN 14 ~Global("#L_BG1SarevokDead","GLOBAL",0)~
ADD_STATE_TRIGGER DELTAN 15 ~Global("#L_BG1SarevokDead","GLOBAL",0)~

// Add Palace dialogue
APPEND DELTAN
	// Cross-mod content with BG1RE
	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",0) Global("C#RE1_ScarRetrieval","GLOBAL",15)~ THEN BEGIN SHOO
		SAY @2098 /* ~I have nothing more to say to you.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2) SetGlobal("#L_EltanLoveMatch","GLOBAL",0) EscapeArea()~ EXIT
	END

	// Cross-mod content with BG1RE
	IF ~Global("#L_TalkedToDukes","GLOBAL",1) Global("C#RE1_ScarRetrieval","GLOBAL",14)~ THEN BEGIN ELTAN_SCAR
		SAY @2097 /* ~<CHARNAME>, I need to personally thank you for saving my life and the life of my friend.~ */
		= @2066 /* ~I have a number properties here in the city as well in and around Beregost.  I'd be honored if you'd accept one as a thank you.~ */
		++ @2067 /* ~That's not necessary.  I was just doing my duty.~ */ + DUTY
		++ @2068 /* ~You have my attention.~ */ + ELTAN_2
		++ @2069 /* ~That's very generous of you.  Thank you!~ */ + ELTAN_2
	END

	IF ~Global("#L_TalkedToDukes","GLOBAL",1)~ THEN BEGIN ELTAN_1
		SAY @2065 /* ~<CHARNAME>, I need to personally thank you for saving my life.~ */
		= @2066 /* ~I have a number properties here in the city as well in and around Beregost.  I'd be honored if you'd accept one as a thank you.~ */
		++ @2067 /* ~That's not necessary.  I was just doing my duty.~ */ + DUTY
		++ @2068 /* ~You have my attention.~ */ + ELTAN_2
		++ @2069 /* ~That's very generous of you.  Thank you!~ */ + ELTAN_2
	END

	IF ~~ THEN BEGIN DUTY
		SAY @2070 /* ~It was way above the call of duty.~ */
		IF ~~ THEN + ELTAN_2
	END

	IF ~~ THEN BEGIN ELTAN_2
		SAY @2071 /* ~Which of these properties would suit you best? ::Shows you a list of potential properties::~ */
		+ ~Global("#L_HouseBGate1","GLOBAL",1)~ + @2074	/* ~I'd prefer the one in front of the Ducal Palace.~ */ + BGATE1
		+ ~Global("#L_HouseBeregost","GLOBAL",1)~ + @2072 /* ~I'd prefer the one in Beregost.~ */ + BEREGOST
		+ ~Global("#L_HouseHHedge","GLOBAL",1)~ + @2073 /* ~I'd prefer the cabin in High Hedge.~ */ + HHEDGE
		+ ~Global("#L_HouseBGate2","GLOBAL",1)~ + @2501 /* ~I'd prefer the one across from the Flaming Fist compound.~ */ + BGATE2
	END

	// Includes cross-mod content with the Eltan romance mod
	IF ~~ THEN BEGIN BEREGOST
		SAY @2075 /* ~That's the grey house on the upper west side.~ */
		= @2087 /* ~I've recently done some renovations to the place.  I hope you like them.~ */
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseBeregost","GLOBAL",2) GiveItemCreate("#LKey03",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseBeregost","GLOBAL",2) GiveItemCreate("#LKey03",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ + MATCH
	END

	// Includes cross-mod content with the Eltan romance mod
	IF ~~ THEN BEGIN HHEDGE
		SAY @2076 /* ~Ahh, a place in the woods.  Be careful not to bother the grumpy mage that will be your neighbor.~ */
		= @2087 /* ~I've recently done some renovations to the place.  I hope you like them.~ */
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseHHedge","GLOBAL",2) GiveItemCreate("#LKey02",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseHHedge","GLOBAL",2) GiveItemCreate("#LKey02",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ + MATCH
	END

	// Includes cross-mod content with the Eltan romance mod
	IF ~~ THEN BEGIN BGATE1
		SAY @2077 /* ~That house is the 2nd door to your left as you're facing the entrance to the palace.~ */
		= @2087 /* ~I've recently done some renovations to the place.  I hope you like them.~ */
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseBGate1","GLOBAL",2) GiveItemCreate("#LKey01",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseBGate1","GLOBAL",2) GiveItemCreate("#LKey01",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ + MATCH
	END

	// Includes cross-mod content with the Eltan romance mod
	IF ~~ THEN BEGIN BGATE2
		SAY @2502 // ~I'm glad you selected that one.~
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseBGate2","GLOBAL",2) GiveItemCreate("#LKey04",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseBGate2","GLOBAL",2) GiveItemCreate("#LKey01",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ + MATCH
	END

	// Cross-mod content with the Eltan romance mod
	// The Eltan mod will hook in here
	IF ~~ THEN BEGIN MATCH
		SAY @2088 /* ~(He holds your hand in his a little longer than necessary as he encloses your fingers around the key)~ */
		IF ~~ THEN EXIT
	END

	// Includes cross-mod consideration with BG1RE and the Eltan romand mod
	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) !Global("C#RE1_ScarRetrieval","GLOBAL",15) OR(2) GlobalGT("#L_EltanVisit","GLOBAL",0) Global("#L_EltanLoveMatch","GLOBAL",0) ~ THEN BEGIN ELTAN_HELLO
		SAY @2057 /* ~Greetings, <GABBER>.  It's a pleasure to see you again.~ */
		IF ~~ THEN EXIT
	END
END
