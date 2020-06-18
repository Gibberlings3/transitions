////////////////////////////////////////////////////////
// Updates to Tamoko's dialogue for her harsher quest //
// Compiled via tamoko.tpa                            //
////////////////////////////////////////////////////////
APPEND TAMOKO
	IF ~AreaCheck("BG1200") Global("#L_SarvQuests","GLOBAL",6)~ THEN BEGIN Tamoko_Die
		SAY @2236 /* ~I'm sorry <CHARNAME>.  I will follow Sarevok, but my blood will not be on your hands.~ */
		++ @2237 /* ~No!  Don't do this!~ */ + Tamoko_Die2
	END

	IF ~~ THEN BEGIN Tamoko_Die2
		SAY @2238 /* ~It is done...~ */
		IF ~~ THEN DO ~Kill("Tamoko")~ EXIT
	END
END

