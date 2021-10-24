///////////////////////////////////////////////////
// House servant welcomes PC to their stronghold //
// Compiled via main_eet.tpa                     //
///////////////////////////////////////////////////
APPEND ~#LDPSrv1~
	// Bard, Fighter, Thief, Ranger, Mage, Clerics
	IF ~OR(2) AreaCheck("AR0523") AreaCheck("AR1306") AreaCheck("AR0322") AreaCheck("AR1107") AreaCheck("AR0411") AreaCheck("AR0902") AreaCheck("AR0901") AreaCheck("AR0904")~ THEN stronghold
		SAY @2580 /* ~Excuse me, <PRO_SIRMAAM>. The Dukes of Baldurs Gate send their greetings and best wishes as well the chest here containing your possessions.~ */
		IF ~GlobalLT("bd_plot","GLOBAL",586)~ GOTO hero_bg
		IF ~!GlobalLT("bd_plot","GLOBAL",586)~ GOTO hero_sc
	END

	IF ~AreaCheck("AR0903")~ THEN paladin
		SAY @2582 // ~Excuse me, <PRO_SIRMAAM>. The Dukes of Baldurs Gate send their greetings and best wishes as well the chest containing your possessions.~
		= @2583	// ~You'll find the chest in the store room off the kitchen.~
		IF ~GlobalLT("bd_plot","GLOBAL",586)~ GOTO hero_bg
		IF ~!GlobalLT("bd_plot","GLOBAL",586)~ GOTO hero_sc
	END

	IF ~AreaCheck("AR1900")~ THEN druid
		SAY @2582 // ~Excuse me, <PRO_SIRMAAM>. The Dukes of Baldurs Gate send their greetings and best wishes as well the chest containing your possessions.~
		= @2584	// ~You'll find the chest inside this storehouse.~
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


