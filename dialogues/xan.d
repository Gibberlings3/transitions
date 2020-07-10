////////////////////////////////////////////////////////////////////
// Dialogues for Xan to force him to leave before SoD and BG2 //
// Compiled via main_common.tpa                                   //
////////////////////////////////////////////////////////////////////

// ToDo: Give him a split of the gold but destroy some of it immediately
// 		in case he's in SoD or BG2 because he would spend some

CHAIN
	IF WEIGHT #-998 ~Global("#L_XanModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) Global("EndOfBG1","GLOBAL",1) GlobalGT("#L_StartCaelarAttack","GLOBAL",0)~ THEN XANJ PRE_SOD_WARNING
		@2372 /* ~I'm amazed we've made it this far, <CHARNAME>.  I need to report back before our luck inevitably runs out.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== KHALIJ IF ~OR(2) !IsValidForPartyDialogue("JAHEIRA") !Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2335 /* ~I must go as well~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2357 /* ~Yes, I really do have to go.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2367 /* ~I can't wait any longer, either.~ */
		== MINSCJ_ IF ~IsValidForPartyDialogue("MINSC") Global("#L_MinscModded","GLOBAL",0)~ @2376 /* ~Boo is weary and must rest!~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_XanModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN XANJ PRE_SOD_LEAVE
		@2374 /* ~Farewell though I certainly shall not.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~		
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2356 /* ~See ya!  Good luck and all.~ */ DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */ DO ~SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",EscapeArea())~
		== MINSCJ_ IF ~IsValidForPartyDialogue("MINSC") Global("#L_MinscModded","GLOBAL",0)~ @2377 /* ~If you need us, look for us at the Three Old Kegs.~ */ DO ~SetGlobal("L_MinscOkInBG1Areas","GLOBAL",1) ActionOverride("MINSC",LeaveParty()) ActionOverride("MINSC",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_XanOkInBG1Areas","GLOBAL",1) ActionOverride("Xan",LeaveParty()) ActionOverride("Xan",EscapeArea())~ EXIT

CHAIN
	IF WEIGHT #-998 ~Global("#L_XanModded","GLOBAL",0) Global("#L_NPCBG2","GLOBAL",0) Global("#L_StartBG2","GLOBAL",1)~ THEN XANJ PRE_BG2_WARNING
		@2372 /* ~I'm amazed we've made it this far, <CHARNAME>.  I need to report back before our luck inevitably runs out.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2357 /* ~Yes, I really do have to go.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2367 /* ~I can't wait any longer, either.~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCBG2","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_XanModded","GLOBAL",0) GlobalGT("#L_NPCBG2","GLOBAL",0) GlobalTimerExpired("#L_NPCBG2","GLOBAL") Global("#L_NPCBG2Left","GLOBAL",0)~ THEN XANJ PRE_BG2_LEAVE
		@2374 /* ~Farewell though I certainly shall not.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2356 /* ~See ya!  Good luck and all.~ */ DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */ DO ~SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCBG2Left","GLOBAL",1) SetGlobal("L_XanOkInBG1Areas","GLOBAL",1) ActionOverride("Xan",LeaveParty()) ActionOverride("Xan",EscapeArea())~ EXIT

