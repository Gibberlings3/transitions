//////////////////////////////////
// Generic group dialogues      //
// Compiled via main_common.tpa //
//////////////////////////////////

BEGIN ~#LGroup~
	IF ~Global("#L_Dream1Talk","GLOBAL",1) GlobalTimerExpired("#L_Dream1TalkTimer","GLOBAL")~ THEN BEGIN DREAM_TALK
		SAY	@2510 // ~*You notice your companion's concern and realize your own is written all over your face.*~
		++ @2511 /* ~*You smile as nonchallantly as you can muster, easing their tension and avoiding a discussion.*~ */ DO ~SetGlobal("#L_Dream1Talk","GLOBAL",2)~ EXIT
		++ @2512 /* ~*You smile, but it is grim instead of reassuring.*~ */ DO ~SetGlobal("#L_Dream1Talk","GLOBAL",2)~ GOTO DREAM_TALK_2
	END
	
	IF ~~ THEN BEGIN DREAM_TALK_2
		SAY @2513 // ~Sarevok is dead. Why are you still troubled, <CHARNAME>?~
		++ @2514 /* ~Alonzo's prophesies...how many more of Bhaal's spawn will need to be dealt with before this is truly over?~ */ EXIT
	END
