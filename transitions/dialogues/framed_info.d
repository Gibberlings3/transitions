/////////////////////////////////////////////////////////////
// Dialogue inside Chateau Irenicus about the end of SoD   //
// Kept separate so it can be imported into Transitions    //
// This is the only bit that will be used for Transitions  //
// Compiled via framed_info.tpa using framed_info.tra      //
/////////////////////////////////////////////////////////////

// This block doesn't end in a journal entry
ALTER_TRANS IDJINNI
	BEGIN 9 END 
	BEGIN 0 END
	BEGIN
		"TRIGGER" ~Global("#L_DestroyedDagger","GLOBAL",0) Global("#L_FramedQuest","GLOBAL",0) OR(2) Global("#L_EET","GLOBAL",0) Global("bd_player_exiled","GLOBAL",2)~  //Just give info - no dagger
		"EPILOGUE" ~GOTO NO_QUEST_FULL_INFO_NO_JOURNAL_1~	
	END
EXTEND_BOTTOM IDJINNI 9
	IF ~Global("#L_DestroyedDagger","GLOBAL",0) Global("#L_FramedQuest","GLOBAL",0) Global("#L_EET","GLOBAL",1) GlobalLT("bd_player_exiled","GLOBAL",2)~ THEN GOTO NO_QUEST_NO_INFO_NO_JOURNAL_1
	IF ~Global("#L_DestroyedDagger","GLOBAL",1) Global("#L_FramedQuest","GLOBAL",0) OR(2) Global("#L_EET","GLOBAL",0) Global("bd_player_exiled","GLOBAL",2)~ THEN GOTO LAVA_QUEST_FULL_INFO_NO_JOURNAL_1
	IF ~Global("#L_DestroyedDagger","GLOBAL",1) Global("#L_FramedQuest","GLOBAL",0) Global("#L_EET","GLOBAL",1) GlobalLT("bd_player_exiled","GLOBAL",2)~ THEN GOTO LAVA_QUEST_NO_INFO_NO_JOURNAL_1
END

// This one will end with a journal entry
ALTER_TRANS IDJINNI
	BEGIN 10 END 
	BEGIN 0 END
	BEGIN
		"TRIGGER" ~Global("#L_DestroyedDagger","GLOBAL",0) Global("#L_FramedQuest","GLOBAL",0) OR(2) Global("#L_EET","GLOBAL",0) Global("bd_player_exiled","GLOBAL",2)~  //Just give info - no dagger
		"EPILOGUE" ~GOTO NO_QUEST_FULL_INFO_JOURNAL_1~	
	END
EXTEND_BOTTOM IDJINNI 10
	IF ~Global("#L_DestroyedDagger","GLOBAL",0) Global("#L_FramedQuest","GLOBAL",0) Global("#L_EET","GLOBAL",1) GlobalLT("bd_player_exiled","GLOBAL",2)~ THEN GOTO NO_QUEST_NO_INFO_JOURNAL_1
	IF ~Global("#L_DestroyedDagger","GLOBAL",1) Global("#L_FramedQuest","GLOBAL",0) OR(2) Global("#L_EET","GLOBAL",0) Global("bd_player_exiled","GLOBAL",2)~ THEN GOTO LAVA_QUEST_FULL_INFO_JOURNAL_1
	IF ~Global("#L_DestroyedDagger","GLOBAL",1) Global("#L_FramedQuest","GLOBAL",0) Global("#L_EET","GLOBAL",1) GlobalLT("bd_player_exiled","GLOBAL",2)~ THEN GOTO LAVA_QUEST_NO_INFO_JOURNAL_1
END

// Give the soul dagger when the genie is freed
EXTEND_BOTTOM IDJINNI 12
	IF ~Global("#L_DestroyedDagger","GLOBAL",1) Global("#L_FramedQuest","GLOBAL",0)~ DO ~EraseJournalEntry(34099) EraseJournalEntry(47514) AddexperienceParty(15000) GivePartyAllEquipment() GiveItemCreate("l#2sda1",Player1,1,0,0) TakePartyItem("misc4d")~ SOLVED_JOURNAL #47515 GOTO 19
END

CHAIN  
	IF ~~ THEN IDJINNI NO_JOURNAL_2
		@2002 /* ~For the murder of Skie Silvershield.  He killed her and trapped her soul inside a soultaker dagger.~ */
		== %IMOEN_JOINED% IF ~IsValidForPartyDialogue("IMOEN2")~ @2003 /* ~Oh how awful!~ */
	END
	++ @2004 /*~But what makes them think I did it.~ */ + NO_JOURNAL_3

CHAIN  
	IF ~~ THEN IDJINNI JOURNAL_2
		@2002 /* ~For the murder of Skie Silvershield.  He killed her and trapped her soul inside a soultaker dagger.~ */
		== %IMOEN_JOINED% IF ~IsValidForPartyDialogue("IMOEN2")~ @2003 /* ~Oh how awful!~ */
	END
	++ @2004 /*~But what makes them think I did it.~ */ + JOURNAL_3


