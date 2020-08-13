////////////////////////////////////
// Dialogue changes for SoD       //
// Patched in via main_common.tpa //
////////////////////////////////////

// Make sure PC gets the room in the palace
ALTER_TRANS BDSCHAEL 
	BEGIN 20 21 23 END 
	BEGIN 0 END 
	BEGIN
		"TRIGGER" ~Global("#L_AcceptedRoom","GLOBAL",1)~ 
		"EPILOGUE" ~EXTERN BDBELT BELT_HAVE_ROOM~
	END

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

	IF ~~ THEN BELT_HAVE_ROOM
		SAY @2442 /* ~I want to make sure you rest here tonight, <CHARNAME>, when you're finished with your preparations.~ */
		++ @2443 /* ~Imoen and Fenster are up there, I'd not want to disturb them.~ */ EXTERN ~BDLIIA~ LIIA_IMOEN_ROOM_OK
	END

	IF ~~ THEN BELT_INSIST
		SAY @2445 /* ~I rather insist upon this, <CHARNAME>.  It's for your safety.~ */
		++ @2446 /* ~My safety?  That's a bit ironic.~ */ + BELT_NO_SNARK
		+ ~Global("#L_BG1KorlaszDone","GLOBAL",1) Global("#L_Snark","GLOBAL",1)~ + @2447 /* ~Like how you managed to keep Imoen safe?  Or that sword of Sarevok's?~ */ + BELT_SNARK
	END

	IF ~~ THEN BELT_SNARK
		SAY @2448 /* ~err...I was going to mention that it went missing...~ */
		++ @2449 /* ~Do you know where it is?  I do.  It was stolen from you and sent to Athkatla at the request of some mysterious 'hooded man'.~ */ + BELT_SNARK_2
	END

	IF ~~ THEN BELT_SNARK_2
		SAY @2450 /* ~That I didn't know.~ */
		++ @2451 /* ~You should probably have someone look into that.  It could end up being important.~ */ + BELT_NO_SNARK
	END

	IF ~~ THEN BELT_NO_SNARK
		SAY @2452 /* ~Be that as it may, if tonight's attack would have happened when you were staying outside the palace, you'd not have had the Flaming Fist to help you fend them off.~ */
		= @2453 /* ~You would not have been able to defend yourself from them all.~ */
		++ @2454 /* ~Well, that is true.  You're right, I am safer here.~ */ DO ~SetGlobal("#L_AcceptedRoom","GLOBAL",1)~ + 41
	END

	IF ~~ THEN BELT_WEAK_POISON
		SAY @2460 /* ~That is disturbing news.~ */
		IF ~Global("#L_Snark","GLOBAL",0)~ THEN REPLY @2461 /* ~Even more disturbing was the visitor I had.  It seems a mysterious hooded man is stalking me.~ */ + BELT_SORRY
		IF ~!Global("#L_Snark","GLOBAL",0)~ THEN REPLY @2461 /* ~Even more disturbing was the visitor I had.  It seems a mysterious hooded man is stalking me.~ */ + BELT_SAME_HOODED_MAN
	END

	IF ~~ THEN BELT_SAME_HOODED_MAN
		SAY @2463 /* ~Could it be the same that commissioned the theft of Sarevok's sword?~ */
		++ @2464 /* ~Well, he certainly fit the description.  Mysterious...creepy is closer to the truth.  And ominous.~ */ + BELT_SORRY
	END

	IF ~~ THEN BELT_SORRY
		SAY @2465 /* ~I must apologize, <CHARNAME>.  It seems our palace security never ceases to fail you.~ */
		IF ~~ EXTERN ~BDENTAR~ 42
	END
END

APPEND BDLIIA
	IF ~~ THEN LIIA_IMOEN_ROOM_OK
		SAY @2444 /* ~Imoen will be moved to her quarters shortly.  You will not disturb her.~ */
		IF ~~ THEN EXTERN ~BDBELT~ BELT_INSIST
	END

	IF ~~ THEN LIIA_WEAK_POISON
		SAY @2456 /* ~Hmm, you may be right.~ */
		IF ~~ THEN GOTO 15
	END

	IF ~~ THEN LIIA_YES_WEAK_POISON
		SAY @2458 /* ~Yes, the poison they used was far too weak to accomplish that.~ */
		++ @2459 /* ~Their purpose was to capture me.  I have no idea why.~ */ EXTERN ~BDBELT~ BELT_WEAK_POISON
	END
END

// Have the PC realize the poison was too weak to act as a means of assassination
ALTER_TRANS BDLIIA
	BEGIN 14 END
	BEGIN 0 END
	BEGIN
		"TRIGGER" ~CheckStatLT(Player1,16,WIS) CheckStatLT(Player1,16,INT)~ 
	END
EXTEND_BOTTOM BDLIIA 14
	IF ~OR(2) CheckStatGT(Player1,15,WIS) CheckStatGT(Player1,15,INT)~ THEN REPLY @2455	/* ~They used a weak poison?  That makes no...they weren't trying to kill me.  They were trying to capture me.~ */ DO ~SetGlobal("#L_WeakPoison","GLOBAL",1)~ GOTO LIIA_WEAK_POISON
END

ALTER_TRANS BDLIIA
	BEGIN 15 END
	BEGIN 2 END
	BEGIN
		"TRIGGER" ~CheckStatLT(Player1,16,WIS) CheckStatLT(Player1,16,INT)~ 
	END

// Remove talk of Imoen not in Korlasz dungeon if she could have been there
ALTER_TRANS BDLIIA
	BEGIN 24 END
	BEGIN 0 END
	BEGIN
		"TRIGGER" ~Global("C#st_ImoenInGroupKD","GLOBAL",0) Global("#L_LiiaInstalled","GLOBAL",0)~
	END 

// Final palace conversation
EXTEND_TOP BDENTAR 41 
	IF ~!Global("#L_WeakPoison","GLOBAL",0)~ THEN REPLY @2457 /* ~Before I leave, I need to point out that Caelar's minions weren't here to kill me.~ */ EXTERN ~BDLIIA~ LIIA_YES_WEAK_POISON
	IF ~Global("#L_WeakPoison","GLOBAL",0) Global("#L_Snark","GLOBAL",0)~ THEN REPLY @2462 /* ~Before I leave, I have some disturbing news.  I received a visitor here in the palace. It seems a mysterious hooded man is stalking me.~ */ EXTERN ~BDBELT~ BELT_SORRY
	IF ~Global("#L_WeakPoison","GLOBAL",0) !Global("#L_Snark","GLOBAL",0)~ THEN REPLY @2462 /* ~Before I leave, I have some disturbing news.  I received a visitor here in the palace. It seems a mysterious hooded man is stalking me.~ */ EXTERN ~BDBELT~ BELT_SAME_HOODED_MAN
END

