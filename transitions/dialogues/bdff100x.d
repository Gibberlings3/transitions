//////////////////////////////////////////////////////////////////
// Modifications to the Flaming Fist escorts in Korlasz Dungeon //
// Compiled via main_sod.tpa                                    //
//////////////////////////////////////////////////////////////////

REPLACE_TRIGGER_TEXT BDFF1000 ~Dead("%IMOEN_DV%")~ ~Dead("%IMOEN_DV%") !Global("#L_SarvQuests","GLOBAL",8)~
REPLACE_TRIGGER_TEXT BDFF1000 ~True()~ ~OR(3) !Global("#L_SarvQuests","GLOBAL",8) !AreaCheck("BD0130") !Global("BD_Korlasz_Fight","BD0130",2)~
ADD_TRANS_TRIGGER BDFF1000 0 ~!Global("#L_SarvQuests","GLOBAL",8)~ DO 1 2
EXTEND_BOTTOM BDFF1000 0
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY #%REPLY_EXPLORE% GOTO 1b
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

REPLACE_TRIGGER_TEXT BDFF1001 ~Dead("%IMOEN_DV%")~ ~Dead("%IMOEN_DV%") !Global("#L_SarvQuests","GLOBAL",8)~
ADD_TRANS_TRIGGER BDFF1001 0 ~!Global("#L_SarvQuests","GLOBAL",8)~ DO 0 1
EXTEND_BOTTOM BDFF1001 0
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY #%REPLY_EXPLORE% GOTO 1b
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

REPLACE_TRIGGER_TEXT BDFF1002 ~Dead("%IMOEN_DV%")~ ~Dead("%IMOEN_DV%") !Global("#L_SarvQuests","GLOBAL",8)~
ADD_TRANS_TRIGGER BDFF1002 0 ~!Global("#L_SarvQuests","GLOBAL",8)~ DO 0 1
EXTEND_BOTTOM BDFF1002 0
	IF ~Global("#L_SarvQuests","GLOBAL",8)~ THEN REPLY #%REPLY_EXPLORE% GOTO 1b
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

