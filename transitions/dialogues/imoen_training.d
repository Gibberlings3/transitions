//////////////////////////////////////////////////////////
// Changes to Imoen's dialogues about training in magic //
// Patched via main_common.tpa                          //
//////////////////////////////////////////////////////////

REPLACE_TRIGGER_TEXT %IMOEN_JOINED% ~Global("EndofBG1","GLOBAL",0)~ ~Global("EndofBG1","GLOBAL",0) Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_ACTION_TEXT %IMOEN_POST% ~!ActionOverride("imoen",JoinParty())~ ~!ActionOverride("%IMOEN_DV%",JoinParty())~
EXTEND_BOTTOM %IMOEN_POST% 2 #2 
	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",2) Global("#L_ImoenAskedToTrain","GLOBAL",1)~ THEN REPLY @2322	/* ~I won't need you for a while.  Why don't you go see Duke Jannath for magic training. */ + IMOEN_TRAIN_1
	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",2) Global("#L_ImoenAskedToTrain","GLOBAL",0)~ THEN REPLY @2529 /* ~I wanted to let you know that Duke Jannath has offered to train you in magic over at the Ducal Palace.~ */ + IMOEN_TRAIN_LEARNED
END

APPEND %IMOEN_POST%
	IF WEIGHT #-999 ~Global("#L_ImoenInPalace","GLOBAL",1) AreaCheck("#LBD0103") Global("KickedOut","LOCALS",2)~ THEN BEGIN IMOEN_IN_ROOM
		SAY @2127 /* ~Oh, hello <CHARNAME>!  I can't talk right now.  I have to memorize this list of spells!~ */
		= @2128 /* ~Who knew this magic stuff was so much actual work?!~ */
		++ @2129 /* ~I'll leave you to it, then.~ */ EXIT
	END

	IF WEIGHT #-997 ~Global("EndOfBG1","GLOBAL",0) GlobalGT("#L_TalkedToDukes","GLOBAL",2) Global("KickedOut","LOCALS",0) HappinessLT(Myself,UNHAPPY_ANGRY_BOUNDARY)~ THEN BEGIN IMOEN_ANGRY_TRAIN
		SAY @2320 /* ~Fine!  Be that way!  I have a better place to be, anyway!~ */
		// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
		// @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ 
		+ ~PartyGoldLT(4000) NumInParty(2)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(5000) NumInParty(3)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(6000) NumInParty(4)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(7000) NumInParty(5)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(8000) NumInParty(6)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(5000) !PartyGoldLT(4000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(7000) !PartyGoldLT(5000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(9000) !PartyGoldLT(6000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(11000) !PartyGoldLT(7000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(13000) !PartyGoldLT(8000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(5500) !PartyGoldLT(5000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(8000) !PartyGoldLT(7000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(10500) !PartyGoldLT(9000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(13000) !PartyGoldLT(11000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(15500) !PartyGoldLT(13000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(10000) !PartyGoldLT(5500) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(15000) !PartyGoldLT(8000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(20000) !PartyGoldLT(10500) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(25000) !PartyGoldLT(13000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(30000) !PartyGoldLT(15500) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(20000) !PartyGoldLT(10000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(30000) !PartyGoldLT(15000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(40000) !PartyGoldLT(20000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(50000) !PartyGoldLT(25000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(60000) !PartyGoldLT(30000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(30000) !PartyGoldLT(20000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(45000) !PartyGoldLT(30000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(60000) !PartyGoldLT(40000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(75000) !PartyGoldLT(50000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(90000) !PartyGoldLT(60000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(40000) !PartyGoldLT(30000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(60000) !PartyGoldLT(45000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(80000) !PartyGoldLT(60000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(100000) !PartyGoldLT(75000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(120000) !PartyGoldLT(90000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(50000) !PartyGoldLT(40000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(75000) !PartyGoldLT(60000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(100000) !PartyGoldLT(80000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(125000) !PartyGoldLT(100000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2b
		+ ~PartyGoldLT(150000) !PartyGoldLT(120000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2b
		+ ~!PartyGoldLT(50000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2b
		+ ~!PartyGoldLT(75000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2b
		+ ~!PartyGoldLT(100000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2b
		+ ~!PartyGoldLT(125000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2b
		+ ~!PartyGoldLT(150000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2b
	END

	IF WEIGHT #-998 ~Global("EndOfBG1","GLOBAL",0) GlobalGT("#L_TalkedToDukes","GLOBAL",2) Global("KickedOut","LOCALS",0) !HappinessLT(Myself,UNHAPPY_ANGRY_BOUNDARY)~ THEN BEGIN IMOEN_ASK_TRAIN
		SAY @2318 /* ~Ya know, <CHARNAME>, I'd really like to take Duke Liia up on her magic training offer.~ */
		= @2319	/* ~If you don't need me any more, I'm going to go talk to her.~ */
		++ @2101 /* ~Go ahead, Imoen.  You've always wanted this.~ */ + IMOEN_TRAIN_1
		++ @2321 /* ~No, I'll be right back, don't go anywhere.~ */ DO ~ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",1))~ EXIT
	END	

	IF ~~ THEN BEGIN IMOEN_TRAIN_LEARNED
		SAY @2530 // ~Really? Actual magic training?! I'll go check that out right away! Thanks for letting me know!~
		IF ~~ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	END

	IF ~~ THEN IMOEN_TRAIN_1
		SAY @2121 /* ~I can hardly wait to get started!  See ya!~ */
		// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
		// @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ 
		+ ~PartyGoldLT(4000) NumInParty(2)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(5000) NumInParty(3)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(6000) NumInParty(4)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(7000) NumInParty(5)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(8000) NumInParty(6)~ +@2126 DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(5000) !PartyGoldLT(4000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(7000) !PartyGoldLT(5000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(9000) !PartyGoldLT(6000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(11000) !PartyGoldLT(7000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(13000) !PartyGoldLT(8000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(5500) !PartyGoldLT(5000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(8000) !PartyGoldLT(7000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(10500) !PartyGoldLT(9000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(13000) !PartyGoldLT(11000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(15500) !PartyGoldLT(13000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(10000) !PartyGoldLT(5500) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(15000) !PartyGoldLT(8000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(20000) !PartyGoldLT(10500) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(25000) !PartyGoldLT(13000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(30000) !PartyGoldLT(15500) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(20000) !PartyGoldLT(10000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(30000) !PartyGoldLT(15000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(40000) !PartyGoldLT(20000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(50000) !PartyGoldLT(25000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(60000) !PartyGoldLT(30000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(30000) !PartyGoldLT(20000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(45000) !PartyGoldLT(30000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(60000) !PartyGoldLT(40000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(75000) !PartyGoldLT(50000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(90000) !PartyGoldLT(60000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(40000) !PartyGoldLT(30000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(60000) !PartyGoldLT(45000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(80000) !PartyGoldLT(60000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(100000) !PartyGoldLT(75000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(120000) !PartyGoldLT(90000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(50000) !PartyGoldLT(40000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(75000) !PartyGoldLT(60000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(100000) !PartyGoldLT(80000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(125000) !PartyGoldLT(100000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2a
		+ ~PartyGoldLT(150000) !PartyGoldLT(120000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_TRAIN_2a
		+ ~!PartyGoldLT(50000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2a
		+ ~!PartyGoldLT(75000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2a
		+ ~!PartyGoldLT(100000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2a
		+ ~!PartyGoldLT(125000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2a
		+ ~!PartyGoldLT(150000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_TRAIN_2a
	END

	IF ~~ THEN IMOEN_TRAIN_2a
		SAY @2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		++ @2108 /* ~Good luck, Imoen.  I'll come visit!~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		++ @2109 /* ~Good bye, Imoen.  Good luck.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	END

	IF ~~ THEN IMOEN_TRAIN_2b
		SAY @2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		++ @2109 /* ~Good bye, Imoen.  Good luck.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		++ @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	END
END

APPEND %IMOEN_JOINED%
	IF WEIGHT #-999 ~Global("#L_ImTrainRsp","GLOBAL",1)~ THEN BEGIN IMOEN_TRAINING_RSP_1
		SAY @2103 /* ~You will come visit, <CHARNAME>!  Promise!~ */
		= @2104 /* ~Oh!  Here's my equipment.  I won't need it while studying magic.~ */
		IF ~~ THEN DO ~SetGlobal("#L_ImTrainRsp","GLOBAL",4) ActionOverride("%IMOEN_DV%",GivePartyAllEquipment())~ + IMOEN_LIIA_4a
	END

	IF ~~ THEN IMOEN_ITEM_4a
		SAY @2121 /* ~I can hardly wait to get started!  See ya!~ */
		// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
		// @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ 
		// @2440 /* ~I'll visit in a couple weeks to see how you're doing, Imoen.~ */
		+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(4000) NumInParty(2)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(5000) NumInParty(3)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(6000) NumInParty(4)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(7000) NumInParty(5)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(8000) NumInParty(6)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(4000) NumInParty(2)~ +@2240 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(5000) NumInParty(3)~ +@2240 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(6000) NumInParty(4)~ +@2240 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(7000) NumInParty(5)~ +@2240 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(8000) NumInParty(6)~ +@2240 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~PartyGoldLT(5000) !PartyGoldLT(4000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(7000) !PartyGoldLT(5000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(9000) !PartyGoldLT(6000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(11000) !PartyGoldLT(7000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(13000) !PartyGoldLT(8000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(5500) !PartyGoldLT(5000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(8000) !PartyGoldLT(7000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(10500) !PartyGoldLT(9000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(13000) !PartyGoldLT(11000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(15500) !PartyGoldLT(13000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(10000) !PartyGoldLT(5500) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(15000) !PartyGoldLT(8000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(20000) !PartyGoldLT(10500) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(25000) !PartyGoldLT(13000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(30000) !PartyGoldLT(15500) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(20000) !PartyGoldLT(10000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(30000) !PartyGoldLT(15000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(40000) !PartyGoldLT(20000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(50000) !PartyGoldLT(25000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(60000) !PartyGoldLT(30000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(30000) !PartyGoldLT(20000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(45000) !PartyGoldLT(30000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(60000) !PartyGoldLT(40000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(75000) !PartyGoldLT(50000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(90000) !PartyGoldLT(60000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(40000) !PartyGoldLT(30000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(60000) !PartyGoldLT(45000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(80000) !PartyGoldLT(60000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(100000) !PartyGoldLT(75000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(120000) !PartyGoldLT(90000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(50000) !PartyGoldLT(40000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(75000) !PartyGoldLT(60000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(100000) !PartyGoldLT(80000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(125000) !PartyGoldLT(100000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_ITEM_4b
		+ ~PartyGoldLT(150000) !PartyGoldLT(120000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_ITEM_4b
		+ ~!PartyGoldLT(50000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_ITEM_4b
		+ ~!PartyGoldLT(75000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_ITEM_4b
		+ ~!PartyGoldLT(100000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_ITEM_4b
		+ ~!PartyGoldLT(125000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_ITEM_4b
		+ ~!PartyGoldLT(150000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_ITEM_4b
	END

	IF ~~ THEN IMOEN_ITEM_4b
		SAY @2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		+ ~Global("#L_StartCaelarAttack","GLOBAL",1)~ + @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",LeaveParty()) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
		+ ~!Global("#L_StartCaelarAttack","GLOBAL",1)~ + @2440	/* ~I'll visit in a couple weeks to see how you're doing, Imoen.~ */ DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",LeaveParty()) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	END
END

CHAIN	
	IF WEIGHT #-996 ~InMyArea("LIIA") Global("#L_ImTrainRsp","GLOBAL",2)~ THEN %IMOEN_JOINED% IMOEN_LIIA_TRAIN_RSP_2
		@2110 /* ~I appreciate the offer, Grand Duke Jannath, but my place is here with <CHARNAME>.  Someone has to keep <PRO_HIMHER> out of trouble!~ */
		DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","GLOBAL",99)~
		== LIIA @2111 /* ~As you wish, child.  Come see me if you change your mind.~ */ EXIT

CHAIN
	IF WEIGHT #-995 ~GlobalGT("#L_TalkedToDukes","GLOBAL",1) Global("#L_ImTrainRsp","GLOBAL",3)~ THEN %IMOEN_JOINED% IMOEN_LIIA_3
		@2124 /* ~I'm sorry, Grand Duke Jannath.  I really appreciate the offer, but <CHARNAME> needs me for a little while longer.~ */
		DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3) SetGlobal("#L_ImTrainRsp","GLOBAL",99)~
		== LIIA @2125 /* ~As you will, Imoen. Come see me when you're ready.~ */ EXIT

CHAIN
	IF ~~ THEN %IMOEN_JOINED% IMOEN_LIIA_4a
		@2121 /* ~I can hardly wait to get started!  See ya!~ */
	END
	// 2105 = /* ~Wait Imoen!  You've earned your share of the gold.  Take this.  But spend it wisely, kid!~ */
	// @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ 
	// @2440 /* ~I'll visit in a couple weeks to see how you're doing, Imoen.~ */
	+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(4000) NumInParty(2)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(5000) NumInParty(3)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(6000) NumInParty(4)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(7000) NumInParty(5)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(8000) NumInParty(6)~ +@2126 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(4000) NumInParty(2)~ +@2440 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(5000) NumInParty(3)~ +@2440 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(6000) NumInParty(4)~ +@2440 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(7000) NumInParty(5)~ +@2440 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~!Global("#L_StartCaelarAttack","GLOBAL",1) PartyGoldLT(8000) NumInParty(6)~ +@2440 DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~ EXIT
	+ ~PartyGoldLT(5000) !PartyGoldLT(4000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(7000) !PartyGoldLT(5000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(9000) !PartyGoldLT(6000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(11000) !PartyGoldLT(7000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(13000) !PartyGoldLT(8000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(1000)) ActionOverride("%IMOEN_DV%",DestroyGold(500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(5500) !PartyGoldLT(5000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(8000) !PartyGoldLT(7000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(10500) !PartyGoldLT(9000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(13000) !PartyGoldLT(11000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(15500) !PartyGoldLT(13000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2000)) ActionOverride("%IMOEN_DV%",DestroyGold(1000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(10000) !PartyGoldLT(5500) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(15000) !PartyGoldLT(8000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(20000) !PartyGoldLT(10500) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(25000) !PartyGoldLT(13000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(30000) !PartyGoldLT(15500) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(2500)) ActionOverride("%IMOEN_DV%",DestroyGold(1250))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(20000) !PartyGoldLT(10000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(30000) !PartyGoldLT(15000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(40000) !PartyGoldLT(20000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(50000) !PartyGoldLT(25000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(60000) !PartyGoldLT(30000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(5000)) ActionOverride("%IMOEN_DV%",DestroyGold(2500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(30000) !PartyGoldLT(20000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(45000) !PartyGoldLT(30000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(60000) !PartyGoldLT(40000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(75000) !PartyGoldLT(50000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(90000) !PartyGoldLT(60000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(10000)) ActionOverride("%IMOEN_DV%",DestroyGold(5000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(40000) !PartyGoldLT(30000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(60000) !PartyGoldLT(45000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(80000) !PartyGoldLT(60000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(100000) !PartyGoldLT(75000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(120000) !PartyGoldLT(90000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(15000)) ActionOverride("%IMOEN_DV%",DestroyGold(7500))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(50000) !PartyGoldLT(40000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(75000) !PartyGoldLT(60000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(100000) !PartyGoldLT(80000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(125000) !PartyGoldLT(100000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_LIIA_4b
	+ ~PartyGoldLT(150000) !PartyGoldLT(120000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(20000)) ActionOverride("%IMOEN_DV%",DestroyGold(10000))~ + IMOEN_LIIA_4b
	+ ~!PartyGoldLT(50000) NumInParty(2)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_LIIA_4b
	+ ~!PartyGoldLT(75000) NumInParty(3)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_LIIA_4b
	+ ~!PartyGoldLT(100000) NumInParty(4)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_LIIA_4b
	+ ~!PartyGoldLT(125000) NumInParty(5)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_LIIA_4b
	+ ~!PartyGoldLT(150000) NumInParty(6)~ +@2105 DO ~ActionOverride("%IMOEN_DV%",TakePartyGold(25000)) ActionOverride("%IMOEN_DV%",DestroyGold(12500))~ + IMOEN_LIIA_4b


CHAIN
	IF ~~ THEN %IMOEN_JOINED% IMOEN_LIIA_4b
		@2106 /* ~I'm NOT a kid!  Oooo, that's a lot of gold.  I'm a rich kid!~ */
		= @2107 /* ~Goodbye, <CHARNAME>.  Thanks for everything.~ */
		== LIIA @2122 /* ~You'll be staying on the 3rd floor, Imoen.  <CHARNAME> can visit you there whenever <PRO_HESHE> wants.~ */	
		DO  ~SetGlobal("#L_LiiaInformedPC","MYAREA",1) SetGlobal("#L_ImTrainRsp","GLOBAL",6) SetGlobal("#L_ImoenInPalace","GLOBAL",1) ActionOverride("%IMOEN_DV%",LeaveParty()) ActionOverride("%IMOEN_DV%",SetGlobal("KickedOut","LOCALS",2)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",CLASS)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",DEFAULT)) ActionOverride("%IMOEN_DV%",ChangeAIScript("",OVERRIDE)) ActionOverride("%IMOEN_DV%",SetNumTimesTalkedTo(1)) ActionOverride("%IMOEN_DV%",EscapeAreaMove("#LBD0103",960,680,N))~
	END
	+ ~GlobalGT("#L_StartCaelarAttack","GLOBAL",1)~ + @2440 /* ~I'll visit in a couple weeks to see how you're doing, Imoen.~ */ DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND)~ EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",0)~ + @2108 /* ~Good luck, Imoen.  I'll come visit!~ */ EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",0)~ + @2109 /* ~Good bye, Imoen.  Good luck.~ */  EXIT
	+ ~GLOBAL("#L_StartCaelarAttack","GLOBAL",0)~ + @2126 /* ~See ya, kid.  Try not to burn down the place.~ */  EXIT
	+ ~Global("#L_StartCaelarAttack","GLOBAL",1)~ + @2126 /* ~See ya, kid.  Try not to burn down the place.~ */ DO ~SetGlobalTimer("#L_SoloExitTimer","GLOBAL",ONE_ROUND)~ EXIT

