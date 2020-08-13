///////////////////////////////////////////////////////
// Puts upper limits on rumor quests being opened    //
// Especially those for chapter 7 which is very long //
// Compiled via close_quests.tpa                     //
///////////////////////////////////////////////////////

// BALUDR'S GATE
ALTER_TRANS RBALDU
	BEGIN 0 1 2 10 16 17 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",7) Global("EnteredPalace","GLOBAL",0)~ END

ALTER_TRANS RBALDU
	BEGIN 3 9 END 	// Closed in chapter 5 when Eltan sends you to CandleKeep
	BEGIN 0 END
	BEGIN "TRIGGER" ~GlobalLT("HelpEltan","GLOBAL",2)~ END

ALTER_TRANS RBALDU
	BEGIN 4 13 END 	// Closed when Eltan brought to Harbor Master
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",7) Global("BroughtEltan","GLOBAL",0)~ END

ALTER_TRANS RBALDU
	BEGIN 6 7 8 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~GlobalLT("Chapter","GLOBAL",8) Global("EnteredPalace","GLOBAL",0)~ END

ALTER_TRANS RBALDU
	BEGIN 15 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~GlobalLT("ScarMission","GLOBAL",5)~ END

// FRIENDLY ARM INN
ALTER_TRANS RFRIEN
	BEGIN 1 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",7) Global("EnteredPalace","GLOBAL",0)~ END

ALTER_TRANS RFRIEN
	BEGIN 3 4 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~GlobalLT("Chapter","GLOBAL",8) Global("EnteredPalace","GLOBAL",0)~ END

// BEREGOST
ALTER_TRANS RBEREG
	BEGIN 1	16 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",7) Global("EnteredPalace","GLOBAL",0)~ END

ALTER_TRANS RBEREG
	BEGIN 3 17 18 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~GlobalLT("Chapter","GLOBAL",8) Global("EnteredPalace","GLOBAL",0)~ END

// NASHKEL
ALTER_TRANS RNASHK
	BEGIN 2 3 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~GlobalLT("Chapter","GLOBAL",8) Global("EnteredPalace","GLOBAL",0)~ END

// TOWN FOLK
ALTER_TRANS FTOWBA
	BEGIN 4 END
	BEGIN 0 END
	BEGIN "ACTION" ~~ END

// This isn't a rumor - but it will never close so putting it in as completed
ALTER_TRANS DORNJ
	BEGIN 1117 1118 END
	BEGIN 0 END
	BEGIN "ACTION" ~AddJournalEntry(228458,QUEST_DONE)~ END