///////////////////////////////////////////////////////////////////////
// Dialogue for the item given by Duke Belt used to advance the game //
// Compiled via main_common.tpa                                      //
///////////////////////////////////////////////////////////////////////

BEGIN ~#LAdvGm1~
	IF ~True()~ THEN BEGIN ITEM_O1
		SAY	@2302 /*	= ~You hear a voice, remarkably similar to Duke Belt's, echo strangely in your mind~ */
		= @2303 /* ~So, <CHARNAME>, what would you like to do?~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1) !Dead("DEATHK")~ + @2309 /* ~Nothing at this time.~ */ + ITEM_FUN
		+ ~OR(2) Global("#L_LetsHaveFun","GLOBAL",1) Dead("DEATHK")~ + @2309 /* ~Nothing at this time.~ */ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2304 /* ~I'd like to go to my room in the palace and sleep for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("#L_StartCaelarAttack","GLOBAL",1)~ EXIT
		+ ~OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2305 /* ~I'd like to go home and sleep for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("#L_StartCaelarAttack","GLOBAL",3)~ EXIT
		+ ~!Global("#L_AcceptedRoom","GLOBAL",1) Global("#L_ImoenInPalace","GLOBAL",1) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2307 /* ~I'd like to visit Imoen and then go home and sleep for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("#L_StartCaelarAttack","GLOBAL",2)~ EXIT
		+ ~!PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2306 /* ~I'd like to go to the Elfsong Tavern and celebrate for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("#L_StartCaelarAttack","GLOBAL",4)~ EXIT
		+ ~!Global("#L_AcceptedRoom","GLOBAL",1) Global("#L_ImoenInPalace","GLOBAL",1) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2308 /* ~I'd like to visit Imoen and then head to the Elfsong to celebrate for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("#L_StartCaelarAttack","GLOBAL",2)~ EXIT
		++ @2310 /* ~I like to gather a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("#L_StartBG2","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN ITEM_FUN
		SAY @2311 /* ~May I suggest the tour of Durlag's Tower that is offered in Ulgoth's Beard?  It could prove quite interesting.~ */
		IF ~~ THEN DO ~SetGlobal("#L_LetsHaveFun","GLOBAL",1)~ EXIT
	END

