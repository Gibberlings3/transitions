/////////////////////////////////////////////////
// New dialogue file for Angelo's quest        //
// Compiled and attached via quests_common.tpa //
/////////////////////////////////////////////////
APPEND ~GALDOR~
	IF ~AreaCheck("BG0224")~ THEN BEGIN Angelo_Quest1
		SAY @2189 // ~You again!  Will you never just go away!~
		++ @2190 /* ~Not in your lifetime!~ */ + Angelo_Quest2a 
		++ @2191 /* ~Come along peacefully and you may live.~ */ + Angelo_Quest2b
	END

	IF ~~ THEN BEGIN Angelo_Quest2a
		SAY @2192 // ~We'll see about that.  Attack!~
		IF ~~ THEN DO ~ActionOverride("GALDOR",Enemy())~  EXIT
	END

	IF ~~ THEN BEGIN Angelo_Quest2b
		SAY @2205 /* ~Never!~ */
		IF ~~ THEN DO ~ActionOverride("GALDOR",Enemy())~  EXIT
	END
	
	IF ~!AreaCheck("BG0125") !AreaCheck("BG0224")~ THEN BEGIN Angelo_Default
		SAY @2187 // ~Get away from me.  I have nothing to say to you.~
		IF ~~ THEN EXIT
	END
END
