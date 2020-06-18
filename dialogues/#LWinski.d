/////////////////////////////////////////////////
// New dialogue file for Winski's quest        //
// Compiled and attached via quests_common.tpa //
/////////////////////////////////////////////////
BEGIN ~#LWinski~
	IF ~AreaCheck("BG0224")~ THEN BEGIN Winski_Quest1
		SAY @2208 /* ~Oh, the merciful one isn't so merciful after all!~ */
		++ @2191 /* ~Come along peacefully and you may live.~ */ + Winski_Quest2
	END

	IF ~~ THEN BEGIN Winski_Quest2
		SAY @2209 /* ~Rot away in some jail cell?!  I think not!~ */
		IF ~~ THEN EXIT
	END

	IF ~!AreaCheck("BG0224")~ THEN BEGIN Winski_Default
		SAY @2187 // ~Get away from me.  I have nothing to say to you.~
		IF ~~ THEN EXIT
	END
