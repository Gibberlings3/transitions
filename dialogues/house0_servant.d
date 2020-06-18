///////////////////////////////////////////////////////
// House servant welcomes PC to their new home       //
// in front of the Ducal Palace and informs them     //
// where Rinnie went, if they've ever met her before // 
// Compiled via eltan.tpa                            //
///////////////////////////////////////////////////////
APPEND ~#LDPSrv1~
	IF ~AreaCheck("#LBG0006")~ THEN pc_house0_servant
		SAY @2091 /* ~Welcome to your new home, <PRO_SIRMAAM>.~ */
		= @2092	/* ~It can serve as your residence for as long as you own the key.~ */
		IF ~~ + RINNIE_NEXTDOOR
		IF ~Global("#L_RinnieGlobified","GLOBAL",0)~ + RINNIE_GONE
	END

	IF ~~ THEN BEGIN RINNIE_NEXTDOOR
		SAY @2095 /* ~The previous resident has moved next door, in case you are interested in visiting her.~ */
		= @2093 /* ~The chest here is for your personal use.  It is quite secure.~ */
		= @2064	/* ~Please help yourself to whatever is already inside.~ */
		= @2063 /* ~M'<PROPER_LORDLADY>, it has been an honor to serve the Hero of Baldur's Gate.~ */
		IF ~~ THEN DO ~EscapeArea()~ EXIT
	END

	IF ~~ THEN BEGIN RINNIE_GONE
		SAY @2094 /* ~The previous occupants of the house have moved on.  I'm afraid I don't know to where. */
		= @2093 /* ~The chest here is for your personal use.  It is quite secure.~ */
		= @2064	/* ~Please help yourself to whatever is already inside.~ */
		= @2063 /* ~M'<PROPER_LORDLADY>, it has been an honor to serve the Hero of Baldur's Gate.~ */
		IF ~~ THEN DO ~EscapeArea()~ EXIT
	END
END