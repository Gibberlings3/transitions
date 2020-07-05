//////////////////////////////////////////////////////////
// Changes to Imoen's dialogues about training in magic //
// Patched via main_common.tpa                          //
//////////////////////////////////////////////////////////

REPLACE_TRIGGER_TEXT IMOEN2J ~Global("EndofBG1","GLOBAL",0)~ ~Global("EndofBG1","GLOBAL",0) Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_ACTION_TEXT IMOENP_ ~!ActionOverride("imoen",JoinParty())~ ~!ActionOverride("imoen2",JoinParty())~
EXTEND_TOP IMOENP_ 2 #2 
	IF ~GlobalGT("#L_ImTrainRsp","GLOBAL",0)~ THEN 
		REPLY @2322	/* ~I won't need you for a while.  Why don't you go see Duke Jannath for magic training. */ + SEE_YA
	END

APPEND IMOENP_
	IF WEIGHT #-999 ~Global("#L_ImoenInPalace","GLOBAL",1) AreaCheck("#LBD0103") Global("KickedOut","LOCALS",2)~ THEN BEGIN IMOEN_IN_ROOM
		SAY @2127 /* ~Oh, hello <CHARNAME>!  I can't talk right now.  I have to memorize this list of spells!~ */
		= @2128 /* ~Who knew this magic stuff was so much actual work?!~ */
		++ @2129 /* ~I'll leave you to it, then.~ */ EXIT
	END

	IF WEIGHT #-997 ~Global("EndOfBG1","GLOBAL",0) GlobalGT("#L_ImTrainRsp","GLOBAL",0) Global("KickedOut","LOCALS",0) HappinessLT(Myself,UNHAPPY_ANGRY_BOUNDARY)~ THEN BEGIN IMOEN_ANGRY_TRAIN
		SAY @2320 /* ~Fine!  Be that way!  I have a better place to be, anyway!~ */
		// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
		+ ~PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(1500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(5000) !PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(10000) !PartyGoldLT(5000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(20000) !PartyGoldLT(10000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(5000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(30000) !PartyGoldLT(20000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(10000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(40000) !PartyGoldLT(30000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(15000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(50000) !PartyGoldLT(40000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(20000))~ + IMOEN_TRAIN_2b
		+ ~!PartyGoldLT(50000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(25000))~ + IMOEN_TRAIN_2b
	END

	IF WEIGHT #-998 ~Global("EndOfBG1","GLOBAL",0) GlobalGT("#L_ImTrainRsp","GLOBAL",0) Global("KickedOut","LOCALS",0) !HappinessLT(Myself,UNHAPPY_ANGRY_BOUNDARY)~ THEN BEGIN IMOEN_ASK_TRAIN
		SAY @2318 /* ~Ya know, <CHARNAME>, I'd really like to take Duke Liia up on her magic training offer.~ */
		= @2319	/* ~If you don't need me any more, I'm going to go talk to her.~ */
		++ @2101 /* ~Go ahead, Imoen.  You've always wanted this.~ */ + IMOEN_TRAIN_1
		++ @2321 /* ~No, I'll be right back, don't go anywhere.~ */ DO ~ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",1))~ EXIT
	END	

	IF ~~ THEN IMOEN_TRAIN_1
		SAY @2121 /* ~I can hardly wait to get started!  See ya!~ */
		// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
		+ ~PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(1500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(5000) !PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(10000) !PartyGoldLT(5000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(20000) !PartyGoldLT(10000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(5000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(30000) !PartyGoldLT(20000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(10000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(40000) !PartyGoldLT(30000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(15000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(50000) !PartyGoldLT(40000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(20000))~ + IMOEN_TRAIN_2a
		+ ~!PartyGoldLT(50000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(25000))~ + IMOEN_TRAIN_2a
	END

	IF ~~ THEN IMOEN_TRAIN_2a
		SAY @2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		++ @2108 /* ~Good luck, Imoen.  I'll come visit!~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
		++ @2109 /* ~Good bye, Imoen.  Good luck.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
		++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
	END

	IF ~~ THEN IMOEN_TRAIN_2b
		SAY @2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		++ @2109 /* ~Good bye, Imoen.  Good luck.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
		++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
	END

	IF ~~ THEN SEE_YA
		SAY @2121 /* ~I can hardly wait to get started!  See ya!~ */
		IF ~~ THEN DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
	END
END

APPEND IMOEN2J
	IF WEIGHT #-999 ~Global("#L_ImTrainRsp","GLOBAL",1)~ THEN BEGIN IMOEN_TRAINING_RSP_1
		SAY @2103 /* ~You will come visit, <CHARNAME>!  Promise!~ */
		= @2104 /* ~Oh!  Here's my equipment.  I won't need it while studying magic.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_MSG_4a
		IF ~InMyArea("LIIA")~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_LIIA_4a
	END

	IF WEIGHT #-998 ~OR(2) Global("#L_ImTrainRsp","GLOBAL",3) Global("#L_ImTrainRsp","GLOBAL",2) Global("#L_LiiaInstalled","GLOBAL",0)~ THEN BEGIN IMOEN_MUST_TRAIN
		SAY @2116 /* ~Sorry <CHARNAME>.  I've wanted to do this my whole life!~ */
		= @2103 /* ~You will come visit, <CHARNAME>!  Promise!~ */
		= @2104 /* ~Oh!  Here's my equipment.  I won't need it while studying magic.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_MSG_4a
		IF ~InMyArea("LIIA")~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_LIIA_4a
	END

	IF WEIGHT #-997 ~GlobalGT("#L_StartCaelarAttack","GLOBAL",0) Global("EndofBG1","GLOBAL",1) OR(3) GlobalLT("#L_StartCaelarAttack","GLOBAL",3) !Global("C#IM_ImoenComesBackSoD","GLOBAL",0) !Global("C#IM_ImoenInSoD","GLOBAL",1)~ THEN BEGIN PRE_SOD_TRAIN
		SAY @2325 /* ~I've decided to take Duke Jannath up on her offer to train me in magic.~ */
		= @2116 /* ~Sorry <CHARNAME>.  I've wanted to do this my whole life!~ */
		= @2104 /* ~Oh!  Here's my equipment.  I won't need it while studying magic.~ */
		IF ~~ THEN DO ~ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_ITEM_4a
		IF ~InMyArea("#LFFEsc1")~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_MSG_4a
		IF ~InMyArea("LIIA")~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("IMOEN2",GivePartyAllEquipment())~ + IMOEN_LIIA_4a
	END

	IF ~~ THEN IMOEN_ITEM_4a
		SAY @2121 /* ~I can hardly wait to get started!  See ya!~ */
		// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
		+ ~PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(1500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(5000) !PartyGoldLT(4000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(10000) !PartyGoldLT(5000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(2500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(20000) !PartyGoldLT(10000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(5000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(30000) !PartyGoldLT(20000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(10000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(40000) !PartyGoldLT(30000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(15000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(50000) !PartyGoldLT(40000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(20000))~ + IMOEN_ITEM_4b
		+ ~!PartyGoldLT(50000)~ +@2105 DO ~ActionOverride("IMOEN2",TakePartyGold(25000))~ + IMOEN_ITEM_4b
	END

	IF ~~ THEN IMOEN_ITEM_4b
		SAY @2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		++ @2109 /* ~Good bye, Imoen.  Good luck.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",LeaveParty()) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
		++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",LeaveParty()) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~ EXIT
	END
END

CHAIN	
	IF WEIGHT #-996 ~InMyArea("LIIA") Global("#L_ImTrainRsp","GLOBAL",2) Global("#L_LiiaInstalled","GLOBAL",1)~ THEN IMOEN2J IMOEN_LIIA_TRAIN_RSP_2
		@2110 /* ~I appreciate the offer, Grand Duke Jannath, but my place is here with <CHARNAME>.  Someone has to keep <PRO_HIMHER> out of trouble!~ */
		DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","GLOBAL",99)~
		== LIIA @2111 /* ~As you wish, child.  Come see me if you change your mind.~ */ EXIT

CHAIN
	IF WEIGHT #-995 ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) Global("#L_ImTrainRsp","GLOBAL",3) Global("#L_LiiaInstalled","GLOBAL",1)~ THEN IMOEN2J IMOEN_LIIA_3
		@2124 /* ~I'm sorry, Grand Duke Jannath.  I really appreciate the offer, but <CHARNAME> needs me for a little while longer.~ */
		DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","GLOBAL",99)~
		== LIIA @2125 /* ~As you will, Imoen. Come see me when you're ready.~ */ EXIT

CHAIN	
	IF WEIGHT #-994 ~!InMyArea("LIIA") OR(2) Global("#L_ImTrainRsp","GLOBAL",2) Global("#L_ImTrainRsp","GLOBAL",3) Global("#L_LiiaInstalled","GLOBAL",1)~ THEN IMOEN2J IMOEN_MSG_TRAIN_RSP_2_OR_3
		@2313 /* ~Please give her my thanks but my place is here with <CHARNAME>.  Someone has to keep <PRO_HIMHER> out of trouble!~ */
		== ~#LFFEsc1~ @2145 /* ~As you wish.~ */ DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",99) ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~ EXIT

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
		DO  ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","GLOBAL",6) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",LeaveParty()) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea())~
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
		DO  ~SetGlobal("#L_ImTrainRsp","GLOBAL",6) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("IMOEN2",LeaveParty()) ActionOverride("IMOEN2",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("IMOEN2",ChangeAIScript("",CLASS)) ActionOverride("IMOEN2",ChangeAIScript("",DEFAULT)) ActionOverride("IMOEN2",ChangeAIScript("",OVERRIDE)) ActionOverride("IMOEN2",SetNumTimesTalkedTo(1)) ActionOverride("IMOEN2",EscapeArea()) ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~
	END
	++ @2108 /* ~Good luck, Imoen.  I'll come visit!~ */ EXIT
	++ @2109 /* ~Good bye, Imoen.  Good luck.~ */  EXIT
	++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ EXIT

