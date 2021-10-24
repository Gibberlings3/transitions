/////////////////////////////////////////////////////////////
// New ~#LPlayer~ dialogue in place of Player1             //
// Used during transitions between campaigns to split gold //
//   and allow NPCs to say their goodbyes                  //
// Put in a custom file so mods can modify it easier       //
// Compiled via main_sod.tpa                               //
/////////////////////////////////////////////////////////////

BEGIN ~#LPlayer~
	IF ~Global("#L_TransTalk","GLOBAL",0) OR(4) Global("#L_StartBG2","GLOBAL",1) Global("#L_StartCaelarAttack","GLOBAL",1) Global("#L_StartCaelarAttack","GLOBAL",2) Global("#L_StartCaelarAttack","GLOBAL",3)~ THEN BEGIN TransTalk_1
		SAY @2379 // ~I guess it's time we go our separate ways.~
		IF ~Global("#LNeedToShare","GLOBAL",1)~ THEN GOTO ShareGold
		IF ~Global("#LNeedToShare","GLOBAL",0) OR(3) Global("#L_StartCaelarAttack","GLOBAL",1) Global("#L_StartCaelarAttack","GLOBAL",2) Global("#L_StartCaelarAttack","GLOBAL",3)~ THEN GOTO BG1_To_SoD
		IF ~Global("#LNeedToShare","GLOBAL",0) GlobalLT("BD_Plot","GLOBAL",50) Global("#L_StartBG2","GLOBAL",1)~ THEN GOTO BG1_To_BG2
		IF ~Global("#LNeedToShare","GLOBAL",0) GlobalGT("BD_Plot","GLOBAL",40) Global("#L_StartBG2","GLOBAL",1)~ THEN GOTO SoD_To_BG2
	END
	
	IF ~~ THEN BEGIN ShareGold
		SAY @2378 // ~Before we do, take your share of the gold. You've earned it.~
		IF ~~ THEN DO ~SetGlobal("#L_TransTalk","GLOBAL",1) SetGlobal("#L_SoloExitTimer","GLOBAL",0) StartCutSceneEx("#LShare",TRUE)~	EXIT
	END
// END OF NEW DIALOGUE FILE

