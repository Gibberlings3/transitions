/////////////////////////////////////////////////
// New dialogue file for Angelo's quest        //
// Compiled and attached via quests_common.tpa //
/////////////////////////////////////////////////
APPEND ~SEMAJ~
	IF ~AreaCheck("%BaldursGate_Undercellars%")~ THEN BEGIN Semaj_Quest1
		SAY @2206 /* ~You! What do you want now?!~ */
		++ @2191 /* ~Come along peacefully and you may live.~ */ + Semaj_Quest2
	END

	IF ~~ THEN BEGIN Semaj_Quest2
		SAY @2207 /* ~Ha!  I have a better idea!~ */
		IF ~~ THEN DO ~ActionOverride("Semaj",Enemy())~  EXIT
	END

	IF ~!AreaCheck("%Undercity_TempleofBhaal%") !AreaCheck("%BaldursGate_Undercellars%")~ THEN BEGIN Semaj_Default
		SAY @2187 // ~Get away from me.  I have nothing to say to you.~
		IF ~~ THEN DO ~ActionOverride("Semaj",Enemy())~  EXIT
	END
END
