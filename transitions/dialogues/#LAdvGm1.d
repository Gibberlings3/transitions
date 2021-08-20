///////////////////////////////////////////////////////////////////////
// Dialogue for the item given by Duke Belt used to advance the game //
// Compiled via main_common.tpa                                      //
///////////////////////////////////////////////////////////////////////

BEGIN ~#LAdvGm1~
	// Broke this up based upon make-up of group
	// Solo and player-only groups go right to the next stage without exit dialogues or splitting of gold
	// If there's an NPC in the group, then we make accommodation for both
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) NumInParty(1)~ THEN BEGIN ITEM_BG1_1
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END
	
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) NumInParty(2) Name("None",Player2)~ THEN BEGIN ITEM_BG1_2
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END
	
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) NumInParty(3) Name("None",Player2) Name("None",Player3)~ THEN BEGIN ITEM_BG1_3
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END
	
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) NumInParty(4) Name("None",Player2) Name("None",Player3) Name("None",Player4)~ THEN BEGIN ITEM_BG1_4
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END
	
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) NumInParty(5) Name("None",Player2) Name("None",Player3) Name("None",Player4) Name("None",Player5)~ THEN BEGIN ITEM_BG1_5
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) NumInParty(6) Name("None",Player2) Name("None",Player3) Name("None",Player4) Name("None",Player5) Name("None",Player6)~ THEN BEGIN ITEM_BG1_6
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3) StartCutSceneMode() StartCutSceneEx("#L_Cut07",TRUE)~ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END
	
	IF ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0)~ THEN BEGIN ITEM_BG1_NPC
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1) NumInPartyGT(1)~ + @2304 /* ~I'd like to go to my room in the palace.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",1)~ + SPLIT_GOLD
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",1) NumInPartyGT(1)~ + @2307	/* ~I'd like to visit Imoen.~ */  DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",2)~ + SPLIT_GOLD
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) NumInPartyGT(1) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3)~ + SPLIT_GOLD
		+ ~Global("#L_AcceptedRoom","GLOBAL",0) Global("#L_ImoenInPalace","GLOBAL",0) NumInPartyGT(1) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern.~ */ DO ~SetGlobal("#L_StartCaelarAttack","GLOBAL",3)~ + SPLIT_GOLD
		+ ~Global("#L_EET","GLOBAL",1) NumInPartyGT(1)~ + @2309 /* ~I'd like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1)~ + SPLIT_GOLD
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0) NumInParty(1)~ THEN BEGIN ITEM_SoD_1
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0) NumInParty(2) Name("None",Player2)~ THEN BEGIN ITEM_SoD_2
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0) NumInParty(3) Name("None",Player2) Name("None",Player3)~ THEN BEGIN ITEM_SoD_3
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0) NumInParty(4) Name("None",Player2) Name("None",Player3) Name("None",Player4)~ THEN BEGIN ITEM_SoD_4
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0) NumInParty(5) Name("None",Player2) Name("None",Player3) Name("None",Player4) Name("None",Player5)~ THEN BEGIN ITEM_SoD_5
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0) NumInParty(6) Name("None",Player2) Name("None",Player3) Name("None",Player4) Name("None",Player5) Name("None",Player6)~ THEN BEGIN ITEM_SoD_6
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1) StartCutSceneMode() StartCutSceneEx("#L_Cut09",TRUE)~ EXIT
	END

	IF ~Global("#L_StartCaelarAttack","GLOBAL",99) Global("#L_StartBG2","GLOBAL",0)~ THEN BEGIN ITEM_SoD_NPC
		SAY	@2302 /* ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ [BD69824] */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2308 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_EET","GLOBAL",1)~ + @2466 /* ~I want to gather a group and head as far away from here as possible.~ */ DO ~SetGlobal("#L_StartBG2","GLOBAL",1)~ + SPLIT_GOLD
	END

	IF ~~ THEN ITEM_FUN
		SAY @2310 /* ~May I suggest the tour of Durlag's Tower that is offered in Ulgoth's Beard?  It could prove quite interesting.~ */
		IF ~~ THEN DO ~SetGlobal("#L_LetsHaveFun","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN SPLIT_GOLD
		SAY @2532 // ~As you wish.~
		+ ~PartyGoldLT(2000) NumInParty(2)~ +@2379 DO ~StartCutSceneMode() StartCutSceneEx("#LSayBye",TRUE)~ EXIT
		+ ~PartyGoldLT(3000) NumInParty(3)~ +@2379 DO ~StartCutSceneMode() StartCutSceneEx("#LSayBye",TRUE)~ EXIT
		+ ~PartyGoldLT(4000) NumInParty(4)~ +@2379 DO ~StartCutSceneMode() StartCutSceneEx("#LSayBye",TRUE)~ EXIT
		+ ~PartyGoldLT(5000) NumInParty(5)~ +@2379 DO ~StartCutSceneMode() StartCutSceneEx("#LSayBye",TRUE)~ EXIT
		+ ~PartyGoldLT(6000) NumInParty(6)~ +@2379 DO ~StartCutSceneMode() StartCutSceneEx("#LSayBye",TRUE)~ EXIT
		+ ~!PartyGoldLT(2000) NumInParty(2)~ +@2378 DO ~StartCutSceneMode() StartCutSceneEx("#LSplit2",TRUE)~ EXIT
		+ ~!PartyGoldLT(3000) NumInParty(3)~ +@2378 DO ~StartCutSceneMode() StartCutSceneEx("#LSplit3",TRUE)~ EXIT
		+ ~!PartyGoldLT(4000) NumInParty(4)~ +@2378 DO ~StartCutSceneMode() StartCutSceneEx("#LSplit4",TRUE)~ EXIT
		+ ~!PartyGoldLT(5000) NumInParty(5)~ +@2378 DO ~StartCutSceneMode() StartCutSceneEx("#LSplit5",TRUE)~ EXIT
		+ ~!PartyGoldLT(6000) NumInParty(6)~ +@2378 DO ~StartCutSceneMode() StartCutSceneEx("#LSplit6",TRUE)~ EXIT
	END