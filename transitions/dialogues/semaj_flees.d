////////////////////////////////////////////////////////////////////////////
// New dialogue file for Semaj where he runs away like a little girl LOL  //
// This is to clear the way for additional bounty type quests             //
// Compiled and attached via survivors_flee.tpa                           //
////////////////////////////////////////////////////////////////////////////
APPEND ~SEMAJ~
	IF ~Global("#L_SemajHasFled","MYAREA",0) !Dead("SEMAJ") Dead("Sarevok")~ THEN BEGIN Semaj_flee
		SAY @2012 // ~Sarevok has been defeated?!  This cannot be!  Flee while you can!~
		IF ~~ DO ~SetGlobal("#L_SemajHasFled","MYAREA",1) ActionOverride("SEMAJ",CreateVisualEffectObject("SPDIMNDR",Myself)) ActionOverride("SEMAJ",DestroySelf())~ EXIT
	END
END
