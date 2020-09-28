////////////////////////////////////
// Dialogue changes for SoD       //
// Patched in via main_common.tpa // 
////////////////////////////////////

// Make sure PC gets the room in the palace
EXTEND_BOTTOM BDSCHAEL 20 21 23
	IF ~Global("#L_AcceptedRoom","GLOBAL",0)~ THEN EXTERN ~BDBELT~ BELT_GET_ROOM
END

ALTER_TRANS BDSCHAEL
	BEGIN 24 29 30 END
	BEGIN 1 END
	BEGIN
		"TRIGGER" ~Global("BD_MET_OPHYLLIS","GLOBAL",0) Global("#L_SkipFirstHalfCA","GLOBAL",0)~
	END

ALTER_TRANS BDSCHAEL
	BEGIN 34 38 41 42 END
	BEGIN 2 END
	BEGIN
		"TRIGGER" ~Global("BD_MET_OPHYLLIS","GLOBAL",0) Global("#L_SkipFirstHalfCA","GLOBAL",0)~
	END

ALTER_TRANS BDSCHAEL
	BEGIN 44 END
	BEGIN 3 END
	BEGIN
		"TRIGGER" ~Global("BD_MET_OPHYLLIS","GLOBAL",0) Global("#L_SkipFirstHalfCA","GLOBAL",0)~
	END

ALTER_TRANS BDSCHAEL
	BEGIN 40 END
	BEGIN 4 END
	BEGIN
		"TRIGGER" ~Global("BD_MET_OPHYLLIS","GLOBAL",0) Global("#L_SkipFirstHalfCA","GLOBAL",0)~
	END

APPEND BDBELT
	IF ~~ THEN BELT_GET_ROOM
		SAY @2441 /* ~You can rest on the third floor when you're finished with your preparations.~ */
		++ @2443 /* ~Imoen and Fenster are up there, I'd not want to disturb them.~ */ EXTERN ~BDLIIA~ LIIA_IMOEN_ROOM_OK
	END

	IF ~~ THEN BELT_INSIST
		SAY @2445 /* ~I rather insist upon this, <CHARNAME>.  It's for your safety.~ */
		++ @2446 /* ~My safety?  That's a bit ironic.~ */ + BELT_FINAL_ROOM
	END

	IF ~~ THEN BELT_FINAL_ROOM
		SAY @2452 /* ~Be that as it may, if tonight's attack would have happened when you were staying outside the palace, you'd not have had the Flaming Fist to help you fend them off.~ */
		= @2453 /* ~You would not have been able to defend yourself from them all.~ */
		++ @2454 /* ~Well, that is true.  You're right, I am safer here.~ */ DO ~SetGlobal("#L_AcceptedRoom","GLOBAL",1)~ + 41
	END
END

APPEND BDLIIA
	IF ~~ THEN LIIA_IMOEN_ROOM_OK
		SAY @2444 /* ~Imoen will be moved to her quarters shortly.  You will not disturb her.~ */
		IF ~~ THEN EXTERN ~BDBELT~ BELT_INSIST
	END
END

// Allow the line to Entar about him being dead if SoD reached via Transitions
ALTER_TRANS BDLIIA 
	BEGIN 9 END 
	BEGIN 2 END 
	BEGIN
  		"TRIGGER" ~!Global("SOD_fromimport","global",0)~
	END

// Remove talk of Imoen not in Korlasz dungeon if she could have been there
ALTER_TRANS BDLIIA
	BEGIN 24 END
	BEGIN 0 END
	BEGIN
		"TRIGGER" ~Global("C#st_ImoenInGroupKD","GLOBAL",0) Global("#L_LiiaInstalled","GLOBAL",0)~
	END 

