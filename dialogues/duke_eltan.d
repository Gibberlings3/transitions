//////////////////////////////////////////////////////////////////
// Duke Eltan in the Ducal Palace after Sarevok is killed       //
// If the protagonist delivered him safely to the harbor master //
// Patched via eltan.tpa                                        //
//////////////////////////////////////////////////////////////////

// Need to modify the first triggers so he doesn't start asking about SharTeel and Corwin
// Though, if she's in the group, he should probably want to haul her off to prison
ADD_STATE_TRIGGER BDELTAN 0 ~Global("#L_EltanTalkedToCorwin","MYAREA",0) AreaCheck("BD0102")~
REPLACE_TRIGGER_TEXT BDELTAN ~Global("k9Sharteel_Talk_ELTAN","GLOBAL",0)~ ~Global("k9Sharteel_Talk_ELTAN","GLOBAL",0) GlobalGT("BD_plot","GLOBAL",40)~
REPLACE_ACTION_TEXT BDELTAN ~SetGlobal("bd_plot_003","bd0102",1)~ ~SetGlobal("bd_plot_003","bd0102",1) SetGlobal("#L_EltanTalkedToCorwin","MYAREA",1)~

// Add Palace dialogue
APPEND BDELTAN
	IF ~Global("#L_TalkedToDukes","GLOBAL",1) 
		GlobalGT("C#RE1_ScarRetrieval","GLOBAL",10)
		GlobalLT("C#RE1_ScarRetrieval","GLOBAL",14)~
	THEN BEGIN SCAR_1
		SAY @2096 /* ~There is someone here who would like to talk you, <CHARNAME>.~ */
		IF ~~ THEN DO ~SetGlobal("C#RE1_ScarRetrieval","GLOBAL",13) ClearAllActions() StartCutSceneMode() CutSceneId(Player1) CreateCreature("c#re1sr6",[600.200],E) ActionOverride("c#re1sr6",DestroyItem("sw1h02")) ActionOverride("c#re1sr6",DestroyItem("shld04")) ActionOverride(Player1,Face(NNW)) EndCutSceneMode()~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",0) Global("C#RE1_ScarRetrieval","GLOBAL",15)~ THEN BEGIN SHOO
		SAY @2098 /* ~I have nothing more to say to you.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2) SetGlobal("#L_EltanLoveMatch","GLOBAL",0) EscapeArea()~ EXIT
	END

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
	END

	IF ~~ THEN BEGIN BEREGOST
		SAY @2075 /* ~That's the grey house on the upper west side.~ */
		= @2087 /* ~I've recently done some renovations to the place.  I hope you like them.~ */
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseBeregost","GLOBAL",2) GiveItemCreate("#LKey03",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseBeregost","GLOBAL",2) GiveItemCreate("#LKey03",Player1,1,0,0)~ + MATCH
	END

	IF ~~ THEN BEGIN HHEDGE
		SAY @2076 /* ~Ahh, a place in the woods.  Be careful not to bother the grumpy mage that will be your neighbor.~ */
		= @2087 /* ~I've recently done some renovations to the place.  I hope you like them.~ */
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseHHedge","GLOBAL",2) GiveItemCreate("#LKey02",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseHHedge","GLOBAL",2) GiveItemCreate("#LKey02",Player1,1,0,0)~ + MATCH
	END

	IF ~~ THEN BEGIN BGATE1
		SAY @2077 /* ~That house is the 2nd door to your left as you're facing the entrance to the palace.~ */
		= @2087 /* ~I've recently done some renovations to the place.  I hope you like them.~ */
		= @2078 /* ~Here's your key.~ */
		IF ~~ THEN DO ~SetGlobal("#L_HouseBGate1","GLOBAL",2) GiveItemCreate("#LKey01",Player1,1,0,0) SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN DO ~SetGlobal("#L_HouseBGate1","GLOBAL",2) GiveItemCreate("#LKey01",Player1,1,0,0)~ + MATCH
	END

	IF ~~ THEN BEGIN MATCH
		SAY @2088 /* ~(He holds your hand in his a little longer than necessary as he encloses your fingers around the key)~ */
		= @2079 /* ~While looking intently into your eyes he says, "With your permission, I'll stop by later to see how you're settling in."~ */
		++ @2089 /* ~Yes, I'd like that.~ */ DO ~SetGlobal("#L_EltanVisit","GLOBAL",1)~ + VISIT_0
		++ @2080 /* ~Uhm..sure, if you'd like.~ */ DO ~SetGlobal("#L_EltanVisit","GLOBAL",1)~ + VISIT_1
		++ @2081 /* ~Oh that's very kind of you but hardly necessary.~ */ DO ~SetGlobal("#L_EltanVisit","GLOBAL",1)~ + VISIT_2
		++ @2082 /* ~Actually, I'd prefer if you didn't.  I'd not like the attention it would draw.~ */ + SORRY
	END
	
	IF ~~ THEN BEGIN VISIT_0
		SAY @2090 /* ~I look forward to it.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN VISIT_1
		SAY @2083 /* ~I would like.  I would like very much.~  // (OMG THAT IS SO CREEPY!) */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN VISIT_2
		SAY @2084 /* ~It will be a pleasure, I assure you.~ // (STILL CREEPY!) */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN SORRY
		SAY @2085 /* ~As you will.  But feel free to visit me here or at the Flaming Fist headquarters if you should change your mind.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) Global("#L_EltanVisit","GLOBAL",0) Global("#L_EltanLoveMatch","GLOBAL",1)~ THEN BEGIN ELTAN_2_1
		SAY @2054 /* ~Hello again, <CHARNAME>.  Have you changed your mind?~ */
		++ @2055 /* ~No, I haven't.  Goodbye.~ */ + NO_CHANGE
		++ @2086 /* ~Yes I have.  I'd be honored to have you stop by.~ */ + VISIT_3
	END

	IF ~~ THEN BEGIN NO_CHANGE
		SAY @2085 /* ~As you will.  But feel free to visit me here or at the Flaming Fist headquarters if you should change your mind.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN VISIT_3
		SAY @2084 /* ~It will be a pleasure, I assure you.~ // (STILL CREEPY!) */
		IF ~~ THEN DO ~SetGlobal("#L_EltanVisit","GLOBAL",1)~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) !Global("C#RE1_ScarRetrieval","GLOBAL",15) OR(2) GlobalGT("#L_EltanVisit","GLOBAL",0) Global("#L_EltanLoveMatch","GLOBAL",0) ~ THEN BEGIN ELTAN_HELLO
		SAY @2057 /* ~Greetings, <GABBER>.  It's a pleasure to see you again.~ */
		IF ~~ THEN EXIT
	END
END
