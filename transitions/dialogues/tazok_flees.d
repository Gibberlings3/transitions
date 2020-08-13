//////////////////////////////////////////////////////////////////////////////////
// Additions to Tazok's dialogue file where he runs away like a little girl LOL //
// This is to clear the way for additional bounty type quests                   //
// Compiled via survivors_flee.tpa                                              //
//////////////////////////////////////////////////////////////////////////////////
APPEND TAZOK2
	IF ~AreaCheck("BG0125") Global("#L_TazokHasFled","MYAREA",0) !Dead("Tazok") Dead("Sarevok")~ THEN BEGIN Tazok_oh_no
		SAY @2013 // [HOBGL05] // ~Noooo!  Retreat!  Retreat!~
		IF ~~ DO ~SetGlobal("#L_TazokHasFled","MYAREA",1) ActionOverride("Tazok",EscapeAreaDestroy(0))~ EXIT
	END
END