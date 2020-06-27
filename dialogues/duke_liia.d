///////////////////////////////////////////////////////////
// Duke Liia in the Ducal Palace after Sarevok is killed //
// Patched via liia.tpa                                  //
///////////////////////////////////////////////////////////

APPEND LIIA
	IF ~Global("#L_TalkedToDukes","GLOBAL",2) IsValidForPartyDialogue("IMOEN2") Global("#L_ImTrainRsp","MYAREA",0)~ THEN BEGIN LIIA_1
		SAY @2099 /* ~Imoen, I sense a real talent for magic within you, child.  Are you interested in learning how to hone this skill?~ */
		= @2100 /* ~It would require you stay here in the palace with me.  There would be a lot of study.~ */
		++ @2101 /* ~Go ahead, Imoen.  You've always wanted this.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",1) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
		++ @2102 /* ~If you do this, Imoen, I'll have to find another to take your place in the group.  It will be...goodbye.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",2) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
		++ @2123 /* ~Can you wait a few days, Imoen?  I really need you right now.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",3) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
	END

	IF ~Global("#L_TalkedToDukes","GLOBAL",2) !InPartyAllowDead("IMOEN2") Global("#L_LiiaInstalled","GLOBAL",0) Global("#L_ImTrainRsp","MYAREA",0)~ THEN BEGIN LIIA_2
		SAY @2112 /* ~<CHARNAME>, I wanted to let you know that your friend Imoen is staying with me to study magic.~ */
		= @2113 /* ~Feel free to visit her on the 3rd floor whenever you'd like.~ */
		++ @2114 /* ~Thank you.  I'll do that.~ */ DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImoenInPalace","GLOBAL",1) MoveGlobal("#LBD0103","IMOEN2",[960.680])~ EXIT
		++ @2115 /* ~Maybe...someday.~ */ DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImoenInPalace","GLOBAL",1) MoveGlobal("#LBD0103","IMOEN2",[960.680])~ EXIT
	END

	IF ~Global("#L_TalkedToDukes","GLOBAL",2) !InPartyAllowDead("IMOEN2") Global("#L_LiiaInstalled","GLOBAL",1) Global("#L_ImTrainRsp","MYAREA",0)~ THEN BEGIN LIIA_2
		SAY @2118 /* ~<CHARNAME>, if you see your friend Imoen, let her know she is free to train in magic with me, if she's interested.~ */
		IF ~~ EXIT
	END

	IF ~Global("#L_TalkedToDukes","GLOBAL",2) InPartyAllowDead("IMOEN2") !IsValidForPartyDialogue("IMOEN2") Global("#L_ImTrainRsp","MYAREA",0)~ THEN BEGIN LIIA_3
		SAY @2117 /* ~One moment <CHARNAME>, I need to speak with Imoen.~ */
		IF ~~ DO ~ApplySpellRES("IMOEN2","bdresurr") ApplySpellRES("IMOEN2","bddispel") ApplySpellRES("IMOEN2","sppr713")~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",2) !Global("#L_ImoenInPalace","GLOBAL",1) IsGabber("IMOEN2")~ THEN BEGIN LIIA_99a
		SAY @2119 /* ~Greetings Imoen.  Have you come about magic training?~ */
		++ @2101 /* ~Go ahead, Imoen.  You've always wanted this.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",1) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
		++ @2102 /* ~If you do this, Imoen, I'll have to find another to take your place in the group.  It will be...goodbye.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",2) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
		++ @2123 /* ~Can you wait a few days, Imoen?  I really need you right now.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",3) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",2) !Global("#L_ImoenInPalace","GLOBAL",1) !IsGabber("IMOEN2")~ THEN BEGIN LIIA_99b
		SAY @2120 /* ~Greetings, <GABBER>.  Is Imoen ready to train in magic with me?~ */
		++ @2101 /* ~Go ahead, Imoen.  You've always wanted this.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",1) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
		++ @2102 /* ~If you do this, Imoen, I'll have to find another to take your place in the group.  It will be...goodbye.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",2) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
		++ @2123 /* ~Can you wait a few days, Imoen?  I really need you right now.~ */ DO ~SetGlobal("#L_ImTrainRsp","MYAREA",3) ActionOverride("IMOEN2",StartDialogueNoSet(Player1))~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",2) Global("#L_ImoenInPalace","GLOBAL",1)~ THEN BEGIN LIIA_HELLO_AGAIN
		SAY @2057 /* ~Greetings, <GABBER>.  It's a pleasure to see you again.~ */
		IF ~~ THEN EXIT
	END
END

REPLACE_TRIGGER_TEXT IMOEN2J ~Global("EndofBG1","GLOBAL",0)~ ~Global("EndofBG1","GLOBAL",0) Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_TRIGGER_TEXT IMOENP_ ~HappinessLT(Myself,UNHAPPY_ANGRY_BOUNDARY)~ ~HappinessLT(Myself,UNHAPPY_ANGRY_BOUNDARY) Global("KickedOut","LOCALS",0)~

APPEND IMOENP_
	IF ~Global("#L_ImoenInPalace","GLOBAL",1) AreaCheck("#LBD0103") Global("KickedOut","LOCALS",2)~ THEN BEGIN IMOEN_IN_ROOM
		SAY @2127 /* ~Oh, hello <CHARNAME>!  I can't talk right now.  I have to memorize this list of spells!~ */
		= @2128 /* ~Who knew this magic stuff was so much actual work?!~ */
		++ @2129 /* ~I'll leave you to it, then.~ */ EXIT
	END
