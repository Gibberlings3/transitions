////////////////////////////////////////////////////////////////////
// Dialogues for Garrick to force him to leave before SoD and BG2 //
// Compiled via main_common.tpa                                   //
////////////////////////////////////////////////////////////////////

// ToDo: Give him a split of the gold but destroy some of it immediately
// 		in case he's in SoD or BG2 because he would spend some

CHAIN
	IF WEIGHT #-998 ~Global("#L_GarrickModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) GlobalGT("EndOfBG1","GLOBAL",0)~ THEN GARRIJ PRE_SOD_WARNING
		@2366 /* ~<CHARNAME>, I can wait no longer to begin my epic ballad.  I must insist that it is time to part ways.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== KHALIJ IF ~OR(2) !IsValidForPartyDialogue("JAHEIRA") !Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2335 /* ~I must go as well~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2357 /* ~Yes, I really do have to go.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_GarrickModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN GARRIJ PRE_SOD_LEAVE
		@2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~		
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2356 /* ~See ya!  Good luck and all.~ */ DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("Garrick",LeaveParty()) ActionOverride("Garrick",EscapeArea())~ EXIT


APPEND_EARLY GARRIP
	IF WEIGHT #-999 ~Global("#L_GarrickModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalGT("#L_NPCPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_FINALLY
		// We've already done the 'I'm eager' spiel
		SAY @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */
		IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~Global("#L_GarrickModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) Global("#L_NPCPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_GOODBYE
//		SAY @2316 /* ~I am eager to present our accomplishments before my superiors.  Thank you for all you've done.~ */
		SAY @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */
		IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-997 ~Global("#L_GarrickModded","GLOBAL",0) GlobalGT("EndOfBG1","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN BEGIN IN_SOD_TIME_TO_GO
		SAY @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */
		IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END
END
