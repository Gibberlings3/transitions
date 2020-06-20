//////////////////////////////////////////////////////////////////
// Modifications to the Flaming Fist escorts in Korlasz Dungeon //
// Compiled via main_common.tpa                                 //
//////////////////////////////////////////////////////////////////

REPLACE_TRIGGER_TEXT BDFF1000 ~Dead("IMOEN2")~ ~Dead("IMOEN2") !Global("#L_SarvQuests","GLOBAL",8)~
REPLACE_TRIGGER_TEXT BDFF1000 ~True()~ ~OR(3) !Global("#L_SarvQuests","GLOBAL",8) !AreaCheck("BD0130") !Global("BD_Korlasz_Fight","BD0130",2)~
ALTER_TRANS BDFF1000 
	BEGIN 0 END 
	BEGIN 1 END 
	BEGIN
  		"TRIGGER" ~!Global("#L_SarvQuests","GLOBAL",8)~
	END
EXTEND_BOTTOM BDFF1000 0
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY #269735 GOTO 1b
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY @2251 /* ~Thank you.  I'm heading out now.~ */ GOTO 1c
END
APPEND BDFF1000
	IF ~~ THEN BEGIN 1b
		SAY @2248 /* ~We'll wait for you here...just in case.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN 1c
		SAY @2252 /* ~Very well.  We'll escort the prisoner to her cell.~ */
		IF ~~ THEN EXIT
	END

 	IF ~Global("#L_SarvQuests","GLOBAL",8) Global("BD_Korlasz_Fight","BD0130",2) AreaCheck("BD0130")~ THEN BEGIN MOVE_UPSTAIRS
		SAY	@2249 /* ~Congratulations on a job well done, <PRO_SIRMAAM>.~ */
		= @2250	/* ~We're heading to the upper level.  Follow when you're ready.~ */
		IF ~~ THEN DO ~EscapeAreaObject("Tranbd0120rope")~ EXIT
	END
END

REPLACE_TRIGGER_TEXT BDFF1001 ~Dead("IMOEN2")~ ~Dead("IMOEN2") !Global("#L_SarvQuests","GLOBAL",8)~
ALTER_TRANS BDFF1001 
	BEGIN 0 END 
	BEGIN 0 END 
	BEGIN
  		"TRIGGER" ~!Global("#L_SarvQuests","GLOBAL",8)~
	END
ALTER_TRANS BDFF1001 
	BEGIN 0 END 
	BEGIN 1 END 
	BEGIN
  		"TRIGGER" ~!Global("#L_SarvQuests","GLOBAL",8)~
	END
EXTEND_BOTTOM BDFF1001 0
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY #269735 GOTO 1b
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY @2251 /* ~Thank you.  I'm heading out now.~ */ GOTO 1c
END
APPEND BDFF1001
	IF ~~ THEN BEGIN 1b
		SAY @2248 /* ~We'll wait for you here...just in case.~ */
		IF ~~ THEN EXIT
	END	

	IF ~~ THEN BEGIN 1c
		SAY @2252 /* ~Very well.  We'll escort the prisoner to her cell.~ */
		IF ~~ THEN EXIT
	END
END

REPLACE_TRIGGER_TEXT BDFF1002 ~Dead("IMOEN2")~ ~Dead("IMOEN2") !Global("#L_SarvQuests","GLOBAL",8)~
ALTER_TRANS BDFF1002 
	BEGIN 0 END 
	BEGIN 0 END 
	BEGIN
  		"TRIGGER" ~!Global("#L_SarvQuests","GLOBAL",8)~
	END
ALTER_TRANS BDFF1002 
	BEGIN 0 END 
	BEGIN 1 END 
	BEGIN
  		"TRIGGER" ~!Global("#L_SarvQuests","GLOBAL",8)~
	END
EXTEND_BOTTOM BDFF1002 0
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY #269735 GOTO 1b
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY @2251 /* ~Thank you.  I'm heading out now.~ */ GOTO 1c
END
APPEND BDFF1002
	IF ~~ THEN BEGIN 1b
		SAY @2248 /* ~We'll wait for you here...just in case.~ */
		IF ~~ THEN EXIT
	END	

	IF ~~ THEN BEGIN 1c
		SAY @2252 /* ~Very well.  We'll escort the prisoner to her cell.~ */
		IF ~~ THEN EXIT
	END
END

