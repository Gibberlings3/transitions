////////////////////////////////////////////
// Dialogue changes for BG2               //
// Patched in via open_suldanessellar.tpa //
////////////////////////////////////////////

// Call the cut scene so it will evaluate triggers
// This will allow the use of the Irenicus in hell movie as a dream
// and give back bhaal-spawn powers if that component is installed
ALTER_TRANS SUELLE2
	BEGIN 5 8 END
	BEGIN 0 END
	BEGIN
		"ACTION" ~ClearAllActions() StartCutSceneMode() StartCutSceneEx("cut59b",TRUE)~
	END

// Keep the game open after Ellesime thanks the group
ALTER_TRANS SUELLE2
	BEGIN 13 14 END
	BEGIN 0 END
	BEGIN
		"ACTION" ~GiveItemCreate("#LAMUL27",Player1,1,0,0)~
		"EPILOGUE" ~GOTO EXPLAIN_ITEM~
	END

ALTER_TRANS SUELLE2
	BEGIN 18 END
	BEGIN 0 END 
	BEGIN
		"TRIGGER" ~ReputationLT(Player1,10) Global("#L_Snark","GLOBAL",0)~
		"EPILOGUE" ~GOTO 19~
	END

ALTER_TRANS SUELLE2
	BEGIN 18 END 
	BEGIN 1 END 
	BEGIN
		"TRIGGER" ~ReputationGT(Player1,9) Global("#L_Snark","GLOBAL",0)~
		"EPILOGUE" ~GOTO 20~
	END

APPEND SUELLE2
	IF ~~ THEN BEGIN EXPLAIN_ITEM
		SAY @2467 /* ~The amulet will also allow you access to our sacred grove, when you are ready to seek its wisdom.~ */
		+ ~Global("#L_Snark","GLOBAL",0)~ + @2468 /* ~Thank you.~ */ GOTO 15
		+ ~!Global("#L_Snark","GLOBAL",0)~ + @2468 /* ~Thank you.~ */ GOTO DEJA_VU
	END

	IF ~~ THEN BEGIN DEJA_VU
		SAY @2469 /* ~You are most welcome in Suldanessellar.  The entrance will always remain open to you.  Feel free to come and go as you please.~ */
		++ @2470 /* ~Like I've not heard that before.~ */ GOTO 15
	END
END

// Talking amulet
BEGIN ~#LAMUL27~
	IF ~True()~ THEN BEGIN TOB_ITEM
		SAY	@2471 /* ~You hear a voice, remarkably similar to Queen Ellesime's, echo strangely in your mind~ [ELLESD15] */
		= @2472 /* ~<CHARNAME>, are you ready to enter our sacred grove?~ */
		++ @2473 /* ~Yes, I am ready.~ */ DO ~ClearAllActions() StartCutSceneMode() StartCutSceneEx("#L_Cut10",TRUE)~ EXIT
		++ @2474 /* ~Not at this time.~ */ EXIT
	END
// End of amulet dialogue

