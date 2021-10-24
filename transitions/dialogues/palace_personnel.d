////////////////////////////////////////////////////////
// Give ducal palace personell some new things to say //
// Modified version of jastey's Endless BG1 mod       //
// Compiled via main_bg1.tpa                          //
////////////////////////////////////////////////////////

// Give the new palace gate guards some random things to say
BEGIN ~#LDPGrd1~
	IF ~Dead("Sarevok") Global("#L_TalkedToDukes","GLOBAL",0)~ THEN gateguard_00
		SAY @2027 /* ~Go right in, <SIRMAAM>. The Dukes wish to speak to you.~ */
		IF ~~ THEN EXIT
	END

	IF ~Dead("Sarevok") GlobalGT("#L_TalkedToDukes","GLOBAL",0) RandomNum(5,1)~ THEN gateguard_01
		SAY @2028 /* ~Go right in, <SIRMAAM>.~ */ 
		IF ~~ THEN EXIT
	END

	IF ~Dead("Sarevok") GlobalGT("#L_TalkedToDukes","GLOBAL",0) RandomNum(5,2)~ THEN gateguard_02
		SAY @2029 /* ~It's a pleasure to see you again, <SIRMAAM>~ */
		IF ~~ THEN EXIT
	END

	IF ~Dead("Sarevok") GlobalGT("#L_TalkedToDukes","GLOBAL",0) RandomNum(5,3)~ THEN gateguard_03
		SAY @2030 /* ~Pleasant <DAYNIGHTALL> to you, <SIRMAAM>.~ */
		IF ~~ THEN EXIT
	END

	IF ~Dead("Sarevok") GlobalGT("#L_TalkedToDukes","GLOBAL",0) RandomNum(5,4)~ THEN gateguard_04
		SAY @2031 /* ~The Dukes will be most pleased to see you again, <SIRMAAM>.~ */
		IF ~~ THEN EXIT
	END

	IF ~Dead("Sarevok") GlobalGT("#L_TalkedToDukes","GLOBAL",0) RandomNum(5,5)~ THEN gateguard_05
		SAY @2032 /* ~You are welcome to walk right in, <SIRMAAM>.~ */ 
		IF ~~ THEN EXIT
	END

	IF WEIGHT #-1 ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN gateguard_06
		SAY @2033 /* ~I think <CHARNAME> is cute.~ */
  		IF ~~ THEN EXIT
	END
// END OF NEW DIALOGUE FILE
// WHY AN 'END' STATEMENT ISN'T NEEDED HERE IS BEYOND ME

// Guards in palace cellar
APPEND FLAM7
	IF WEIGHT #-1 ~OR(2) Dead("Sarevok") Global("C#st_HeroOfBG","GLOBAL",1)~ THEN cellar_guard1
		SAY @2058 /* ~Greetings, <SIRMAAM>. Please leave the cellar, you should not be here.~ */
		IF ~~ THEN EXIT
	END
END

// Guard in office in palace cellar
APPEND FLAM9
	IF WEIGHT #-1 ~OR(2) Dead("Sarevok") Global("C#st_HeroOfBG","GLOBAL",1)~ THEN cellar_guard2
		SAY @2058 /* ~Greetings, <SIRMAAM>. Please leave the cellar, you should not be here.~ */
		IF ~~ THEN EXIT
	END
END

// Guards on palace ground floor */
APPEND FLAM10
	IF WEIGHT #-1 ~Dead("Sarevok")~ THEN palace_guard_1
		SAY @2059 /* ~Greetings, <SIRMAAM>.~ */
		IF ~~ THEN EXIT
	END
END

// Guards on the third floor
APPEND FLAM11
	IF WEIGHT #-1 ~Dead("Sarevok")~ THEN palace_guard_3
		SAY @2059 /* ~Greetings, <SIRMAAM>.~ */
		IF ~~ THEN EXIT
	END
END

// Servant in PC's places of residence
BEGIN ~#LDPSrv1~
	IF ~OR(2) AreaCheck("#LBD0103") AreaCheck("BD0103")~ THEN pc_room_servant
		SAY @2060 /* ~Welcome, <PRO_SIRMAAM>.~ */
		= @2061 /* ~These rooms can serve as your residence whenever you are in the city.~ */
		= @2062 /* ~The chest on the far left of the room is for your personal use.  It is quite secure.~ */
		= @2064	/* ~Please help yourself to whatever is already inside.~ */
		= @2063 /* ~M'<PROPER_LORDLADY>, it has been an honor to serve the Hero of Baldur's Gate.~ */
		IF ~~ THEN DO ~EscapeArea()~ EXIT
	END
// END OF NEW DIALOGUE FILE

// Palace treasurer (Ophyllis)
BEGIN ~#LOPHYLL~
	IF ~True()~ BEGIN Default_greeting
		SAY @2520 // ~Greetings, <SIRMAAM>. I'm afraid I'm busy taking inventory and cannot be interrupted.  Good <DAYNIGHTALL> to you.~
		IF ~~ THEN EXIT
	END
// END OF NEW DIALOGUE FILE
	
// Palace physician (Fenster)
BEGIN ~#LFENSTE~
	IF ~NumberOfTimesTalkedTo(0)~ BEGIN Initial_greeting
		SAY @2521 // ~Greetings, <SIRMAAM>. I am Fenster, the palace physician.~
		= @2525 // ~For residents of the palace, I offer my services at reduced rates.~
		IF ~~ GOTO Default_greeting
	END
	
	IF ~True()~ BEGIN Default_greeting
		SAY @2522 // ~How may I be of service?~
		IF ~Global("#L_AcceptedRoom","GLOBAL",0)~ THEN REPLY @2523 /* ~What services do you offer?~ */ DO ~StartStore("#LFenst1",LastTalkedToBy(Myself))~ EXIT
		IF ~!Global("#L_AcceptedRoom","GLOBAL",0)~ THEN REPLY @2523 /* ~What services do you offer?~ */ DO ~StartStore("#LFenst2",LastTalkedToBy(Myself))~ EXIT
		IF ~~ THEN REPLY @2524 /* ~I don't need anything at the moment.~ */ EXIT
	END
// END OF NEW DIALOGUE FILE
