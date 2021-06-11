///////////////////////////////////////////////////////////
// Duke Liia in the Ducal Palace after Sarevok is killed //
// Patched via main_common.tpa                           //
///////////////////////////////////////////////////////////

APPEND LIIA
	IF WEIGHT #-999 ~Global("#L_TalkedToDukes","GLOBAL",2) IsValidForPartyDialogue("%IMOEN_DV%")~ THEN BEGIN LIIA_1
		SAY @2099 // ~Imoen, I sense a real talent for magic within you, child.  If you are interested in learning how to hone this skill, come see me later.~
		IF ~~ DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImoenAskedToTrain","GLOBAL",1)~ EXIT
	END

	IF WEIGHT #-998 ~Global("#L_TalkedToDukes","GLOBAL",2) !InPartyAllowDead("%IMOEN_DV%")~ THEN BEGIN LIIA_2
		SAY @2118 // ~<CHARNAME>, if you see your friend Imoen, let her know she is free to train in magic with me, if she's interested.~
		IF ~~ DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3)~ EXIT
	END

	IF WEIGHT #-997 ~Global("#L_TalkedToDukes","GLOBAL",2) InPartyAllowDead("%IMOEN_DV%") !IsValidForPartyDialogue("%IMOEN_DV%")~ THEN BEGIN LIIA_3
		SAY @2117 /* ~One moment <CHARNAME>, I need to speak with Imoen.~ */
		IF ~~ DO ~ApplySpellRES("%SPL_RESURRECT%","%IMOEN_DV%") ApplySpellRES("%SPL_DISPEL%","%IMOEN_DV%") ApplySpellRES("%SPL_CLEANAIR%","%IMOEN_DV%")~ GOTO LIIA_1
	END

	IF WEIGHT #-996 ~!Global("#L_ImoenInPalace","GLOBAL",1) IsGabber("%IMOEN_DV%")~ THEN BEGIN LIIA_99a
		SAY @2119 /* ~Greetings Imoen.  Have you come about magic training?~ */
		IF ~~ DO ~SetGlobal("#L_ImoenAskedToTrain","GLOBAL",1)~ GOTO LOTS_OF_STUDY
	END

	IF WEIGHT #-995 ~!Global("#L_ImoenInPalace","GLOBAL",1) !IsGabber("%IMOEN_DV%") IsValidForPartyDialogue("%IMOEN_DV%")~ THEN BEGIN LIIA_99b
		SAY @2120 /* ~Greetings, <GABBER>.  Is Imoen ready to train in magic with me?~ */
		IF ~~ GOTO LOTS_OF_STUDY
	END

	IF ~~ THEN BEGIN LOTS_OF_STUDY
		SAY @2100 // ~It would require you stay here in the palace with me.  There would be a lot of study.~
		++ @2101 /* ~Go ahead, Imoen.  You've always wanted this.~ */ DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",1) ActionOverride("%IMOEN_DV%",StartDialogueNoSet(Player1))~ EXIT
		++ @2102 /* ~If you do this, Imoen, I'll have to find another to take your place in the group.  It will be...goodbye.~ */ DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",2) ActionOverride("%IMOEN_DV%",StartDialogueNoSet(Player1))~ EXIT
		++ @2123 /* ~Can you wait a few days, Imoen?  I really need you right now.~ */ DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",3) ActionOverride("%IMOEN_DV%",StartDialogueNoSet(Player1))~ EXIT
	END
	
	IF WEIGHT #-994 ~Global("#L_ImoenInPalace","GLOBAL",1) Global("#L_LiiaInformedPC","MYAREA",0)~ THEN BEGIN LIIA_INFORM_PC
		SAY @2112 // ~<CHARNAME>, I wanted to let you know that your friend Imoen is staying with us to study magic.~
		= @2113	// ~Feel free to visit her on the 3rd floor whenever you'd like.~
		++ @2114 /* ~Thank you.  I'll do that.~ */ DO ~SetGlobal("#L_LiiaInformedPC","MYAREA",1)~ EXIT
		++ @2115 /* ~Maybe...someday.~ */ DO ~SetGlobal("#L_LiiaInformedPC","MYAREA",1)~ EXIT
	END

	IF WEIGHT #-993 ~Global("#L_ImoenInPalace","GLOBAL",1) Global("#L_LiiaInformedPC","MYAREA",1)~ THEN BEGIN LIIA_HELLO_AGAIN
		SAY @2057 /* ~Greetings, <GABBER>.  It's a pleasure to see you again.~ */
		IF ~~ THEN EXIT
	END
	
	IF WEIGHT #-992 ~Global("#L_ImoenInPalace","GLOBAL",0) !InPartyAllowDead("%IMOEN_DV%")~ THEN BEGIN LIIA_ASK_ABOUT_IMOEN
		SAY @2531 // ~Please do let Imoen know about the training opportunity I'm offering her.~
		IF ~~ THEN EXIT
	END
END

