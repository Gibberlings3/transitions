/////////////////////////////////////////////////////////////////////////
// Dialogues for Ajantis to allow for him to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////

// ToDo: Give him a split of the gold but destroy most of it immediately
// 		in case he's in SoD or BG2 because he wouldn't carry much with him

APPEND_EARLY AJANTJ
	IF WEIGHT #-999 ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_AjanPK","GLOBAL",2) !AreaType(DUNGEON) CombatCounter(0)~ THEN BEGIN POST_KORLASZ_ASK
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
END

APPEND_EARLY AJANTP
	IF WEIGHT #-999 ~Global("#L_StartCaelarAttack","GLOBAL",0) Global("#L_StartBG2","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_AjanPK","GLOBAL",3)~ THEN BEGIN POST_KORLASZ_GOODBYE
		SAY @2316 /* ~I am eager to present our accomplishments before my superiors.  Thank you for all you've done.~ */
		= @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN DO ~SetGlobal("#L_AjanPK","GLOBAL",3) EscapeArea()~ EXIT
	END
END
