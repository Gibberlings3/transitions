///////////////////////////////////////////////////////////////////////////////////////
// Denkod in Thieves Guild after Sarevok is defeated where he explains what happened //
// to the wounded that disappeared from the thieves' maze                            //
// Modified version of what jastey uses in her Endless BG1 mod                       //
// Patched in cleanup_maze.tpa                                                       //
///////////////////////////////////////////////////////////////////////////////////////

// Replace trigger in dialogue file so the initial dialogue doesn't play twice
REPLACE_STATE_TRIGGER DENKOD 0 ~!Dead("Sarevok")~ 

APPEND DENKOD
	IF ~Global("#L_DenkodTalk","MYAREA",1)
		OR(24)
			HasItemEquiped("#LSrvArm",Player1)
			HasItemEquiped("#LSrvHlm",Player1)
			HasItemEquiped("c#stsrva",Player1)
			HasItemEquiped("c#stsrvh",Player1)
			HasItemEquiped("#LSrvArm",Player2)
			HasItemEquiped("#LSrvHlm",Player2)
			HasItemEquiped("c#stsrva",Player2)
			HasItemEquiped("c#stsrvh",Player2)
			HasItemEquiped("#LSrvArm",Player3)
			HasItemEquiped("#LSrvHlm",Player3)
			HasItemEquiped("c#stsrva",Player3)
			HasItemEquiped("c#stsrvh",Player3)
			HasItemEquiped("#LSrvArm",Player4)
			HasItemEquiped("#LSrvHlm",Player4)
			HasItemEquiped("c#stsrva",Player4)
			HasItemEquiped("c#stsrvh",Player4)
			HasItemEquiped("#LSrvArm",Player5)
			HasItemEquiped("#LSrvHlm",Player5)
			HasItemEquiped("c#stsrva",Player5)
			HasItemEquiped("c#stsrvh",Player5)
			HasItemEquiped("#LSrvArm",Player6)
			HasItemEquiped("#LSrvHlm",Player6)
			HasItemEquiped("c#stsrva",Player6)
			HasItemEquiped("c#stsrvh",Player6)~
	THEN BEGIN L_DENKODTALK1
		SAY @2014 /* ~Aaarg!~ [TUTHH04] */
		++ @2015 /* ~Calm down, we won't hurt you.~ */ + L_WARNARMOR
		++ @2016 /* ~BOO!~ */ + L_WARNARMOR
	END

	IF ~Global("#L_DenkodTalk","MYAREA",1)~
	THEN BEGIN L_DENKODTALK2
		SAY @2017 /*~Oh!  It's you again!~  */
		IF ~~ THEN + L_EXPLAINBODIES
	END

	IF ~~ THEN BEGIN L_EXPLAINBODIES
		SAY @2023 /* ~Are you the last?  Is this over?  The Fist were here in droves, hauling up the dead and wounded.~ */
		= @2024 /* ~My nerves can't handle this. I'm gonna find a nice quiet place to lay low.  Way too much traffic here for my taste!~ */
		IF ~~ THEN DO ~SetGlobal("#L_DenkodTalk","MYAREA",2) ActionOverride("DENKOD",EscapeArea())~ EXIT
	END

END

CHAIN
	IF ~~ THEN DENKOD L_WARNARMOR
		@2017 /*~Oh!  It's you again!~  */
		= @2018 /* ~I have to say, be careful with wearin' that. For a second I thought you were him! Was 'bout ta go to my dagger, I was.~ */
		== %GARRICK_JOINED% IF ~IsValidForPartyDialogue("GARRICK")~ THEN @2020 /* ~Of course you were.~ */
		== %DORN_JOINED% IF ~IsValidForPartyDialogue("DORN")~ THEN @2019 /* ~Hah!~ */
		== %NEERA_JOINED% IF ~IsValidForPartyDialogue("NEERA") !IsValidForPartyDialogue("DORN")~ THEN @2019 /* ~Hah!~ */
		== %JAHEIRA_JOINED% IF ~IsValidForPartyDialogue("JAHEIRA")~ THEN @2021 /* ~We could tell our lives were in imminent danger.~ */
		== %MINSC_JOINED% IF ~PartyHasItem("MISC84")~ THEN #326865 /* ~Boo: "Squeak!"~ */ 
		== %MINSC_JOINED% IF ~PartyHasItem("MISC84") IsValidForPartyDialogue("MINSC")~ THEN @2025 /* ~Boo!  It's not nice to laugh at the frightened little man...although it is pretty funny!~ */
		== %DYNAHEIR_JOINED% IF ~PartyHasItem("MISC84") IsValidForPartyDialogue("MINSC") IsValidForPartyDialogue("DYNAHEIR")~ THEN @2026 /* ~For once I agree with thine rodent.~ */
//		== DENKOD IF ~True()~ THEN @2018 /* ~I have to say, be careful with wearin' that. For a second I thought you were him! Was 'bout ta go to my dagger, I was.~ */
	END
	+ ~!IsValidForPartyDialogue("DORN") !IsValidForPartyDialogue("NEERA")~ + @2019 /* ~Hah!~ */ + L_EXPLAINBODIES    
	+ ~!IsValidForPartyDialogue ("GARRICK")~ + @2020 /* ~Of course you were.~ */ + L_EXPLAINBODIES     
	+ ~!IsValidForPartyDialogue("JAHEIRA")~ + @2021 /* ~We could tell our lives were in imminent danger.~ */ + L_EXPLAINBODIES
	++ @2022 /* ~Warning noted.~ */ + L_EXPLAINBODIES
// END OF CHAIN
