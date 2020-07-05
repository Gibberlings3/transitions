/////////////////////////////////////////////////////////////////////////
// Dialogues for Khalid to allow for him to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////

// ToDo: Give him a split of the gold but destroy most of it immediately
// 		in case he's in SoD or BG2 because he wouldn't carry much with him

CHAIN
	IF WEIGHT #-999 ~Global("#L_KhalidModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_NPCPK","GLOBAL",2) !AreaType(DUNGEON) CombatCounter(0)~ THEN KHALIJ POST_KORLASZ_ASK
		@2336 /* ~<CHARNAME>, you are s-safe now and I have p-places I should be, but I will s-stay if you have need of me.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2338 /* ~Yes, *we* should go.~ */ 
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2326 /* ~I too have other places to be.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2340	/* ~Me as well.~ */
	END
	+ ~!Global("#L_LetsHaveFun","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ + POST_KORLASZ_STAY
	+ ~Global("#L_LetsHaveFun","GLOBAL",1)~ + @2280 /* ~Please let me treat you to a little fun before you go.  Will a day or two make that much difference?~ */  + POST_KORLASZ_STAY
	++ @2281 /* ~Of course you may leave, but not with that equipment.~ */  + POST_KORLASZ_STAY
	++ @2282 /* ~I understand.  Now is as good a time as any to say our farewells.~ */ + POST_KORLASZ_LEAVE

CHAIN
	IF ~~ THEN KHALIJ POST_KORLASZ_STAY
		@2333 /* ~If you insist.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2327 /* ~So be it.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2283 /* ~As you wish.  I owe you that at least.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2341	/* ~I can stay for a little while.~ */
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",2)~ EXIT

CHAIN
	IF ~~ THEN KHALIJ POST_KORLASZ_LEAVE
		@2334 /* ~Goodbye.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("Khalid",LeaveParty()) ActionOverride("Khalid",EscapeArea())~ EXIT

CHAIN
	IF WEIGHT #-998 ~Global("#L_KhalidModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) GlobalGT("EndOfBG1","GLOBAL",0)~ THEN KHALIJ PRE_SOD_WARNING
		@2337 /* ~Now <CHARNAME>, I really m-must insist.  I c-cannot stay any longer.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_KhalidModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN KHALIJ PRE_SOD_LEAVE
		@2334 /* ~Goodbye.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("Khalid",LeaveParty()) ActionOverride("Khalid",EscapeArea())~ EXIT


APPEND_EARLY KHALIP
	IF WEIGHT #-999 ~Global("#L_KhalidModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalGT("#L_NPCPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_FINALLY
		// We've already done the 'I'm eager' spiel
		SAY @2334 /* ~Goodbye.~ */
		IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~Global("#L_KhalidModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) Global("#L_NPCPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_GOODBYE
		SAY @2334 /* ~Goodbye.~ */
		IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-997 ~Global("#L_KhalidModded","GLOBAL",0) GlobalGT("EndOfBG1","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN BEGIN IN_SOD_TIME_TO_GO
		SAY @2334 /* ~Goodbye.~ */
		IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END
END
