/////////////////////////////////////////////////
// New dialogue file for Tazok's quest        //
// Compiled and attached via quests_common.tpa //
/////////////////////////////////////////////////
APPEND ~TAZOK2~
	IF ~AreaCheck("BG0226")~ THEN BEGIN Tazok_Quest1
		SAY @2202 /* ~You! Again! This time you die, <PRO_RACE>!~ */
		++ @2203 /* ~Well, one of us will at any rate.~ */ + Tazok_Quest2a 
		++ @2191 /* ~Come along peacefully and you may live.~ */ + Tazok_Quest2b
	END

	IF ~~ THEN BEGIN Tazok_Quest2a
		SAY @2204 /* ~Attack!~ */
		IF ~~ THEN DO ~ActionOverride("Tazok",Enemy())~  EXIT
	END

	IF ~~ THEN BEGIN Tazok_Quest2b
		SAY @2205 /* ~Never~ */
		IF ~~ THEN DO ~ActionOverride("Tazok",Enemy())~  EXIT
	END
	
	IF ~!AreaCheck("BG0125") !AreaCheck("BG0226")~ THEN BEGIN Tazok_Default
		SAY @2187 // ~Get away from me.  I have nothing to say to you.~
		IF ~~ THEN EXIT
	END
END
