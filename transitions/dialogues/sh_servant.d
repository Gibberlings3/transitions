///////////////////////////////////////////////////
// House servant welcomes PC to their stronghold //
// Compiled via main_eet.tpa                     //
///////////////////////////////////////////////////
APPEND ~#LDPSrv1~
	IF ~AreaCheck("AR0523")~ THEN stronghold
		SAY @2580 /* ~Excuse me, <PRO_SIRMAAM>. The Dukes of Baldurs Gate send their greetings and best wishes as well the chest here containing your possessions.~ */
		IF ~GlobalLT("bd_plot","GLOBAL",586)~ GOTO hero_bg
		IF ~!GlobalLT("bd_plot","GLOBAL",586)~ GOTO hero_sc
	END

	IF ~~ THEN hero_bg
		SAY @2063 /* ~M'<PROPER_LORDLADY>, it has been an honor to serve the Hero of Baldur's Gate.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ServantSpawned","MYAREA",2) EscapeArea()~ EXIT
	END

	IF ~~ THEN hero_sc
		SAY @2581 /* ~M'<PROPER_LORDLADY>, it has been an real honor to serve the Hero of the Sword Coast.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ServantSpawned","MYAREA",2) EscapeArea()~ EXIT
	END
END