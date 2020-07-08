/////////////////////////////////////////////////////////////////////////
// Dialogues for Jaheira to allow for her to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////

// ToDo: Give her a split of the gold but destroy most of it immediately
// 		in case she's joins in SoD or BG2 because she wouldn't carry much with her

CHAIN
	IF WEIGHT #-999 ~Global("#L_JaheriaModded","GLOBAL",0) Global("EndOfBG1","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_NPCPK","GLOBAL",2) !AreaType(DUNGEON) CombatCounter(0)~ THEN JAHEIJ POST_KORLASZ_ASK
		@2330 /* ~<CHARNAME>, you are safe now and I have places I should be, but I will stay if you have need of me.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2338	/* ~Yes, *we* should go.~ */ 
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2326 /* ~I too have other places to be.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2340	/* ~Me as well.~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2347 /* ~(gives you an exaggerated yawn)~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2354 /* ~I do have plans, yes.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2360 /* ~You hog all the limelight.~ */
	END
	+ ~!Global("#L_LetsHaveFun","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ + POST_KORLASZ_STAY
	+ ~Global("#L_LetsHaveFun","GLOBAL",1)~ + @2280 /* ~Please let me treat you to a little fun before you go.  Will a day or two make that much difference?~ */  + POST_KORLASZ_STAY
	++ @2281 /* ~Of course you may leave, but not with that equipment.~ */  + POST_KORLASZ_STAY
	++ @2282 /* ~I understand.  Now is as good a time as any to say our farewells.~ */ + POST_KORLASZ_LEAVE

CHAIN
	IF ~~ THEN JAHEIJ POST_KORLASZ_STAY
		@2327 /* ~So be it.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2333	/* ~If you insist.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2283 /* ~As you wish.  I owe you that at least.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2341	/* ~I can stay for a little while.~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2348 /* ~Fine. (sigh)~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2355 /* ~Ok, for a little while.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2361	/* ~Have it your way, as always!~ */
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",2)~ EXIT

CHAIN
	IF ~~ THEN JAHEIJ POST_KORLASZ_LEAVE
		@2328 /* ~Take care of yourself.~ */ 	
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2349 /* ~Finally!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2356 /* ~See ya!  Good luck and all.~ */ DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("Jaheira",LeaveParty()) ActionOverride("Jaheira",EscapeArea())~ EXIT

CHAIN
	IF WEIGHT #-998 ~Global("#L_JaheriaModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) Global("EndOfBG1","GLOBAL",1) GlobalGT("#L_StartCaelarAttack","GLOBAL",0)~ THEN JAHEIJ PRE_SOD_WARNING
		@2331 /* ~No more arguments, I will be leaving in just a few moments.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2357 /* ~Yes, I really do have to go.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2367 /* ~I can't wait any longer, either.~ */
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2373 /* ~I need to report back to Evereska.~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_JaheriaModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN JAHEIJ PRE_SOD_LEAVE
		@2328 /* ~Take care of yourself.~ */ 
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== NEERAJ_ IF ~IsValidForPartyDialogue("NEERA") Global("#L_NeeraModded","GLOBAL",0)~ @2356 /* ~See ya!  Good luck and all.~ */ DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */ DO ~SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",EscapeArea())~
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2374 /* ~Farewell though I certainly shall not.~ */ DO ~SetGlobal("L_XanOkInBG1Areas","GLOBAL",1) ActionOverride("XAN",LeaveParty()) ActionOverride("XAN",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("Jaheira",LeaveParty()) ActionOverride("Jaheira",EscapeArea())~ EXIT	


APPEND_EARLY JAHEIP
	// Post-Korlasz Pre-Sod/BG2
	IF WEIGHT #-999 ~Global("#L_JaheriaModded","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) Global("#L_JaheiraPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_GOODBYE1
		// Didn't lead the conversation when Korlasz was handed in
		// Or wasn't in the group at the time
		// So hasn't given her 'I'm eager to leave' spiel
		// Let her say it now
		SAY @2369 /* ~<CHARNAME>, you are safe now and I have places I should be.~ */
		= @2328 /* ~Take care of yourself.~ */ 
		IF ~~ THEN DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~Global("#L_JaheriaModded","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) Global("#L_JaheiraPK","GLOBAL",1)~ THEN BEGIN POST_KORLASZ_GOODBYE2
		// We've already done the 'I'm eager' spiel
		// She's being let go from group after initially being asked to stay
		SAY @2328 /* ~Take care of yourself.~ */ 
		IF ~~ THEN DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END
END
