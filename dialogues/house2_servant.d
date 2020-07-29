/////////////////////////////////////////////////////////////
// House servant welcomes PC to their new home in Beregost //
// Compiled via eltan_house2.tpa                           //
/////////////////////////////////////////////////////////////
APPEND ~#LDPSrv1~
	IF ~AreaCheck("#LBG3347")~ THEN pc_house2_servant
		SAY @2091 /* ~Welcome to your new home, <PRO_SIRMAAM>.~ */
		= @2092	/* ~It can serve as your residence for as long as you own the key.~ */
		= @2093 /* ~The chest here is for your personal use.  It is quite secure.~ */
		= @2064	/* ~Please help yourself to whatever is already inside.~ */
		= @2063 /* ~M'<PROPER_LORDLADY>, it has been an honor to serve the Hero of Baldur's Gate.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ServantSpawned","MYAREA",2) EscapeArea()~ EXIT
	END
END