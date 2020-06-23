/////////////////////////////////////////////////////////////////////////
// Dialogues for Ajantis to allow for him to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////
APPEND_EARLY AJANTJ
	IF WEIGHT #0 ~Global("#L_SarvQuests","GLOBAL",99) Global("#L_StayingAfterKorlasz","LOCALS",1)~ THEN BEGIN KORLASZ_EXIT_STAY
		SAY @2283 /* ~As you wish.  I owe you that at least.~ */
		IF ~~ THEN EXIT
	END

	IF WEIGHT #0 ~Global("#L_SarvQuests","GLOBAL",99) Global("#L_LeavingAfterKorlasz","LOCALS",1)~ THEN BEGIN KORLASZ_EXIT_LEAVE
		SAY @2284 /* ~It has been an honor.  Farewell.~ */
		IF ~~ THEN EXIT
	END

	IF WEIGHT #0 ~Global("#l_SarvQuests","GLOBAL",99) Global("#L_PlayersChoiceAfterKorlasz","LOCALS",1)~ THEN BEGIN KORLASZ_EXIT_ASK
		SAY @2278 /* ~I am eager to present our accomplishments before my superiors, but I will stay if you need me.~ */
		+ ~!Global("#L_LetsHaveFun","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ DO ~SetGlobal("#L_StayingAfterKorlasz","LOCALS",1)~ EXIT
		+ ~Global("#L_LetsHaveFun","GLOBAL",1)~ + @2280 /* ~Please let me treat you to a little fun before you go.  Will a day or two make that much difference?~ */ DO ~SetGlobal("#L_StayingAfterKorlasz","LOCALS",1)~ EXIT
		++ @2281 /* ~Of course you may leave, but not with that armor.~ */ DO ~SetGlobal("#L_StayingAfterKorlasz","LOCALS",1)~ EXIT		
		++ @2282 /* ~I understand.  You are eager for your knighthood.  Best of luck to you on your journey.~ */ DO ~SetGlobal("#L_LeavingAfterKorlasz","LOCALS",1)~ EXIT
	END
END
