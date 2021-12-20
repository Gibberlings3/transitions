///////////////////////////////////////////////////////////////////////
// Dialogue for the item given by Duke Belt used to advance the game //
// Allows the player to advance campaigns                            // 
// Compiled via main_sod.tpa                                         //
///////////////////////////////////////////////////////////////////////

BEGIN ~#LAdvGm1~
	// The make-up of the group is determined in new cutscene (#LCtNPCs)
	// It will direct to the next step according to how much gold the party has and how many humanoid NPCs are in the group
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0)~ THEN BEGIN ITEM_BG1
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1)~ + SPLIT_GOLD
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2)~ + SPLIT_GOLD
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(4) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03") PartyHasItem("#LKey04")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3)~ + SPLIT_GOLD
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03") !PartyHasItem("#LKey04")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3)~ + SPLIT_GOLD
		+ ~Global("#L_SoD","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1)~ + SPLIT_GOLD
	END

	IF ~GlobalGT("BD_Plot","GLOBAL",1) Global("#L_StartBG2","GLOBAL",0)~ THEN BEGIN ITEM_SoD
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_SoD","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1)~ + SPLIT_GOLD
	END

	IF ~~ THEN ITEM_FUN
		SAY @2310 /* ~May I suggest the tour of Durlag's Tower that is offered in Ulgoth's Beard?  It could prove quite interesting.~ */
		IF ~~ THEN DO ~SetGlobal("#L_LetsHaveFun","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN SPLIT_GOLD
		SAY @2532 // ~As you wish.~
		IF ~~ THEN DO ~SetGlobal("#L_SoloExitTimer","GLOBAL",0) SetGlobal("#L_TransTalk","GLOBAL",0) SetGlobal("#L_RecountParty","GLOBAL",1) StartCutSceneEx("#LCtNPCs",TRUE)~ EXIT
	END
	