APPEND IDJINNI
	IF ~~ BEGIN NO_QUEST_FULL_INFO_NO_JOURNAL_1
		SAY @2000 /* ~It is unfortunate that I no longer am the keeper of the dagger the master used to frame you, or I would be able to offer it to you to sweeten the deal.~ */
		++ @2001 /* ~Frame me?  For what?~ */ + NO_JOURNAL_2
	END

	IF ~~ BEGIN NO_QUEST_FULL_INFO_JOURNAL_1
		SAY @2000 /* ~It is unfortunate that I no longer am the keeper of the dagger the master used to frame you, or I would be able to offer it to you to sweeten the deal.~ */
		++ @2001 /* ~Frame me?  For what?~ */ + JOURNAL_2
	END

	IF ~~ BEGIN LAVA_QUEST_FULL_INFO_NO_JOURNAL_1
		SAY @2007 /* ~To sweeten the deal, I will give you the dagger the master used to frame you.  I will have no use for it.~ */
		++ @2001 /* ~Frame me?  For what?~ */ + NO_JOURNAL_2
	END

	IF ~~ BEGIN LAVA_QUEST_FULL_INFO_JOURNAL_1
		SAY @2007 /* ~To sweeten the deal, I will give you the dagger the master used to frame you.  I will have no use for it.~ */
		++ @2001 /* ~Frame me?  For what?~ */ + JOURNAL_2
	END

	IF ~~ BEGIN NO_QUEST_NO_INFO_NO_JOURNAL_1
		SAY @2000 /* ~It is unfortunate that I no longer am the keeper of the dagger the master used to frame you, or I would be able to offer it to you to sweeten the deal.~ */
		= @2006 /* ~But unfortunately, I suspect the dagger has been destroyed since he no longer had any use for it.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ BEGIN NO_QUEST_NO_INFO_JOURNAL_1
		SAY @2000 /* ~It is unfortunate that I no longer am the keeper of the dagger the master used to frame you, or I would be able to offer it to you to sweeten the deal.~ */
		= @2006 /* ~But unfortunately, I suspect the dagger has been destroyed since he no longer had any use for it.~ */
  		IF ~~ THEN DO ~SetGlobal("HelpDjinni","GLOBAL",1)~ UNSOLVED_JOURNAL #34099 EXIT
	END

	IF ~~ BEGIN LAVA_QUEST_NO_INFO_NO_JOURNAL_1
		SAY @2007 /* ~To sweeten the deal, I will give you the dagger the master used to frame you.  I will have no use for it.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ BEGIN LAVA_QUEST_NO_INFO_JOURNAL_1
		SAY @2007 /* ~To sweeten the deal, I will give you the dagger the master used to frame you.  I will have no use for it.~ */
  		IF ~~ THEN DO ~SetGlobal("HelpDjinni","GLOBAL",1)~ UNSOLVED_JOURNAL #34099 EXIT
	END

	IF ~~ BEGIN NO_JOURNAL_3
		SAY @2005 /* ~How he managed to cause others to believe you were the one who killed her, I do not know.~ */
		IF ~Global("#L_DestroyedDagger","GLOBAL",0)~ GOTO NO_QUEST_NO_JOURNAL_4
		IF ~Global("#L_DestroyedDagger","GLOBAL",1)~ GOTO LAVA_QUEST_NO_JOURNAL_4
	END

	IF ~~ BEGIN JOURNAL_3
		SAY @2005 /* ~How he managed to cause others to believe you were the one who killed her, I do not know.~ */
		IF ~Global("#L_DestroyedDagger","GLOBAL",0)~ GOTO NO_QUEST_JOURNAL_4
		IF ~Global("#L_DestroyedDagger","GLOBAL",1)~ GOTO LAVA_QUEST_JOURNAL_4
	END

	IF ~~ BEGIN NO_QUEST_NO_JOURNAL_4
		SAY @2006 /* ~But unfortunately, I suspect the dagger has been destroyed since he no longer had any use for it.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ BEGIN LAVA_QUEST_NO_JOURNAL_4
		SAY @2008 /* ~I am protecting the dagger for the master.  If you free me, I will you give it and your weapon.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ BEGIN NO_QUEST_JOURNAL_4
		SAY @2006 /* ~But unfortunately, I suspect the dagger has been destroyed since he no longer had any use for it.~ */
  		IF ~~ THEN DO ~SetGlobal("HelpDjinni","GLOBAL",1)~ UNSOLVED_JOURNAL #34099 EXIT
	END

	IF ~~ BEGIN LAVA_QUEST_JOURNAL_4
		SAY @2008 /* ~I am protecting the dagger for the master.  If you free me, I will you give it and your weapon.~ */
  		IF ~~ THEN DO ~SetGlobal("HelpDjinni","GLOBAL",1)~ UNSOLVED_JOURNAL #34099 EXIT
	END

END