END

APPEND IMOEN2J
	IF ~Global("#L_ImTrainRsp","MYAREA",1)~ THEN BEGIN IMOEN_LIIA_1
		SAY @2103 /* ~You will come visit, <CHARNAME>!  Promise!~ */
		= @2104 /* ~Oh!  Here's my equipment.  I won't need it while studying magic.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ImTrainRsp","MYAREA",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_MSG_4a
		IF ~InMyArea("LIIA")~ THEN DO ~SetGlobal("#L_ImTrainRsp","MYAREA",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_LIIA_4a
	END

	IF~OR(2) Global("#L_ImTrainRsp","MYAREA",3) Global("#L_ImTrainRsp","MYAREA",2) Global("#L_LiiaInstalled","GLOBAL",0)~ THEN BEGIN IMOEN_LIIA_2b
		SAY @2116 /* ~Sorry <CHARNAME>.  I've wanted to do this my whole life!~ */
		= @2103 /* ~You will come visit, <CHARNAME>!  Promise!~ */
		= @2104 /* ~Oh!  Here's my equipment.  I won't need it while studying magic.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ImTrainRsp","MYAREA",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_LIIA_4a
	END
END

CHAIN	
	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) Global("#L_ImTrainRsp","MYAREA",2) Global("#L_LiiaInstalled","GLOBAL",1)~ THEN IMOEN2J IMOEN_LIIA_2a
		@2110 /* ~I appreciate the offer, Grand Duke Jannath, but my place is here with <CHARNAME>.  Someone has to keep <PRO_HIMHER> out of trouble!~ */
		DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","MYAREA",99)~
		== LIIA @2111 /* ~As you wish, child.  Come see me if you change your mind.~ */  
EXIT

CHAIN
	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) Global("#L_ImTrainRsp","MYAREA",3) Global("#L_LiiaInstalled","GLOBAL",1)~ THEN IMOEN2J IMOEN_LIIA_3
		@2124 /* ~I'm sorry, Grand Duke Jannath.  I really appreciate the offer, but <CHARNAME> needs me for a little while longer.~ */
		DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","MYAREA",99)~
		== LIIA @2125 /* ~As you will, Imoen. Come see me when you're ready.~ */ 
EXIT

CHAIN
	IF ~~ THEN IMOEN2J IMOEN_LIIA_4a
		@2121 /* ~I can hardly wait to get started!  See ya!~ */
	END
	// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
	+ ~PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(1500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(5000) !PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(10000) !PartyGoldLT(5000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(20000) !PartyGoldLT(10000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(5000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(30000) !PartyGoldLT(20000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(10000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(40000) !PartyGoldLT(30000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(15000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(50000) !PartyGoldLT(40000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(20000))~ + IMOEN_LIIA_4b
	+ ~!PartyGoldLT(50000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(25000))~ + IMOEN_LIIA_4b

CHAIN
	IF ~~ THEN IMOEN2J IMOEN_LIIA_4b
		@2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		== LIIA @2122 /* ~You'll be staying on the 3rd floor, Imoen.  <CHARNAME> can visit you there whenever <PRO_HESHE> wants.~ */	
		DO  ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","MYAREA",6) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",LeaveParty()) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~
	END
	++ @2108 /* ~Good luck, Imoen.  I'll come visit!~ */ EXIT
	++ @2109 /* ~Good bye, Imoen.  Good luck.~ */  EXIT
	++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ EXIT

CHAIN
	IF ~~ THEN IMOEN2J IMOEN_MSG_4a
		@2121 /* ~I can hardly wait to get started!  See ya!~ */
	END
	// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
	+ ~PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(1500))~ + IMOEN_MSG_4b
	+ ~PartyGoldLT(5000) !PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2000))~ + IMOEN_MSG_4b
	+ ~PartyGoldLT(10000) !PartyGoldLT(5000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2500))~ + IMOEN_MSG_4b
	+ ~PartyGoldLT(20000) !PartyGoldLT(10000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(5000))~ + IMOEN_MSG_4b
	+ ~PartyGoldLT(30000) !PartyGoldLT(20000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(10000))~ + IMOEN_MSG_4b
	+ ~PartyGoldLT(40000) !PartyGoldLT(30000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(15000))~ + IMOEN_MSG_4b
	+ ~PartyGoldLT(50000) !PartyGoldLT(40000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(20000))~ + IMOEN_MSG_4b
	+ ~!PartyGoldLT(50000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(25000))~ + IMOEN_MSG_4b

CHAIN
	IF ~~ THEN IMOEN2J IMOEN_MSG_4b
		@2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		== ~#LFFEsc1~ @2122 /* ~You'll be staying on the 3rd floor, Imoen.  <CHARNAME> can visit you there whenever <PRO_HESHE> wants.~ */	
		DO  ~SetGlobal("#L_ImTrainRsp","MYAREA",6) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",LeaveParty()) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea()) ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~
	END
	++ @2108 /* ~Good luck, Imoen.  I'll come visit!~ */ EXIT
	++ @2109 /* ~Good bye, Imoen.  Good luck.~ */  EXIT
	++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ EXIT

