/////////////////////////////////////////////////////////////////////////
// Dialogues for Jaheira to allow for her to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////

// ToDo: Give her a split of the gold but destroy most of it immediately
// 		in case he's in SoD or BG2 because she wouldn't carry much with her

CHAIN
	IF WEIGHT #-999 ~Global("#L_JaheriaModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_NPCPK","GLOBAL",2) !AreaType(DUNGEON) CombatCounter(0)~ THEN JAHEIJ POST_KORLASZ_ASK
		@2330 /* ~<CHARNAME>, you are safe now and I have places I should be, but I will stay if you have need of me.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2338	/* ~Yes, *we* should go.~ */ 
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2326 /* ~I too have other places to be.~ */
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
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",2)~ EXIT

CHAIN
	IF ~~ THEN JAHEIJ POST_KORLASZ_LEAVE
		@2328 /* ~Take care of yourself.~ */ 	
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("Jaheira",LeaveParty()) ActionOverride("Jaheira",EscapeArea())~ EXIT

CHAIN
	IF WEIGHT #-998 ~Global("#L_JaheriaModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) GlobalGT("EndOfBG1","GLOBAL",0)~ THEN JAHEIJ PRE_SOD_WARNING
		@2331 /* ~No more arguments, I will be leaving in just a few moments.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_JaheriaModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN JAHEIJ PRE_SOD_LEAVE
		@2328 /* ~Take care of yourself.~ */ 
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("Jaheira",LeaveParty()) ActionOverride("Jaheira",EscapeArea())~ EXIT	


APPEND_EARLY JAHEIJ
	IF WEIGHT #-999 ~Global("#L_JaheriaModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalGT("#L_NPCPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_FINALLY
		SAY @2328 /* ~Take care of yourself.~ */ 
		IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~Global("#L_JaheriaModded","GLOBAL",0) GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) Global("#L_NPCPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_GOODBYE
		SAY @2328 /* ~Take care of yourself.~ */ 
		IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-997 ~Global("#L_JaheriaModded","GLOBAL",0) GlobalGT("EndOfBG1","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN BEGIN IN_SOD_TIME_TO_GO
		SAY @2328 /* ~Take care of yourself.~ */ 
		IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END
END