// BG1 => SoD
CHAIN
	IF ~Global("#L_TransTalk","GLOBAL",1) OR(3) Global("#L_StartCaelarAttack","GLOBAL",1) Global("#L_StartCaelarAttack","GLOBAL",2) Global("#L_StartCaelarAttack","GLOBAL",3)~ THEN ~#LPlayer~ BG1_To_SoD
		@2570 // ~Thank you for your help. I can finally relax a little.~
		== %JAHEIRA_JOINED%	IF ~IsValidForPartyDialogue("JAHEIRA") TriggerOverride("JAHEIRA",Global("#L_SayGoodbye","LOCALS",1))~ @2328 /* Take care of yourself. */ DO ~ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("JAHEIRA",EscapeArea())~
		== %KHALID_JOINED% IF ~IsValidForPartyDialogue("KHALID") TriggerOverride("KHALID",Global("#L_SayGoodbye","LOCALS",1))~ @2334 /* Goodbye.*/ DO ~ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("KHALID",EscapeArea())~
		== %DYNAHEIR_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) OR(2) !IsValidForPartyDialogue("MINSC") !TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2382 /* ~If you need us...*/ DO ~ActionOverride("DYNAHEIR",LeaveParty()) ActionOverride("DYNAHEIR",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("DYNAHEIR",EscapeArea())~
		== %MINSC_JOINED% IF ~IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1)) OR(2) !IsValidForPartyDialogue("DYNAHEIR") !TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1))~ @2377 /* If you need us...*/ DO ~ActionOverride("MINSC",LeaveParty()) ActionOverride("MINSC",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("MINSC",EscapeArea())~
		== %DYNAHEIR_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2382 // ~If you need us...
		== %MINSC_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2377 // If you need us...
		== %DYNAHEIR_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2384 // ~I just said that.~
		== %MINSC_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2385 // ~Oh, sorry, I didn't hear you.  I was talking to Boo.~
		== %MINSC_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2386 // ~He said to make sure to pick up some fresh pumpkin seeds.~
		== %DYNAHEIR_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2387 /* ~sigh~*/ DO ~ActionOverride("DYNAHEIR",LeaveParty()) ActionOverride("DYNAHEIR",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("DYNAHEIR",EscapeArea()) ActionOverride("MINSC",LeaveParty()) ActionOverride("MINSC",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("MINSC",EscapeArea())~
		== %AJANTIS_JOINED%	IF ~IsValidForPartyDialogue("AJANTIS") TriggerOverride("AJANTIS",Global("#L_SayGoodbye","LOCALS",1))~ @2284 /* It has been an honor.*/ DO ~ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("AJANTIS",EscapeArea())~
		== %ALORA_JOINED%	IF ~IsValidForPartyDialogue("ALORA") TriggerOverride("ALORA",Global("#L_SayGoodbye","LOCALS",1))~ @2391 /* See ya 'round!*/ DO ~ActionOverride("ALORA",LeaveParty()) ActionOverride("ALORA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("ALORA",EscapeArea())~
		== %BAELOTH_JOINED%	IF ~IsValidForPartyDialogue("BAELOTH") TriggerOverride("BAELOTH",Global("#L_SayGoodbye","LOCALS",1))~ @2362 /* Look for my name in lights*/ DO ~ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("BAELOTH",EscapeArea())~
		== %BRANWEN_JOINED%	IF ~IsValidForPartyDialogue("BRANWEN") TriggerOverride("BRANWEN",Global("#L_SayGoodbye","LOCALS",1))~ @2394 /* Tempus watch over you! */ DO ~ActionOverride("BRANWEN",LeaveParty()) ActionOverride("BRANWEN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("BRANWEN",EscapeArea())~
		== %CORAN_JOINED%	IF ~IsValidForPartyDialogue("CORAN") TriggerOverride("CORAN",Global("#L_SayGoodbye","LOCALS",1))~ @2397 /* ~Farewell my friend.~*/ DO ~ActionOverride("CORAN",LeaveParty()) ActionOverride("CORAN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("CORAN",EscapeArea())~
		== %DORN_JOINED%	IF ~IsValidForPartyDialogue("DORN") TriggerOverride("DORN",Global("#L_SayGoodbye","LOCALS",1))~ @2346 /* ~Until we meet again.~*/ DO ~ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("DORN",EscapeArea())~
		== %EDWIN_JOINED%	IF ~IsValidForPartyDialogue("EDWIN") TriggerOverride("EDWIN",Global("#L_SayGoodbye","LOCALS",1))~ @2353 /* ~I'm outta here!~*/ DO ~ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("EDWIN",EscapeArea())~
		== %ELDOTH_JOINED%	IF ~IsValidForPartyDialogue("ELDOTH") TriggerOverride("ELDOTH",Global("#L_SayGoodbye","LOCALS",1))~ @2400 /*Ta ta!*/ DO ~ActionOverride("ELDOTH",LeaveParty()) ActionOverride("ELDOTH",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("ELDOTH",EscapeArea())~
		== %FALDORN_JOINED%	IF ~IsValidForPartyDialogue("FALDORN") TriggerOverride("FALDORN",Global("#L_SayGoodbye","LOCALS",1))~ @2409 /*Oakfather watch over you.*/ DO ~ActionOverride("FALDORN",LeaveParty()) ActionOverride("FALDORN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("FALDORN",EscapeArea())~
		== %GARRICK_JOINED%	IF ~IsValidForPartyDialogue("GARRICK") TriggerOverride("GARRICK",Global("#L_SayGoodbye","LOCALS",1))~ @2368 /*Farewell...*/ DO ~ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("GARRICK",EscapeArea())~
		== %IMOEN_JOINED%	IF ~IsValidForPartyDialogue("%IMOEN_DV%") TriggerOverride("%IMOEN_DV%",Global("#L_SayGoodbye","LOCALS",1))~ @2325 /* Training */ DO ~ActionOverride("%IMOEN_DV%",LeaveParty()) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("%IMOEN_DV%",EscapeArea())~
		== %KAGAIN_JOINED%	IF ~IsValidForPartyDialogue("KAGAIN") TriggerOverride("KAGAIN",Global("#L_SayGoodbye","LOCALS",1))~ @2412 /*Yeah bye*/ DO ~ActionOverride("KAGAIN",LeaveParty()) ActionOverride("KAGAIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("KAGAIN",EscapeArea())~
		== %KIVAN_JOINED%	IF ~IsValidForPartyDialogue("KIVAN") TriggerOverride("KIVAN",Global("#L_SayGoodbye","LOCALS",1))~ @2415 /*Farewell...*/ DO ~ActionOverride("KIVAN",LeaveParty()) ActionOverride("KIVAN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("KIVAN",EscapeArea())~
		== %MONTARON_JOINED% IF ~IsValidForPartyDialogue("MONTARON") TriggerOverride("MONTARON",Global("#L_SayGoodbye","LOCALS",1))~ @2403 /*Watch yur back!*/ DO ~ActionOverride("MONTARON",LeaveParty()) ActionOverride("MONTARON",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("MONTARON",EscapeArea())~
		== %NEERA_JOINED%	IF ~IsValidForPartyDialogue("NEERA") TriggerOverride("NEERA",Global("#L_SayGoodbye","LOCALS",1))~ @2356 /*Good luck*/ DO ~ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("NEERA",EscapeArea())~
		== %QUAYLE_JOINED%	IF ~IsValidForPartyDialogue("QUAYLE") TriggerOverride("QUAYLE",Global("#L_SayGoodbye","LOCALS",1))~ @2418 /*Use your brain*/ DO ~ActionOverride("QUAYLE",LeaveParty()) ActionOverride("QUAYLE",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("QUAYLE",EscapeArea())~
		== %RASAAD_JOINED%	IF ~IsValidForPartyDialogue("RASAAD") TriggerOverride("RASAAD",Global("#L_SayGoodbye","LOCALS",1))~ @2421 /*Farewell...*/ DO ~ActionOverride("RASAAD",LeaveParty()) ActionOverride("RASAAD",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("RASAAD",EscapeArea())~
		== %SAFANA_JOINED%	IF ~IsValidForPartyDialogue("SAFANA") TriggerOverride("SAFANA",Global("#L_SayGoodbye","LOCALS",1))~ @2424 /*Goodbye...*/ DO ~ActionOverride("SAFANA",LeaveParty()) ActionOverride("SAFANA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SAFANA",EscapeArea())~
		== %SHARTEEL_JOINED% IF ~IsValidForPartyDialogue("SHARTEEL") TriggerOverride("SHARTEEL",Global("#L_SayGoodbye","LOCALS",1))~ @2427 /*Farewell...*/ DO ~ActionOverride("SHARTEEL",LeaveParty()) ActionOverride("SHARTEEL",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SHARTEEL",EscapeArea())~
		== %SKIE_JOINED%	IF ~IsValidForPartyDialogue("SKIE") TriggerOverride("SKIE",Global("#L_SayGoodbye","LOCALS",1))~ @2430 /*See ya...*/ DO ~ActionOverride("SKIE",LeaveParty()) ActionOverride("SKIE",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SKIE",EscapeArea())~
		== %TIAX_JOINED%	IF ~IsValidForPartyDialogue("TIAX") TriggerOverride("TIAX",Global("#L_SayGoodbye","LOCALS",1))~ @2433 /*Tiax may...*/ DO ~ActionOverride("TIAX",LeaveParty()) ActionOverride("TIAX",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("TIAX",EscapeArea())~
		== %VICONIA_JOINED%	IF ~IsValidForPartyDialogue("VICONIA") TriggerOverride("VICONIA",Global("#L_SayGoodbye","LOCALS",1))~ @2436 /*Farewell...*/ DO ~ActionOverride("VICONIA",LeaveParty()) ActionOverride("VICONIA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("VICONIA",EscapeArea())~
		== %XAN_JOINED%	IF ~IsValidForPartyDialogue("XAN") TriggerOverride("XAN",Global("#L_SayGoodbye","LOCALS",1))~ @2374 /*Farewell...*/ DO ~ActionOverride("XAN",LeaveParty()) ActionOverride("XAN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("XAN",EscapeArea())~
		== %XZAR_JOINED% IF ~IsValidForPartyDialogue("XZAR") TriggerOverride("XZAR",Global("#L_SayGoodbye","LOCALS",1))~ @2406 /*Fare ye well*/ DO ~ActionOverride("XZAR",LeaveParty()) ActionOverride("XZAR",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("XZAR",EscapeArea())~
		== %YESLICK_JOINED% IF ~IsValidForPartyDialogue("YESLICK") TriggerOverride("YESLICK",Global("#L_SayGoodbye","LOCALS",1))~ @2439 /*Take care...*/ DO ~ActionOverride("YESLICK",LeaveParty()) ActionOverride("YESLICK",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("YESLICK",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND)~ EXIT

// BG1 => BG2
CHAIN
	IF ~GlobalLT("BD_Plot","GLOBAL",50) Global("#L_TransTalk","GLOBAL",1) Global("#L_StartBG2","GLOBAL",1)~ THEN ~#LPlayer~ BG1_To_BG2
		@2572 // ~Thank you for your help, but now I'm heading south to see what adventures await me there.~
		== %JAHEIRA_JOINED%	IF ~IsValidForPartyDialogue("JAHEIRA") TriggerOverride("JAHEIRA",Global("#L_SayGoodbye","LOCALS",1))~ @2550 // Khalid and I will join you.
		== %KHALID_JOINED% IF ~IsValidForPartyDialogue("KHALID") TriggerOverride("KHALID",Global("#L_SayGoodbye","LOCALS",1)) OR(2) !IsValidForPartyDialogue("JAHEIRA") !TriggerOverride("JAHEIRA",Global("#L_SayGoodbye","LOCALS",1))~ @2551 // Jaheira and I will join you.
		== %MINSC_JOINED% IF ~IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1)) OR(2) !IsValidForPartyDialogue("DYNAHEIR") !TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1))~ @2552 // ~Dynaheir, Boo and Minsc will not abandon you.~
		== %DYNAHEIR_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1))~ @2553 // We'll join you
		== %MINSC_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2554 // ~And Boo.~
		== %DYNAHEIR_JOINED% IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2555 // ~Yes, yes of course, and Boo.~
		== %AJANTIS_JOINED%	IF ~IsValidForPartyDialogue("AJANTIS") TriggerOverride("AJANTIS",Global("#L_SayGoodbye","LOCALS",1))~ @2284 /* ~It has been an honor.*/ DO ~ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("AJANTIS",EscapeArea())~
		== %ALORA_JOINED%	IF ~IsValidForPartyDialogue("ALORA") TriggerOverride("ALORA",Global("#L_SayGoodbye","LOCALS",1))~ @2391 /* ~See ya 'round!*/ DO ~ActionOverride("ALORA",LeaveParty()) ActionOverride("ALORA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("ALORA",EscapeArea())~
		== %BAELOTH_JOINED%	IF ~IsValidForPartyDialogue("BAELOTH") TriggerOverride("BAELOTH",Global("#L_SayGoodbye","LOCALS",1))~ @2564	/* ~You're heading in the */ DO ~ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("BAELOTH",EscapeArea())~
		== %BRANWEN_JOINED%	IF ~IsValidForPartyDialogue("BRANWEN") TriggerOverride("BRANWEN",Global("#L_SayGoodbye","LOCALS",1))~ @2394 /* Tempus watch over you! */ DO ~ActionOverride("BRANWEN",LeaveParty()) ActionOverride("BRANWEN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("BRANWEN",EscapeArea())~
		== %CORAN_JOINED%	IF ~IsValidForPartyDialogue("CORAN") TriggerOverride("CORAN",Global("#L_SayGoodbye","LOCALS",1))~ @2397 /* ~Farewell my friend.~*/ DO ~ActionOverride("CORAN",LeaveParty()) ActionOverride("CORAN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("CORAN",EscapeArea())~
		== %DORN_JOINED%	IF ~IsValidForPartyDialogue("DORN") TriggerOverride("DORN",Global("#L_SayGoodbye","LOCALS",1))~ @2340 /* ~I cannot join you, <CHARNAME>*/ DO ~ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("DORN",EscapeArea())~
		== %EDWIN_JOINED%	IF ~IsValidForPartyDialogue("EDWIN") TriggerOverride("EDWIN",Global("#L_SayGoodbye","LOCALS",1))~ @2353 /* ~I'm outta here!~*/ DO ~ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("EDWIN",EscapeArea())~
		== %ELDOTH_JOINED%	IF ~IsValidForPartyDialogue("ELDOTH") TriggerOverride("ELDOTH",Global("#L_SayGoodbye","LOCALS",1))~ @2400 /*Ta ta!*/ DO ~ActionOverride("ELDOTH",LeaveParty()) ActionOverride("ELDOTH",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("ELDOTH",EscapeArea())~
		== %FALDORN_JOINED%	IF ~IsValidForPartyDialogue("FALDORN") TriggerOverride("FALDORN",Global("#L_SayGoodbye","LOCALS",1))~ @2409 /*Oakfather watch over you.*/ DO ~ActionOverride("FALDORN",LeaveParty()) ActionOverride("FALDORN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("FALDORN",EscapeArea())~
		== %GARRICK_JOINED%	IF ~IsValidForPartyDialogue("GARRICK") TriggerOverride("GARRICK",Global("#L_SayGoodbye","LOCALS",1))~ @2368 /*Farewell...*/ DO ~ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("GARRICK",EscapeArea())~
		== %IMOEN_JOINED%	IF ~IsValidForPartyDialogue("%IMOEN_DV%") TriggerOverride("%IMOEN_DV%",Global("#L_SayGoodbye","LOCALS",1))~ @2556 // Joining you
		== %KAGAIN_JOINED%	IF ~IsValidForPartyDialogue("KAGAIN") TriggerOverride("KAGAIN",Global("#L_SayGoodbye","LOCALS",1))~ @2412 /*Yeah bye*/ DO ~ActionOverride("KAGAIN",LeaveParty()) ActionOverride("KAGAIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("KAGAIN",EscapeArea())~
		== %KIVAN_JOINED%	IF ~IsValidForPartyDialogue("KIVAN") TriggerOverride("KIVAN",Global("#L_SayGoodbye","LOCALS",1))~ @2415 /*Farewell...*/ DO ~ActionOverride("KIVAN",LeaveParty()) ActionOverride("KIVAN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("KIVAN",EscapeArea())~
		== %MONTARON_JOINED%	IF ~IsValidForPartyDialogue("MONTARON") TriggerOverride("MONTARON",Global("#L_SayGoodbye","LOCALS",1))~ @2403 /*Watch yur back!*/ DO ~ActionOverride("MONTARON",LeaveParty()) ActionOverride("MONTARON",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("MONTARON",EscapeArea())~
		== %NEERA_JOINED%	IF ~IsValidForPartyDialogue("NEERA") TriggerOverride("NEERA",Global("#L_SayGoodbye","LOCALS",1))~ @2356 /*Good luck*/ DO ~ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("NEERA",EscapeArea())~
		== %QUAYLE_JOINED%	IF ~IsValidForPartyDialogue("QUAYLE") TriggerOverride("QUAYLE",Global("#L_SayGoodbye","LOCALS",1))~ @2418 /*Use your brain*/ DO ~ActionOverride("QUAYLE",LeaveParty()) ActionOverride("QUAYLE",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("QUAYLE",EscapeArea())~
		== %RASAAD_JOINED%	IF ~IsValidForPartyDialogue("RASAAD") TriggerOverride("RASAAD",Global("#L_SayGoodbye","LOCALS",1))~ @2421 /*Farewell...*/ DO ~ActionOverride("RASAAD",LeaveParty()) ActionOverride("RASAAD",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("RASAAD",EscapeArea())~
		== %SAFANA_JOINED%	IF ~IsValidForPartyDialogue("SAFANA") TriggerOverride("SAFANA",Global("#L_SayGoodbye","LOCALS",1))~ @2424 /*Goodbye...*/ DO ~ActionOverride("SAFANA",LeaveParty()) ActionOverride("SAFANA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SAFANA",EscapeArea())~
		== %SHARTEEL_JOINED%	IF ~IsValidForPartyDialogue("SHARTEEL") TriggerOverride("SHARTEEL",Global("#L_SayGoodbye","LOCALS",1))~ @2427 /*Farewell...*/ DO ~ActionOverride("SHARTEEL",LeaveParty()) ActionOverride("SHARTEEL",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SHARTEEL",EscapeArea())~
		== %SKIE_JOINED%	IF ~IsValidForPartyDialogue("SKIE") TriggerOverride("SKIE",Global("#L_SayGoodbye","LOCALS",1))~ @2430 /*See ya...*/ DO ~ActionOverride("SKIE",LeaveParty()) ActionOverride("SKIE",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SKIE",EscapeArea())~
		== %TIAX_JOINED%	IF ~IsValidForPartyDialogue("TIAX") TriggerOverride("TIAX",Global("#L_SayGoodbye","LOCALS",1))~ @2433 /*Tiax may...*/ DO ~ActionOverride("TIAX",LeaveParty()) ActionOverride("TIAX",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("TIAX",EscapeArea())~
		== %VICONIA_JOINED%	IF ~IsValidForPartyDialogue("VICONIA") TriggerOverride("VICONIA",Global("#L_SayGoodbye","LOCALS",1))~ @2566 /*I'll not join...*/ DO ~ActionOverride("VICONIA",LeaveParty()) ActionOverride("VICONIA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("VICONIA",EscapeArea())~
		== %XAN_JOINED%	IF ~IsValidForPartyDialogue("XAN") TriggerOverride("XAN",Global("#L_SayGoodbye","LOCALS",1))~ @2374 /*Farewell...*/ DO ~ActionOverride("XAN",LeaveParty()) ActionOverride("XAN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("XAN",EscapeArea())~
		== %XZAR_JOINED% IF ~IsValidForPartyDialogue("XZAR") TriggerOverride("XZAR",Global("#L_SayGoodbye","LOCALS",1))~ @2406 /*Fare ye well*/ DO ~ActionOverride("XZAR",LeaveParty()) ActionOverride("XZAR",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("XZAR",EscapeArea())~
		== %YESLICK_JOINED% IF ~IsValidForPartyDialogue("YESLICK") TriggerOverride("YESLICK",Global("#L_SayGoodbye","LOCALS",1))~ @2439 /*Take care...*/ DO ~ActionOverride("YESLICK",LeaveParty()) ActionOverride("YESLICK",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("YESLICK",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND)~ EXIT

// SoD => BG2
CHAIN
	IF ~GlobalGT("BD_Plot","GLOBAL",50) Global("#L_TransTalk","GLOBAL",1) Global("#L_StartBG2","GLOBAL",1)~ THEN ~#LPlayer~ SoD_To_BG2
		@2571 // ~Thank you for your help, but I need to get as far away from here as I can.~
		== BDJAHEIJ	IF ~IsValidForPartyDialogue("JAHEIRA") TriggerOverride("JAHEIRA",Global("#L_SayGoodbye","LOCALS",1))~ @2550 // Khalid and I will join you.
		== BDKHALIJ IF ~IsValidForPartyDialogue("KHALID") TriggerOverride("KHALID",Global("#L_SayGoodbye","LOCALS",1)) OR(2) !IsValidForPartyDialogue("JAHEIRA") !TriggerOverride("JAHEIRA",Global("#L_SayGoodbye","LOCALS",1))~ @2551 // Jaheira and I will join you.
		== BDMINSCJ IF ~IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1)) OR(2) !IsValidForPartyDialogue("DYNAHEIR") !TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1))~ @2552 // ~Dynaheir, Boo and Minsc will not abandon you.~
		== BDDYNAHJ IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1))~ @2553 // We'll join you...
		== BDMINSCJ IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2554 // ~And Boo.~
		== BDDYNAHJ IF ~IsValidForPartyDialogue("DYNAHEIR") TriggerOverride("DYNAHEIR",Global("#L_SayGoodbye","LOCALS",1)) IsValidForPartyDialogue("MINSC") TriggerOverride("MINSC",Global("#L_SayGoodbye","LOCALS",1))~ @2555 // ~Yes, yes of course, and Boo.~
		== BDBAELOJ	IF ~IsValidForPartyDialogue("BAELOTH") TriggerOverride("BAELOTH",Global("#L_SayGoodbye","LOCALS",1))~ @2360	/* ~You're heading in the */ DO ~ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("BAELOTH",EscapeArea())~
		== BDCORWIJ	IF ~IsValidForPartyDialogue("CORWIN") TriggerOverride("CORWIN",Global("#L_SayGoodbye","LOCALS",1))~ @2560 /* ~You're leaving? Now? */ DO ~ActionOverride("CORWIN",LeaveParty()) ActionOverride("CORWIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("CORWIN",EscapeArea())~
		== BDDORNJ IF ~IsValidForPartyDialogue("DORN") TriggerOverride("DORN",Global("#L_SayGoodbye","LOCALS",1))~ @2340 /* ~I cannot join you, <CHARNAME>*/ DO ~ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("DORN",EscapeArea())~
		== BDEDWINJ	IF ~IsValidForPartyDialogue("EDWIN") TriggerOverride("EDWIN",Global("#L_SayGoodbye","LOCALS",1))~ @2347	/* ~Whatever... */ DO ~ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("EDWIN",EscapeArea())~
		== BDGLINTJ	IF ~IsValidForPartyDialogue("GLINT") TriggerOverride("GLINT",Global("#L_SayGoodbye","LOCALS",1))~ @2561 /* ~It's been fun. */ DO ~ActionOverride("GLINT",LeaveParty()) ActionOverride("GLINT",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("GLINT",EscapeArea())~
		== BDMKHIIJ	IF ~IsValidForPartyDialogue("MKHIIN") TriggerOverride("MKHIIN",Global("#L_SayGoodbye","LOCALS",1))~ @2562 /* ~Take care */ DO ~ActionOverride("MKHIIN",LeaveParty()) ActionOverride("MKHIIN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("MKHIIN",EscapeArea())~
		== BDNEERAJ	IF ~IsValidForPartyDialogue("NEERA") TriggerOverride("NEERA",Global("#L_SayGoodbye","LOCALS",1))~ @2354	/* Well...goodluck... */ DO ~ActionOverride("NEERA",LeaveParty()) ActionOverride("NEERA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("NEERA",EscapeArea())~
		== BDRASAAJ	IF ~IsValidForPartyDialogue("RASAAD") TriggerOverride("RASAAD",Global("#L_SayGoodbye","LOCALS",1))~ @2564 /*Selune...*/ DO ~ActionOverride("RASAAD",LeaveParty()) ActionOverride("RASAAD",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("RASAAD",EscapeArea())~
		== BDSAFANJ	IF ~IsValidForPartyDialogue("SAFANA") TriggerOverride("SAFANA",Global("#L_SayGoodbye","LOCALS",1))~ @2565 /*getting interesting*/ DO ~ActionOverride("SAFANA",LeaveParty()) ActionOverride("SAFANA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("SAFANA",EscapeArea())~
		== BDVICONJ	IF ~IsValidForPartyDialogue("VICONIA") TriggerOverride("VICONIA",Global("#L_SayGoodbye","LOCALS",1))~ @2566 /*I'll not join...*/ DO ~ActionOverride("VICONIA",LeaveParty()) ActionOverride("VICONIA",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("VICONIA",EscapeArea())~
		== BDVOGHIJ	IF ~IsValidForPartyDialogue("VOGHILN") TriggerOverride("VOGHILN",Global("#L_SayGoodbye","LOCALS",1))~ @2563 /*A worthy tale...*/ DO ~ActionOverride("VOGHILN",LeaveParty()) ActionOverride("VOGHILN",SetGlobal("KickedOut","LOCALS",1)) ActionOverride("VOGHILN",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND)~ EXIT

// Post-Korlasz
CHAIN
	IF ~Global("#L_CountedPKs","GLOBAL",1) Global("#L_NumPKs","GLOBAL",0) Global("#L_DidPostKorlasz","GLOBAL",0)~ THEN ~#LPlayer~ BELT_FUN_NO_PK
		@2270 // I have stuff to do
		== BELT IF ~~ @2275 /* ~May I suggest the tour of Durlag's Tower that is offered in Ulgoth's Beard?  I hear it's quite interesting.~ */
	END
	+ ~Dead("DEATHK")~ + @2276 /* ~I've already been there.  Interesting is ... one way to describe it.~ */ DO ~SetGlobal("#L_DidPostKorlasz","GLOBAL",1)~ EXIT
    + ~!Dead("DEATHK")~ + @2277 /* ~Sounds like fun.  I'll check it out.~ */ DO ~SetGlobal("#L_LetsHaveFun","GLOBAL",1) SetGlobal("#L_DidPostKorlasz","GLOBAL",1)~ EXIT
	
CHAIN
	IF ~Global("#L_CountedPKs","GLOBAL",1) GlobalGT("#L_NumPKs","GLOBAL",0) Global("#L_DidPostKorlasz","GLOBAL",0)~ THEN ~#LPlayer~ BELT_FUN_PK
		@2270 // I have stuff to do
		== BELT IF ~~ @2275 /* ~May I suggest the tour of Durlag's Tower that is offered in Ulgoth's Beard?  I hear it's quite interesting.~ */
	END
	IF ~Dead("DEATHK")~ DO ~SetGlobal("#L_DidPostKorlasz","GLOBAL",1)~ GOTO PK_1
    IF ~!Dead("DEATHK")~ DO ~SetGlobal("#L_LetsHaveFun","GLOBAL",1) SetGlobal("#L_DidPostKorlasz","GLOBAL",1)~ GOTO PK_2

CHAIN
	IF ~~ THEN ~#LPlayer~ PK_1
		@2276 /* ~I've already been there.  Interesting is ... one way to describe it.~ */
		== %AJANTIS_JOINED% IF ~Global("#L_AjantisModded","GLOBAL",0) IsValidForPartyDialogue("AJANTIS")~ @2278 // I am eager to present our accomplishments ...
		== %JAHEIRA_JOINED% IF ~Global("#L_JaheiraModded","GLOBAL",0) IsValidForPartyDialogue("Jaheira")~ @2330
		== %KHALID_JOINED% IF ~Global("#L_KhalidModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") OR(2) GlobalGT("#L_JaheiraModded","GLOBAL",0) !IsValidForPartyDialogue("Jaheira")~ @2336
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2344
		== %EDWIN_JOINED% IF ~Global("#L_EdwinModded","GLOBAL",0) IsValidForPartyDialogue("Edwin")~ @2351
		== %NEERA_JOINED% IF ~Global("#L_NeeraModded","GLOBAL",0) IsValidForPartyDialogue("Neera")~ @2358
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2364
	END
	+ ~Global("#L_UsePK","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %JAHEIRA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",1)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %JAHEIRA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",2)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",2)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",3)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",3)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",4)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",4)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",5)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",5)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",6)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",6)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",7)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",7)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	
CHAIN
	IF ~~ THEN ~#LPlayer~ PK_2
		@2277 /* ~Sounds like fun.  I'll check it out.~ */	
		== %AJANTIS_JOINED% IF ~Global("#L_AjantisModded","GLOBAL",0) IsValidForPartyDialogue("AJANTIS")~ @2278 // I am eager to present our accomplishments ...
		== %JAHEIRA_JOINED% IF ~Global("#L_JaheiraModded","GLOBAL",0) IsValidForPartyDialogue("Jaheira")~ @2330
		== %KHALID_JOINED% IF ~Global("#L_KhalidModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") OR(2) GlobalGT("#L_JaheiraModded","GLOBAL",0) !IsValidForPartyDialogue("Jaheira")~ @2336
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2344
		== %EDWIN_JOINED% IF ~Global("#L_EdwinModded","GLOBAL",0) IsValidForPartyDialogue("Edwin")~ @2351
		== %NEERA_JOINED% IF ~Global("#L_NeeraModded","GLOBAL",0) IsValidForPartyDialogue("Neera")~ @2358
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2364
	END
	+ ~Global("#L_UsePK","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %JAHEIRA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",1)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %JAHEIRA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",1)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %JAHEIRA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",2)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",2)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",2)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %KHALID_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",3)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %AJANTIS_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",3)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %AJANTIS_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",3)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %AJANTIS_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",4)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %NEERA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",4)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %NEERA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",4)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %NEERA_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",5)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %EDWIN_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",5)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %EDWIN_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",5)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %EDWIN_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",6)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %BAELOTH_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",6)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %BAELOTH_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",6)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %BAELOTH_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",7)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ EXTERN %DORN_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",7)~ + @2280 /* ~Please let me treat you to a little fun before you go.  */ EXTERN %DORN_JOINED% PK_STAY
	+ ~Global("#L_UsePK","GLOBAL",7)~ + @2281 /* ~Of course you may leave, but not with that equipment.~ */  EXTERN %DORN_JOINED% PK_STAY

CHAIN
	IF ~~ THEN %JAHEIRA_JOINED% PK_STAY
		 @2327
		== %AJANTIS_JOINED% IF ~Global("#L_AjantisModded","GLOBAL",0) IsValidForPartyDialogue("AJANTIS")~ @2283 // As you wish.  I owe you that at least.
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2341
		== %EDWIN_JOINED% IF ~Global("#L_EdwinModded","GLOBAL",0) IsValidForPartyDialogue("Edwin")~ @2348
		== %NEERA_JOINED% IF ~Global("#L_NeeraModded","GLOBAL",0) IsValidForPartyDialogue("Neera")~ @2355
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2361
	END
	IF ~~ EXIT

CHAIN
	IF ~~ THEN %KHALID_JOINED% PK_STAY
		@2333 
		== %AJANTIS_JOINED% IF ~Global("#L_AjantisModded","GLOBAL",0) IsValidForPartyDialogue("AJANTIS")~ @2283 // As you wish.  I owe you that at least.
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2341
		== %EDWIN_JOINED% IF ~Global("#L_EdwinModded","GLOBAL",0) IsValidForPartyDialogue("Edwin")~ @2348
		== %NEERA_JOINED% IF ~Global("#L_NeeraModded","GLOBAL",0) IsValidForPartyDialogue("Neera")~ @2355
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2361
	END
	IF ~~ EXIT

CHAIN
	IF ~~ THEN %AJANTIS_JOINED% PK_STAY
		@2283 // As you wish.  I owe you that at least.
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2341
		== %EDWIN_JOINED% IF ~Global("#L_EdwinModded","GLOBAL",0) IsValidForPartyDialogue("Edwin")~ @2348
		== %NEERA_JOINED% IF ~Global("#L_NeeraModded","GLOBAL",0) IsValidForPartyDialogue("Neera")~ @2355
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2361
	END
	IF ~~ EXIT

CHAIN
	IF ~~ THEN %NEERA_JOINED% PK_STAY
		@2355
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2341
		== %EDWIN_JOINED% IF ~Global("#L_EdwinModded","GLOBAL",0) IsValidForPartyDialogue("Edwin")~ @2348
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2361
	END
	IF ~~ EXIT

CHAIN
	IF ~~ THEN %EDWIN_JOINED% PK_STAY
		@2348
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2341
		== %BAELOTH_JOINED% IF ~Global("#L_BaelothModded","GLOBAL",0) IsValidForPartyDialogue("Baeloth")~ @2361
	END
	IF ~~ EXIT

CHAIN
	IF ~~ THEN %BAELOTH_JOINED% PK_STAY
		@2361
		== %DORN_JOINED% IF ~Global("#L_DornModded","GLOBAL",0) IsValidForPartyDialogue("Dorn")~ @2341
	END
	IF ~~ EXIT

APPEND %DORN_JOINED%
	IF ~~ THEN BEGIN PK_STAY
		SAY @2341
		IF ~~ EXIT
	END
END
