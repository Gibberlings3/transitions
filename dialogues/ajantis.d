/////////////////////////////////////////////////////////////////////////
// Dialogues for Ajantis to allow for him to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////

// ToDo: Give him a split of the gold but destroy most of it immediately
// 		in case he's in SoD or BG2 because he wouldn't carry much with him

APPEND_EARLY AJANTJ
	IF WEIGHT #-999 ~GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_AjanPK","GLOBAL",2) !AreaType(DUNGEON) CombatCounter(0)~ THEN BEGIN POST_KORLASZ_ASK
		SAY @2278 /* ~I am eager to present our accomplishments before my superiors, but I will stay if you need me.~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ + POST_KORLASZ_STAY
		+ ~Global("#L_LetsHaveFun","GLOBAL",1)~ + @2280 /* ~Please let me treat you to a little fun before you go.  Will a day or two make that much difference?~ */  + POST_KORLASZ_STAY
		++ @2281 /* ~Of course you may leave, but not with that armor.~ */  + POST_KORLASZ_STAY
		++ @2282 /* ~I understand.  You are eager for your knighthood.  Best of luck to you on your journey.~ */ + POST_KORLASZ_LEAVE
	END

	IF ~~ THEN BEGIN POST_KORLASZ_STAY
		SAY @2283 /* ~As you wish.  I owe you that at least.~ */
		IF ~~ THEN DO ~SetGlobal("#L_AjanPK","GLOBAL",2)~ EXIT
	END

	IF ~~ THEN BEGIN POST_KORLASZ_LEAVE
		SAY @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#L_AjanPK","GLOBAL",3) LeaveParty() EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~Global("#LAjanSoD","GLOBAL",0) Global("EndOfBG1","GLOBAL",1) GlobalGT("#L_StartCaelarAttack","GLOBAL",0)~ THEN BEGIN PRE_SOD_WARNING
		SAY @2323 /* ~I will be leaving in a minute to report to my superiors.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		IF ~~ THEN DO ~SetGlobalTimer("#LAjanSoD","GLOBAL",ONE_MINUTE)~ EXIT
	END

	IF WEIGHT #-997 ~GlobalGT("#LAjanSoD","GLOBAL",0) GlobalTimerExpired("#LAjanSoD","GLOBAL") Global("#LAjanSodLeft","GLOBAL",0)~ THEN BEGIN PRE_SOD_LEAVE
		SAY @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#LAjanSodLeft","GLOBAL",1) LeaveParty() EscapeArea()~ EXIT
	END
END

APPEND_EARLY AJANTP
	IF WEIGHT #-999 ~GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) GlobalGT("#L_AjanPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_FINALLY
		// We've already done the 'I'm eager' spiel
		SAY @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#L_AjanPK","GLOBAL",3) EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~GlobalLT("EndOfBG1","GLOBAL",1) Global("#l_SarvQuests","GLOBAL",99) Global("#L_AjanPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_GOODBYE
		SAY @2316 /* ~I am eager to present our accomplishments before my superiors.  Thank you for all you've done.~ */
		= @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#L_AjanPK","GLOBAL",3) EscapeArea()~ EXIT
	END

	IF WEIGHT #-997 ~GlobalGT("EndOfBG1","GLOBAL",0) GlobalGT("#LAjanSoD","GLOBAL",0) Global("#LAjanSodLeft","GLOBAL",0)~ THEN BEGIN IN_SOD_TIME_TO_GO
		SAY @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#LAjanSodLeft","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-996 ~GlobalGT("EndOfBG1","GLOBAL",0) Global("#LAjanSodLeft","GLOBAL",0)~ THEN BEGIN IN_SOD_TIME_TO_GO
		SAY @2325 /* ~Excuse me, I must leave.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#LAjanSodLeft","GLOBAL",1) EscapeArea()~ EXIT
	END
END
