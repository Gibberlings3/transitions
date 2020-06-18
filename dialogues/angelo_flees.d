////////////////////////////////////////////////////////////////////////////////////////
// Addition to new dialogue file for Angelo where he runs away like a little girl LOL //
// This is to clear the way for additional bounty type quests                         //
// Compiled and attached via survivors_flee.tpa                                       //
////////////////////////////////////////////////////////////////////////////////////////
APPEND ~GALDOR~
	IF ~AreaCheck("BG0125") Global("#L_AngeloHasFled","MYAREA",0) !Dead("GALDOR") Dead("Sarevok")~ THEN BEGIN Angelo_flee
		SAY @2011 // ~<PROPER_HESHE> is too strong for us!  Run for your lives!~
		IF ~~ DO ~SetGlobal("#L_AngeloHasFled","MYAREA",1) ActionOverride("GALDOR",CreateVisualEffectObject("SPDIMNDR",Myself)) ActionOverride("GALDOR",DestroySelf())~ EXIT
	END
END
