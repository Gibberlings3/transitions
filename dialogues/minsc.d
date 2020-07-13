/////////////////////////////////////////////////////////////////////
// Dialogues for Minsc to allow for him to leave before SoD starts //
// Compiled via main_common.tpa                                    //
/////////////////////////////////////////////////////////////////////

CHAIN
	IF WEIGHT #-998 ~Global("#L_MinscModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) Global("EndOfBG1","GLOBAL",1) GlobalGT("#L_StartCaelarAttack","GLOBAL",0)~ THEN MINSCJ_ PRE_SOD_WARNING
		@2375 /* ~Boo is tired and needs a break from all the butt-kicking.  Just a short one.  We'll be near by if you need us.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== DYNAHJ IF ~IsValidForPartyDialogue("DYNAHEIR") Global("#L_DynaheirModded","GLOBAL",0)~ @2381	/* ~Aye, a rest will do us all good.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== KHALIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== KHALIJ IF ~OR(2) !IsValidForPartyDialogue("JAHEIRA") !Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2335 /* ~I must go as well~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2357 /* ~Yes, I really do have to go.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2367 /* ~I can't wait any longer, either.~ */
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2373 /* ~I need to report back to Evereska.~ */
	END
	// @2378	= ~Here!  Take you're share of the gold before you leave.  You've earned it.~
	// @2379	= ~Thank you for your help.  I can finally relax a little~
	// The PC should be left with no less than 3k gold
	// To give the treasurer something to steal if they're staying at the palace
	+ ~PartyGoldLT(4000) NumInParty(2)~ +@2379 DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(5000) NumInParty(3)~ +@2379 DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(6000) NumInParty(4)~ +@2379 DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(7000) NumInParty(5)~ +@2379 DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(8000) NumInParty(6)~ +@2379 DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(5000) !PartyGoldLT(4000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(1000)) ActionOverride(Player3,TakePartyGold(1000)) ActionOverride(Player4,TakePartyGold(1000)) ActionOverride(Player5,TakePartyGold(1000)) ActionOverride(Player6,TakePartyGold(1000)) ActionOverride(Player2,DestroyGold(900)) ActionOverride(Player3,DestroyGold(900)) ActionOverride(Player4,DestroyGold(900)) ActionOverride(Player5,DestroyGold(900)) ActionOverride(Player6,DestroyGold(900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(7000) !PartyGoldLT(5000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(1000)) ActionOverride(Player3,TakePartyGold(1000)) ActionOverride(Player4,TakePartyGold(1000)) ActionOverride(Player5,TakePartyGold(1000)) ActionOverride(Player6,TakePartyGold(1000)) ActionOverride(Player2,DestroyGold(900)) ActionOverride(Player3,DestroyGold(900)) ActionOverride(Player4,DestroyGold(900)) ActionOverride(Player5,DestroyGold(900)) ActionOverride(Player6,DestroyGold(900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(9000) !PartyGoldLT(6000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(1000)) ActionOverride(Player3,TakePartyGold(1000)) ActionOverride(Player4,TakePartyGold(1000)) ActionOverride(Player5,TakePartyGold(1000)) ActionOverride(Player6,TakePartyGold(1000)) ActionOverride(Player2,DestroyGold(900)) ActionOverride(Player3,DestroyGold(900)) ActionOverride(Player4,DestroyGold(900)) ActionOverride(Player5,DestroyGold(900)) ActionOverride(Player6,DestroyGold(900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(11000) !PartyGoldLT(7000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(1000)) ActionOverride(Player3,TakePartyGold(1000)) ActionOverride(Player4,TakePartyGold(1000)) ActionOverride(Player5,TakePartyGold(1000)) ActionOverride(Player6,TakePartyGold(1000)) ActionOverride(Player2,DestroyGold(900)) ActionOverride(Player3,DestroyGold(900)) ActionOverride(Player4,DestroyGold(900)) ActionOverride(Player5,DestroyGold(900)) ActionOverride(Player6,DestroyGold(900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(13000) !PartyGoldLT(8000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(1000)) ActionOverride(Player3,TakePartyGold(1000)) ActionOverride(Player4,TakePartyGold(1000)) ActionOverride(Player5,TakePartyGold(1000)) ActionOverride(Player6,TakePartyGold(1000)) ActionOverride(Player2,DestroyGold(900)) ActionOverride(Player3,DestroyGold(900)) ActionOverride(Player4,DestroyGold(900)) ActionOverride(Player5,DestroyGold(900)) ActionOverride(Player6,DestroyGold(900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(5500) !PartyGoldLT(5000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2000)) ActionOverride(Player3,TakePartyGold(2000)) ActionOverride(Player4,TakePartyGold(2000)) ActionOverride(Player5,TakePartyGold(2000)) ActionOverride(Player6,TakePartyGold(2000)) ActionOverride(Player2,DestroyGold(1900)) ActionOverride(Player3,DestroyGold(1900)) ActionOverride(Player4,DestroyGold(1900)) ActionOverride(Player5,DestroyGold(1900)) ActionOverride(Player6,DestroyGold(1900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(8000) !PartyGoldLT(7000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2000)) ActionOverride(Player3,TakePartyGold(2000)) ActionOverride(Player4,TakePartyGold(2000)) ActionOverride(Player5,TakePartyGold(2000)) ActionOverride(Player6,TakePartyGold(2000)) ActionOverride(Player2,DestroyGold(1900)) ActionOverride(Player3,DestroyGold(1900)) ActionOverride(Player4,DestroyGold(1900)) ActionOverride(Player5,DestroyGold(1900)) ActionOverride(Player6,DestroyGold(1900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(10500) !PartyGoldLT(9000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2000)) ActionOverride(Player3,TakePartyGold(2000)) ActionOverride(Player4,TakePartyGold(2000)) ActionOverride(Player5,TakePartyGold(2000)) ActionOverride(Player6,TakePartyGold(2000)) ActionOverride(Player2,DestroyGold(1900)) ActionOverride(Player3,DestroyGold(1900)) ActionOverride(Player4,DestroyGold(1900)) ActionOverride(Player5,DestroyGold(1900)) ActionOverride(Player6,DestroyGold(1900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(13000) !PartyGoldLT(11000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2000)) ActionOverride(Player3,TakePartyGold(2000)) ActionOverride(Player4,TakePartyGold(2000)) ActionOverride(Player5,TakePartyGold(2000)) ActionOverride(Player6,TakePartyGold(2000)) ActionOverride(Player2,DestroyGold(1900)) ActionOverride(Player3,DestroyGold(1900)) ActionOverride(Player4,DestroyGold(1900)) ActionOverride(Player5,DestroyGold(1900)) ActionOverride(Player6,DestroyGold(1900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(15500) !PartyGoldLT(13000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2000)) ActionOverride(Player3,TakePartyGold(2000)) ActionOverride(Player4,TakePartyGold(2000)) ActionOverride(Player5,TakePartyGold(2000)) ActionOverride(Player6,TakePartyGold(2000)) ActionOverride(Player2,DestroyGold(1900)) ActionOverride(Player3,DestroyGold(1900)) ActionOverride(Player4,DestroyGold(1900)) ActionOverride(Player5,DestroyGold(1900)) ActionOverride(Player6,DestroyGold(1900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(10000) !PartyGoldLT(5500) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2500)) ActionOverride(Player3,TakePartyGold(2500)) ActionOverride(Player4,TakePartyGold(2500)) ActionOverride(Player5,TakePartyGold(2500)) ActionOverride(Player6,TakePartyGold(2500)) ActionOverride(Player2,DestroyGold(2400)) ActionOverride(Player3,DestroyGold(2400)) ActionOverride(Player4,DestroyGold(2400)) ActionOverride(Player5,DestroyGold(2400)) ActionOverride(Player6,DestroyGold(2400)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(15000) !PartyGoldLT(8000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2500)) ActionOverride(Player3,TakePartyGold(2500)) ActionOverride(Player4,TakePartyGold(2500)) ActionOverride(Player5,TakePartyGold(2500)) ActionOverride(Player6,TakePartyGold(2500)) ActionOverride(Player2,DestroyGold(2400)) ActionOverride(Player3,DestroyGold(2400)) ActionOverride(Player4,DestroyGold(2400)) ActionOverride(Player5,DestroyGold(2400)) ActionOverride(Player6,DestroyGold(2400)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(20000) !PartyGoldLT(10500) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2500)) ActionOverride(Player3,TakePartyGold(2500)) ActionOverride(Player4,TakePartyGold(2500)) ActionOverride(Player5,TakePartyGold(2500)) ActionOverride(Player6,TakePartyGold(2500)) ActionOverride(Player2,DestroyGold(2400)) ActionOverride(Player3,DestroyGold(2400)) ActionOverride(Player4,DestroyGold(2400)) ActionOverride(Player5,DestroyGold(2400)) ActionOverride(Player6,DestroyGold(2400)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(25000) !PartyGoldLT(13000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2500)) ActionOverride(Player3,TakePartyGold(2500)) ActionOverride(Player4,TakePartyGold(2500)) ActionOverride(Player5,TakePartyGold(2500)) ActionOverride(Player6,TakePartyGold(2500)) ActionOverride(Player2,DestroyGold(2400)) ActionOverride(Player3,DestroyGold(2400)) ActionOverride(Player4,DestroyGold(2400)) ActionOverride(Player5,DestroyGold(2400)) ActionOverride(Player6,DestroyGold(2400)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(30000) !PartyGoldLT(15500) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(2500)) ActionOverride(Player3,TakePartyGold(2500)) ActionOverride(Player4,TakePartyGold(2500)) ActionOverride(Player5,TakePartyGold(2500)) ActionOverride(Player6,TakePartyGold(2500)) ActionOverride(Player2,DestroyGold(2400)) ActionOverride(Player3,DestroyGold(2400)) ActionOverride(Player4,DestroyGold(2400)) ActionOverride(Player5,DestroyGold(2400)) ActionOverride(Player6,DestroyGold(2400)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(20000) !PartyGoldLT(10000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(5000)) ActionOverride(Player3,TakePartyGold(5000)) ActionOverride(Player4,TakePartyGold(5000)) ActionOverride(Player5,TakePartyGold(5000)) ActionOverride(Player6,TakePartyGold(5000)) ActionOverride(Player2,DestroyGold(4900)) ActionOverride(Player3,DestroyGold(4900)) ActionOverride(Player4,DestroyGold(4900)) ActionOverride(Player5,DestroyGold(4900)) ActionOverride(Player6,DestroyGold(4900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(30000) !PartyGoldLT(15000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(5000)) ActionOverride(Player3,TakePartyGold(5000)) ActionOverride(Player4,TakePartyGold(5000)) ActionOverride(Player5,TakePartyGold(5000)) ActionOverride(Player6,TakePartyGold(5000)) ActionOverride(Player2,DestroyGold(4900)) ActionOverride(Player3,DestroyGold(4900)) ActionOverride(Player4,DestroyGold(4900)) ActionOverride(Player5,DestroyGold(4900)) ActionOverride(Player6,DestroyGold(4900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(40000) !PartyGoldLT(20000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(5000)) ActionOverride(Player3,TakePartyGold(5000)) ActionOverride(Player4,TakePartyGold(5000)) ActionOverride(Player5,TakePartyGold(5000)) ActionOverride(Player6,TakePartyGold(5000)) ActionOverride(Player2,DestroyGold(4900)) ActionOverride(Player3,DestroyGold(4900)) ActionOverride(Player4,DestroyGold(4900)) ActionOverride(Player5,DestroyGold(4900)) ActionOverride(Player6,DestroyGold(4900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(50000) !PartyGoldLT(25000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(5000)) ActionOverride(Player3,TakePartyGold(5000)) ActionOverride(Player4,TakePartyGold(5000)) ActionOverride(Player5,TakePartyGold(5000)) ActionOverride(Player6,TakePartyGold(5000)) ActionOverride(Player2,DestroyGold(4900)) ActionOverride(Player3,DestroyGold(4900)) ActionOverride(Player4,DestroyGold(4900)) ActionOverride(Player5,DestroyGold(4900)) ActionOverride(Player6,DestroyGold(4900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(60000) !PartyGoldLT(30000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(5000)) ActionOverride(Player3,TakePartyGold(5000)) ActionOverride(Player4,TakePartyGold(5000)) ActionOverride(Player5,TakePartyGold(5000)) ActionOverride(Player6,TakePartyGold(5000)) ActionOverride(Player2,DestroyGold(4900)) ActionOverride(Player3,DestroyGold(4900)) ActionOverride(Player4,DestroyGold(4900)) ActionOverride(Player5,DestroyGold(4900)) ActionOverride(Player6,DestroyGold(4900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(30000) !PartyGoldLT(20000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(10000)) ActionOverride(Player3,TakePartyGold(10000)) ActionOverride(Player4,TakePartyGold(10000)) ActionOverride(Player5,TakePartyGold(10000)) ActionOverride(Player6,TakePartyGold(10000)) ActionOverride(Player2,DestroyGold(9900)) ActionOverride(Player3,DestroyGold(9900)) ActionOverride(Player4,DestroyGold(9900)) ActionOverride(Player5,DestroyGold(9900)) ActionOverride(Player6,DestroyGold(9900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(45000) !PartyGoldLT(30000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(10000)) ActionOverride(Player3,TakePartyGold(10000)) ActionOverride(Player4,TakePartyGold(10000)) ActionOverride(Player5,TakePartyGold(10000)) ActionOverride(Player6,TakePartyGold(10000)) ActionOverride(Player2,DestroyGold(9900)) ActionOverride(Player3,DestroyGold(9900)) ActionOverride(Player4,DestroyGold(9900)) ActionOverride(Player5,DestroyGold(9900)) ActionOverride(Player6,DestroyGold(9900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(60000) !PartyGoldLT(40000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(10000)) ActionOverride(Player3,TakePartyGold(10000)) ActionOverride(Player4,TakePartyGold(10000)) ActionOverride(Player5,TakePartyGold(10000)) ActionOverride(Player6,TakePartyGold(10000)) ActionOverride(Player2,DestroyGold(9900)) ActionOverride(Player3,DestroyGold(9900)) ActionOverride(Player4,DestroyGold(9900)) ActionOverride(Player5,DestroyGold(9900)) ActionOverride(Player6,DestroyGold(9900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(75000) !PartyGoldLT(50000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(10000)) ActionOverride(Player3,TakePartyGold(10000)) ActionOverride(Player4,TakePartyGold(10000)) ActionOverride(Player5,TakePartyGold(10000)) ActionOverride(Player6,TakePartyGold(10000)) ActionOverride(Player2,DestroyGold(9900)) ActionOverride(Player3,DestroyGold(9900)) ActionOverride(Player4,DestroyGold(9900)) ActionOverride(Player5,DestroyGold(9900)) ActionOverride(Player6,DestroyGold(9900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(90000) !PartyGoldLT(60000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(10000)) ActionOverride(Player3,TakePartyGold(10000)) ActionOverride(Player4,TakePartyGold(10000)) ActionOverride(Player5,TakePartyGold(10000)) ActionOverride(Player6,TakePartyGold(10000)) ActionOverride(Player2,DestroyGold(9900)) ActionOverride(Player3,DestroyGold(9900)) ActionOverride(Player4,DestroyGold(9900)) ActionOverride(Player5,DestroyGold(9900)) ActionOverride(Player6,DestroyGold(9900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(40000) !PartyGoldLT(30000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(15000)) ActionOverride(Player3,TakePartyGold(15000)) ActionOverride(Player4,TakePartyGold(15000)) ActionOverride(Player5,TakePartyGold(15000)) ActionOverride(Player6,TakePartyGold(15000)) ActionOverride(Player2,DestroyGold(14900)) ActionOverride(Player3,DestroyGold(14900)) ActionOverride(Player4,DestroyGold(14900)) ActionOverride(Player5,DestroyGold(14900)) ActionOverride(Player6,DestroyGold(14900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(60000) !PartyGoldLT(45000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(15000)) ActionOverride(Player3,TakePartyGold(15000)) ActionOverride(Player4,TakePartyGold(15000)) ActionOverride(Player5,TakePartyGold(15000)) ActionOverride(Player6,TakePartyGold(15000)) ActionOverride(Player2,DestroyGold(14900)) ActionOverride(Player3,DestroyGold(14900)) ActionOverride(Player4,DestroyGold(14900)) ActionOverride(Player5,DestroyGold(14900)) ActionOverride(Player6,DestroyGold(14900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(80000) !PartyGoldLT(60000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(15000)) ActionOverride(Player3,TakePartyGold(15000)) ActionOverride(Player4,TakePartyGold(15000)) ActionOverride(Player5,TakePartyGold(15000)) ActionOverride(Player6,TakePartyGold(15000)) ActionOverride(Player2,DestroyGold(14900)) ActionOverride(Player3,DestroyGold(14900)) ActionOverride(Player4,DestroyGold(14900)) ActionOverride(Player5,DestroyGold(14900)) ActionOverride(Player6,DestroyGold(14900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(100000) !PartyGoldLT(75000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(15000)) ActionOverride(Player3,TakePartyGold(15000)) ActionOverride(Player4,TakePartyGold(15000)) ActionOverride(Player5,TakePartyGold(15000)) ActionOverride(Player6,TakePartyGold(15000)) ActionOverride(Player2,DestroyGold(14900)) ActionOverride(Player3,DestroyGold(14900)) ActionOverride(Player4,DestroyGold(14900)) ActionOverride(Player5,DestroyGold(14900)) ActionOverride(Player6,DestroyGold(14900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(120000) !PartyGoldLT(90000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(15000)) ActionOverride(Player3,TakePartyGold(15000)) ActionOverride(Player4,TakePartyGold(15000)) ActionOverride(Player5,TakePartyGold(15000)) ActionOverride(Player6,TakePartyGold(15000)) ActionOverride(Player2,DestroyGold(14900)) ActionOverride(Player3,DestroyGold(14900)) ActionOverride(Player4,DestroyGold(14900)) ActionOverride(Player5,DestroyGold(14900)) ActionOverride(Player6,DestroyGold(14900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(50000) !PartyGoldLT(40000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(20000)) ActionOverride(Player3,TakePartyGold(20000)) ActionOverride(Player4,TakePartyGold(20000)) ActionOverride(Player5,TakePartyGold(20000)) ActionOverride(Player6,TakePartyGold(20000)) ActionOverride(Player2,DestroyGold(19900)) ActionOverride(Player3,DestroyGold(19900)) ActionOverride(Player4,DestroyGold(19900)) ActionOverride(Player5,DestroyGold(19900)) ActionOverride(Player6,DestroyGold(19900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(75000) !PartyGoldLT(60000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(20000)) ActionOverride(Player3,TakePartyGold(20000)) ActionOverride(Player4,TakePartyGold(20000)) ActionOverride(Player5,TakePartyGold(20000)) ActionOverride(Player6,TakePartyGold(20000)) ActionOverride(Player2,DestroyGold(19900)) ActionOverride(Player3,DestroyGold(19900)) ActionOverride(Player4,DestroyGold(19900)) ActionOverride(Player5,DestroyGold(19900)) ActionOverride(Player6,DestroyGold(19900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(100000) !PartyGoldLT(80000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(20000)) ActionOverride(Player3,TakePartyGold(20000)) ActionOverride(Player4,TakePartyGold(20000)) ActionOverride(Player5,TakePartyGold(20000)) ActionOverride(Player6,TakePartyGold(20000)) ActionOverride(Player2,DestroyGold(19900)) ActionOverride(Player3,DestroyGold(19900)) ActionOverride(Player4,DestroyGold(19900)) ActionOverride(Player5,DestroyGold(19900)) ActionOverride(Player6,DestroyGold(19900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(125000) !PartyGoldLT(100000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(20000)) ActionOverride(Player3,TakePartyGold(20000)) ActionOverride(Player4,TakePartyGold(20000)) ActionOverride(Player5,TakePartyGold(20000)) ActionOverride(Player6,TakePartyGold(20000)) ActionOverride(Player2,DestroyGold(19900)) ActionOverride(Player3,DestroyGold(19900)) ActionOverride(Player4,DestroyGold(19900)) ActionOverride(Player5,DestroyGold(19900)) ActionOverride(Player6,DestroyGold(19900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~PartyGoldLT(150000) !PartyGoldLT(120000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(20000)) ActionOverride(Player3,TakePartyGold(20000)) ActionOverride(Player4,TakePartyGold(20000)) ActionOverride(Player5,TakePartyGold(20000)) ActionOverride(Player6,TakePartyGold(20000)) ActionOverride(Player2,DestroyGold(19900)) ActionOverride(Player3,DestroyGold(19900)) ActionOverride(Player4,DestroyGold(19900)) ActionOverride(Player5,DestroyGold(19900)) ActionOverride(Player6,DestroyGold(19900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~!PartyGoldLT(50000) NumInParty(2)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(25000)) ActionOverride(Player3,TakePartyGold(25000)) ActionOverride(Player4,TakePartyGold(25000)) ActionOverride(Player5,TakePartyGold(25000)) ActionOverride(Player6,TakePartyGold(25000)) ActionOverride(Player2,DestroyGold(24900)) ActionOverride(Player3,DestroyGold(24900)) ActionOverride(Player4,DestroyGold(24900)) ActionOverride(Player5,DestroyGold(24900)) ActionOverride(Player6,DestroyGold(24900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~!PartyGoldLT(75000) NumInParty(3)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(25000)) ActionOverride(Player3,TakePartyGold(25000)) ActionOverride(Player4,TakePartyGold(25000)) ActionOverride(Player5,TakePartyGold(25000)) ActionOverride(Player6,TakePartyGold(25000)) ActionOverride(Player2,DestroyGold(24900)) ActionOverride(Player3,DestroyGold(24900)) ActionOverride(Player4,DestroyGold(24900)) ActionOverride(Player5,DestroyGold(24900)) ActionOverride(Player6,DestroyGold(24900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~!PartyGoldLT(100000) NumInParty(4)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(25000)) ActionOverride(Player3,TakePartyGold(25000)) ActionOverride(Player4,TakePartyGold(25000)) ActionOverride(Player5,TakePartyGold(25000)) ActionOverride(Player6,TakePartyGold(25000)) ActionOverride(Player2,DestroyGold(24900)) ActionOverride(Player3,DestroyGold(24900)) ActionOverride(Player4,DestroyGold(24900)) ActionOverride(Player5,DestroyGold(24900)) ActionOverride(Player6,DestroyGold(24900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~!PartyGoldLT(125000) NumInParty(5)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(25000)) ActionOverride(Player3,TakePartyGold(25000)) ActionOverride(Player4,TakePartyGold(25000)) ActionOverride(Player5,TakePartyGold(25000)) ActionOverride(Player6,TakePartyGold(25000)) ActionOverride(Player2,DestroyGold(24900)) ActionOverride(Player3,DestroyGold(24900)) ActionOverride(Player4,DestroyGold(24900)) ActionOverride(Player5,DestroyGold(24900)) ActionOverride(Player6,DestroyGold(24900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT
	+ ~!PartyGoldLT(150000) NumInParty(6)~ +@2378 DO ~ActionOverride(Player2,TakePartyGold(25000)) ActionOverride(Player3,TakePartyGold(25000)) ActionOverride(Player4,TakePartyGold(25000)) ActionOverride(Player5,TakePartyGold(25000)) ActionOverride(Player6,TakePartyGold(25000)) ActionOverride(Player2,DestroyGold(24900)) ActionOverride(Player3,DestroyGold(24900)) ActionOverride(Player4,DestroyGold(24900)) ActionOverride(Player5,DestroyGold(24900)) ActionOverride(Player6,DestroyGold(24900)) SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_MinscModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN MINSCJ_ PRE_SOD_LEAVE
		@2377 /* ~If you need us, look for us at the Three Old Kegs.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",DestroyGold(0)) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2356 /* ~See ya!  Good luck and all.~ */ DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */ DO ~SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",EscapeArea())~
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2374 /* ~Farewell though I certainly shall not.~ */ DO ~SetGlobal("L_XanOkInBG1Areas","GLOBAL",1) ActionOverride("XAN",LeaveParty()) ActionOverride("XAN",EscapeArea())~
		== DYNAHJ IF ~IsValidForPartyDialogue("DYNAHEIR") Global("#L_DynaheirModded","GLOBAL",0)~ @2388 /* ~Farewell until we meet again.~ */ DO ~SetGlobal("L_DynaheirOkInBG1Areas","GLOBAL",1) ActionOverride("Dynaheir",LeaveParty()) ActionOverride("Dynaheir",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_MinscOkInBG1Areas","GLOBAL",1) ActionOverride("Minsc",LeaveParty()) ActionOverride("Minsc",EscapeArea())~ EXIT

