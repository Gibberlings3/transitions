/////////////////////////////////////////////////////////////
// Duke Belt in the Ducal Palace after Sarevok is defeated //
// Patched in via main_common.tpa                          //
/////////////////////////////////////////////////////////////
APPEND BELT
	IF ~Global("#L_BG1SarevokDead","GLOBAL",1) Global("#L_TalkedToDukes","GLOBAL",0)~ THEN BEGIN BELT_1
		SAY @2034 /* ~Here <PRO_HESHE> is!  The <PRO_MANWOMAN> of the hour!  Welcome, <CHARNAME>!~ */
		= @2035	/* ~You are truly the Hero of Baldur's Gate.~ */
		IF ~~ + REWARD
		IF ~Global("#L_SwordTaken","GLOBAL",1)~ + SWORD_TAKEN1
	END

	IF ~~ THEN BEGIN SWORD_TAKEN1
		SAY @2036	/* ~News of your victory has already reached us, as has Sarevok's sword.~ */
		= @2037	/* ~Thank you for agreeing to let us keep it safe.~ */
		++ @2038 /* ~You're quite welcome.  I'm happy to oblige.~ */ + SWORD_TAKEN2
		++ @2039 /* ~I really didn't have much choice in the matter.~ */ + SWORD_TAKEN2
	END

	IF ~~ THEN BEGIN SWORD_TAKEN2
		SAY @2040 /* ~Be that as it may, we would like to reimburse you for the sword and reward you for saving this city.~ */
		= @2041 /* ~I believe 3000 gold should cover the value of the sword.~ */
		++ @2042 /* ~That should more than cover it, thank you.~ */ DO ~GiveGoldForce(3000) Wait(1)~ + REWARD
		++ @2043 /* ~I guess that's a fair price.~ */ DO ~GiveGoldForce(3000) Wait(1)~ + REWARD
	END

	IF ~~ THEN BEGIN REWARD
		SAY @2044 /* ~As your reward for saving our city, we have made accommodations for you here within the Ducal Palace.~ */
		= @2045 /* ~Please feel free to come and go as you wish.~ */
		++ @2046 /* ~That's very generous of you.  Thank you!~ */ + ROOM_GOOD
		++ @2047 /* ~That's it?  Sarevok was going to be a Duke and I get a room with a view?  ::sigh:: Fine.  I'll take it.~ */ + ROOM_SOSO
		++ @2048 /* ~Thank you, but no thank you.  I'm not planning on staying in Baldur's Gate.~ */ + NO_ROOM
		++ @2049 /* ~Seriously?  You were going to make Sarevok a duke for simply *promising* to stop the trouble he himself started.  The very same trouble that I *actually* stopped...and I get a room with a view?  Your generousity is underwhelming to say the least.  Keep your accommodations.~ */ + ROOM_BAD
	END

	IF ~~ THEN BEGIN ROOM_SOSO
		SAY @2050 /* ~I'm sorry we can't be more generous at this time.~ */
		IF ~~ THEN + ROOM_GOOD
	END

	IF ~~ THEN BEGIN ROOM_GOOD
		SAY @2051 /* ~Your suite is on the third floor.  A servant will be there to show you around.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2) SetGlobal("#L_AcceptedRoom","GLOBAL",1)~ EXIT
		IF ~Global("#L_EltanInstalled","GLOBAL",1)~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",1) SetGlobal("#L_AcceptedRoom","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN BEGIN NO_ROOM
		SAY @2052 /* ~I'm sorry to hear that.  Please let me know if you change your mind.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3)~ EXIT
		IF ~InMyArea("LIIA")~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~InMyArea("BDELTAN")~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN BEGIN ROOM_BAD
		SAY @2053 /* ~I'm sorry you feel that way.  Please let me know if you change your mind.~ */
		IF ~~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",3)~ EXIT
		IF ~InMyArea("LIIA")~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",2)~ EXIT
		IF ~InMyArea("BDELTAN")~ THEN DO ~SetGlobal("#L_TalkedToDukes","GLOBAL",1)~ EXIT
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",0) Global("#L_SarvQuestsInProg","GLOBAL",2) Global("#L_AcceptedRoom","GLOBAL",0)~ THEN BEGIN BELT_2_1
		SAY @2054 /* ~Hello again, <CHARNAME>.  Have you changed your mind?~ */
		++ @2055 /* ~No, I haven't.  Goodbye.~ */ + NO_CHANGE
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2056 /* ~Yes, I'll take the room.~ */ + ROOM_TAKEN
	END

	IF ~~ THEN BEGIN NO_CHANGE
		SAY @2052 /* ~I'm sorry to hear that.  Please let me know if you change your mind.~ */
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN ROOM_TAKEN
		SAY @2051 /* ~Your suite is on the third floor.  A servant will be there to show you around.~ */
		IF ~~ THEN DO ~SetGlobal("#L_AcceptedRoom","GLOBAL",1)~ EXIT
		IF ~Global("#L_SarvQuests","GLOBAL",99) Global("#L_GroupSplit","GLOBAL",0)~ + BELT_QUESTS_ALL_DONE
	END

	IF ~GlobalGT("#L_TalkedToDukes","GLOBAL",0) Global("#L_SarvQuestsInProg","GLOBAL",2) Global("#L_AcceptedRoom","GLOBAL",1)~ THEN BEGIN BELT_HELLO
		SAY @2057 /* ~Greetings, <GABBER>.  It's a pleasure to see you again.~ */
		IF ~~ THEN EXIT
	END

	IF ~Global("#L_TalkedToDukes","GLOBAL",3) GlobalGT("#L_QuestMsgSent","GLOBAL",0) GlobalTimerExpired("#L_QuestTimer","GLOBAL") Global("#L_SarvQuestsInProg","GLOBAL",0)~ THEN BEGIN BELT_TOO_LATE
		SAY @2245 /* ~We were going to hire you to bring in the remaining followers of Sarevok, but time was of the essence and we couldn't wait.  We found someone else to clean up the mess.~ */
		++ @2246 /* ~Good.  Hopefully that means the assassination attempts will stop.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",99)~ + BELT_QUESTS_ALL_DONE
	END

	IF ~Global("#L_SarvQuestsInProg","GLOBAL",1) GlobalGT("#L_QuestMsgSent","GLOBAL",0) GlobalTimerExpired("#L_QuestTimer","GLOBAL")~ THEN BEGIN BELT_QUEST_50_LATE
		SAY @2244 /* ~I'm sorry, <CHARNAME>, we waited for you as long as we could. We've found someone else to bring in the rest of Sarevok's followers.~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",2)~ + ROOM_TAKEN
		++ @2246 /* ~Good.  Hopefully that means the assassination attempts will stop.~ */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",2)~ + BELT_QUESTS_ALL_DONE
	END	

	IF ~Global("#L_TalkedToDukes","GLOBAL",3) OR(2) Global("#L_QuestMsgSent","GLOBAL",0) !GlobalTimerExpired("#L_QuestTimer","GLOBAL") Global("#L_SarvQuests","GLOBAL",0)~ THEN BEGIN BELT_BEGIN_QUESTS
		SAY @2130 /* ~<CHARNAME>, if you have the time, I'd like your help in rounding up the last of the Sarevok's supporters.~ */
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest1","MYAREA",0) !Dead("GALDOR")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",1) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_1a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest2","MYAREA",0) !Dead("Tazok") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",2) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_2a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest3","MYAREA",0) !Dead("SEMAJ") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",3) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_3a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest4","MYAREA",0) !Dead("winski2") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",4) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_4a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest5","MYAREA",0) !Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",5) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_5a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest6","MYAREA",0) !Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",6) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_6a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest7","MYAREA",0) OR(6) !Dead("ZHALIMAR") !Dead("GARDUSH") !Dead("NAAMAN") !Dead("DIYAB") !Dead("AASIM") !Dead("ALAI") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",7) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_7a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1) OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ZHALIMAR") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("GARDUSH") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("NAAMAN") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("DIYAB") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("AASIM") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ALAI")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
		++ @2137 /* ~I have things to wrap up first.  I'll be back when I'm ready to take on more work.~ */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",1) SetGlobal("#L_SarvQuests","GLOBAL",50) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUESTS_LATER
		++ @2138 /* ~I'm not a bounty hunter.  I'm afraid you'll have to hire someone else.  I'll be on my way now.~ */ + BELT_QUESTS_SKIP_ALL
	END

	IF ~~ THEN BELT_QUESTS_LATER
		SAY @2143 /* ~Very well.  Let me know when you are ready.~ */ 
		IF ~~ THEN DO ~SetGlobal("#L_SarvQuests","GLOBAL",50)~ EXIT
	END

	IF ~~ THEN BELT_QUESTS_SKIP_ALL
		SAY @2145 /* ~As you wish.~ */
		IF ~~ THEN DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",2) SetGlobal("#L_SarvQuests","GLOBAL",99) SetGlobalTimer("#L_SoDNotBefore","GLOBAL",FIFTEEN_DAYS)~+ BELT_QUESTS_ALL_DONE
	END

	IF ~Global("#L_SarvQuests","GLOBAL",50) !IsGabber(Player1)~ THEN BEGIN BELT_QUEST_50a
		SAY @2146 /* ~Hello again, <GABBER>.  Is <CHARNAME> ready to help us clear up the rest of Sarevok's supporters? */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest1","MYAREA",0) !Dead("GALDOR")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",1) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_1a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest2","MYAREA",0) !Dead("Tazok") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",2) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_2a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest3","MYAREA",0) !Dead("SEMAJ") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",3) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_3a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest4","MYAREA",0) !Dead("winski2") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",4) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_4a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest5","MYAREA",0) !Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",5) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_5a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest6","MYAREA",0) !Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",6) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_6a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest7","MYAREA",0) OR(6) !Dead("ZHALIMAR") !Dead("GARDUSH") !Dead("NAAMAN") !Dead("DIYAB") !Dead("AASIM") !Dead("ALAI") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",7) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_7a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1) OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ZHALIMAR") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("GARDUSH") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("NAAMAN") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("DIYAB") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("AASIM") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ALAI")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
		++ @2137 /* ~I have things to wrap up first.  I'll be back when I'm ready to take on more work.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",50) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUESTS_LATER
		++ @2138 /* ~I'm not a bounty hunter.  I'm afraid you'll have to hire someone else.  I'll be on my way now.~ */ + BELT_QUESTS_SKIP_ALL
	END	

	IF ~Global("#L_SarvQuests","GLOBAL",50) IsGabber(Player1)~ THEN BEGIN BELT_QUEST_50b
		SAY @2147 /* ~Hello again, <CHARNAME>.  Are you ready to help us clear up the rest of Savevok's supporters? */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest1","MYAREA",0) !Dead("GALDOR")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",1) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_1a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest2","MYAREA",0) !Dead("Tazok") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",2) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_2a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest3","MYAREA",0) !Dead("SEMAJ") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",3) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_3a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest4","MYAREA",0) !Dead("winski2") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",4) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_4a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest5","MYAREA",0) !Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",5) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_5a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest6","MYAREA",0) !Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",6) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_6a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) Global("#L_SkipQuest7","MYAREA",0) OR(6) !Dead("ZHALIMAR") !Dead("GARDUSH") !Dead("NAAMAN") !Dead("DIYAB") !Dead("AASIM") !Dead("ALAI") OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",7) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_7a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",0) OR(2) Global("#L_SkipQuest1","MYAREA",1) Dead("GALDOR") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ") OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1) OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ZHALIMAR") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("GARDUSH") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("NAAMAN") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("DIYAB") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("AASIM") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ALAI")~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
		+ ~Global("#L_OnlyDoKorlaszQuest","MYAREA",1)~ + @2144 /* ~What did you have in mind? */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
		++ @2137 /* ~I have things to wrap up first.  I'll be back when I'm ready to take on more work.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",50) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUESTS_LATER
		++ @2138 /* ~I'm not a bounty hunter.  I'm afraid you'll have to hire someone else.  I'll be on my way now.~ */ + BELT_QUESTS_SKIP_ALL
	END

	IF ~~ THEN BELT_QUESTS_SKIP_THIS
		SAY @2145 /* ~As you wish.~ */
		IF ~~ THEN DO ~SetGlobal("#L_SkipQuest7","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",8)~ + BELT_QUEST_8a
		IF ~Global("#L_SarvQuests","GLOBAL",6) OR(6) !Dead("ZHALIMAR") !Dead("GARDUSH") !Dead("NAAMAN") !Dead("DIYAB") !Dead("AASIM") !Dead("ALAI")~ THEN DO ~SetGlobal("#L_SkipQuest6","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",7)~ + BELT_QUEST_7a
		IF ~Global("#L_SarvQuests","GLOBAL",5) !Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",0)~ THEN DO ~SetGlobal("#L_SkipQuest5","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",6)~ + BELT_QUEST_6a
		IF ~Global("#L_SarvQuests","GLOBAL",4) !Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",0)~ THEN DO ~SetGlobal("#L_SkipQuest4","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",5)~ + BELT_QUEST_5a
		IF ~Global("#L_SarvQuests","GLOBAL",3) !Dead("winski2")~ THEN DO ~SetGlobal("#L_SkipQuest3","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",4)~ + BELT_QUEST_4a
		IF ~Global("#L_SarvQuests","GLOBAL",2) !Dead("SEMAJ")~ THEN DO ~SetGlobal("#L_SkipQuest2","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",3)~ + BELT_QUEST_3a
		IF ~Global("#L_SarvQuests","GLOBAL",1) !Dead("Tazok")~ THEN DO ~SetGlobal("#L_SkipQuest1","MYAREA",1) SetGlobal("#L_SarvQuests","GLOBAL",2)~ + BELT_QUEST_2a
	END

	IF ~~ THEN BELT_QUESTS_WARNING
		SAY @2142 /* ~Dead or ALIVE!~ */
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BELT_QUESTS_PAUSE
		SAY @2153 /* ~Your reward is well earned, as is a rest.~ */
		= @2197 /*~When you've rested and healed your group, come talk to me.  I'll have more work for you.~ */
		++ @2198 /* ~Ok, I'll be back shortly.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",50) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ EXIT
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2235 /* ~I've changed my mind about the room.  I'd like to check them out.~	*/ DO ~SetGlobal("#L_SarvQuests","GLOBAL",50) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + ROOM_TAKEN
		++ @2199 /* ~I'm done being your bounty hunter.  Hire someone else.~ */ + BELT_QUESTS_SKIP_ALL
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",2) !Dead("Tazok")~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",2) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_2a
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",3) !Dead("SEMAJ") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok")~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",3) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_3a
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",4) !Dead("winski2") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",4) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_4a
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",5) !Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")  OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2")~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",5)~ + BELT_QUEST_5a
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",6) !Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",0) OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")  OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1)~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",6) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_6a
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",7) OR(6) !Dead("ZHALIMAR") !Dead("GARDUSH") !Dead("NAAMAN") !Dead("DIYAB") !Dead("AASIM") !Dead("ALAI") OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")  OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1)~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",7) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_7a 
		+ ~GlobalLT("#L_SarvQuests","GLOBAL",8) OR(2) Global("#L_SkipQuest2","MYAREA",1) Dead("Tazok") OR(2) Global("#L_SkipQuest3","MYAREA",1) Dead("SEMAJ")  OR(2) Global("#L_SkipQuest4","MYAREA",1) Dead("winski2") OR(3) Global("#L_SkipQuest5","MYAREA",1) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1) OR(3) Global("#L_SkipQuest6","MYAREA",1) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1) OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ZHALIMAR") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("GARDUSH") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("NAAMAN") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("DIYAB") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("AASIM") OR(2) Global("#L_SkipQuest7","MYAREA",1) Dead("ALAI")~ + @2200 /* ~I'm ready to go now.  What's the job?~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",8) SetGlobalTimer("#L_QuestTimer","GLOBAL",TWO_DAYS)~ + BELT_QUEST_8a
	END

	IF ~~ THEN BELT_QUESTS_ALL_DONE
		SAY @2272 /* ~I've had a special gift made for you.  It will allow for one wish.~ */
		= @2273 /* ~It's a personal thank you for all you've done for the city.~ */
		++ @2274 /* ~Thank you.  That's very kind of you.~ */ DO ~SetGlobal("#L_SarvQuestsInProg","GLOBAL",2) GiveItemCreate("#LAdvGm1",Player1,1,0,0) SetGlobalTimer("#L_SoDNotBefore","GLOBAL",FIFTEEN_DAYS)~ + BELT_NOW_WHAT
	END

	IF ~~ THEN BELT_NOW_WHAT
		SAY @2264 /* ~So, <CHARNAME>, what are your plans now?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",1)~ + @2265 /* ~I think I'll go up stairs and sleep for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("EndOfBG1","GLOBAL",1) SetGlobal("#L_StartCaelarAttack","GLOBAL",1)~ EXIT
		+ ~OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2266 /* ~I'm going to settle into my new house and sleep for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("EndOfBG1","GLOBAL",1) SetGlobal("#L_StartCaelarAttack","GLOBAL",3)~ EXIT
		+ ~!Global("#L_AcceptedRoom","GLOBAL",1) Global("#L_ImoenInPalace","GLOBAL",1) OR(3) PartyHasItem("#LKey01") PartyHasItem("#LKey02") PartyHasItem("#LKey03")~ + @2268	/* ~I'm going to visit Imoen and then go home and sleep for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("EndOfBG1","GLOBAL",1) SetGlobal("#L_StartCaelarAttack","GLOBAL",2)~ EXIT
		+ ~!PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2267 /* ~I think I'll go to Elfsong and celebrate for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("EndOfBG1","GLOBAL",1) SetGlobal("#L_StartCaelarAttack","GLOBAL",4)~ EXIT
		+ ~!Global("#L_AcceptedRoom","GLOBAL",1) Global("#L_ImoenInPalace","GLOBAL",1) !PartyHasItem("#LKey01") !PartyHasItem("#LKey02") !PartyHasItem("#LKey03")~ + @2269 /* ~I'm going to visit Imoen and then head to Elfsong to celebrate for a week.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("EndOfBG1","GLOBAL",1) SetGlobal("#L_StartCaelarAttack","GLOBAL",2)~ EXIT
		++ @2270 /* ~I have places to go, things to do, people to see.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",99)~ + BELT_FUN
		++ @2271 /* ~I think I'll gather up a group and explore a bit, maybe see what's south of Nashkel.~ */ DO ~SetGlobal("#L_SarvQuests","GLOBAL",100) SetGlobal("EndOfBG1","GLOBAL",2) SetGlobal("#L_StartBG2","GLOBAL",1)~ EXIT
	END

	IF ~~ THEN BELT_FUN
		SAY @2275 /* ~May I suggest the tour of Durlag's Tower that is offered in Ulgoth's Beard?  I hear it's quite interesting.~ */
		+ ~Dead("DEATHK")~ + @2276 /* ~I've already been there.  Interesting is ... one way to describe it.~ */ EXIT
	    + ~!Dead("DEATHK")~ + @2277 /* ~Sounds like fun.  I'll check it out.~ */ DO ~SetGlobal("#L_LetsHaveFun","GLOBAL",1)~ EXIT
	END

	//////////////////////////////////////////////////////////////////////////
	// Angelo specific
	// Starts in CHAIN section below
	//////////////////////////////////////////////////////////////////////////
	IF ~Global("#L_SarvQuests","GLOBAL",1) !Dead("GALDOR")~ THEN BELT_QUEST_1_NOT_DONE_YET
		SAY	@2149 /* ~Hello again!  Have you dealt with Angelo yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2150 /* ~No, I'll be back when he's taken care of.~ */ EXIT
		++ @2151 /* ~Not yet.  Where was he again?~	*/ + BELT_QUEST_1_ECHO
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_1_ECHO
		SAY @2131 /* ~Angelo was spotted ...~ */
		++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ EXIT
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",1) Dead("GALDOR")~ THEN BELT_QUEST_1_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(2000) SetGlobal("#L_BG1AngeloDone","GLOBAL",1) AddexperienceParty(2000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Tazok specific
	// Starts in CHAIN section below
	//////////////////////////////////////////////////////////////////////////
	IF ~Global("#L_SarvQuests","GLOBAL",2) !Dead("Tazok")~ THEN BELT_QUEST_1_NOT_DONE_YET
		SAY	@2155 /* ~Hello again!  Have you dealt with Tazok yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2150 /* ~No, I'll be back when he's taken care of.~ */ EXIT
		++ @2151 /* ~Not yet.  Where was he again?~	*/ + BELT_QUEST_2_ECHO
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_2_ECHO
		SAY @2154 /* ~Tazok was spotted ...~ */
		++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ EXIT
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",2) Dead("Tazok")~ THEN BELT_QUEST_2_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(2000) SetGlobal("#L_BG1TazokDone","GLOBAL",1) AddexperienceParty(2000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Semaj specific
	//////////////////////////////////////////////////////////////////////////
	IF ~~ THEN BELT_QUEST_3a
		SAY @2156 /* ~Semaj was spotted ...~ */
		= @2132 /* ~We would like to hire you to being him to justice, dead or alive.~ */
		++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ + BELT_QUESTS_FF_NO_BANTER_MALE
		++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUESTS_FF_NO_BANTER_MALE
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",3) !Dead("SEMAJ")~ THEN BELT_QUEST_3_NOT_DONE_YET
		SAY	@2157 /*~Hello again!  Have you dealt with Semaj yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2150 /* ~No, I'll be back when he's taken care of.~ */ EXIT
		++ @2151 /* ~Not yet.  Where was he again?~	*/ + BELT_QUEST_3_ECHO
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_3_ECHO
		SAY @2156 /* ~Semaj was spotted ...~ */
		++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ EXIT
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",3) Dead("SEMAJ")~ THEN BELT_QUEST_3_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(2000) SetGlobal("#L_BG1SemajDone","GLOBAL",1) AddexperienceParty(2000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Winski specific
	//////////////////////////////////////////////////////////////////////////
	IF ~~ THEN BELT_QUEST_4a
		SAY @2159 /* ~Winski Peroate was spotted ...~ */
		= @2132 /* ~We would like to hire you to being him to justice, dead or alive.~ */
		++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ + BELT_QUESTS_FF_NO_BANTER_MALE
		++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUESTS_FF_NO_BANTER_MALE
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",4) !Dead("winski2")~ THEN BELT_QUEST_4_NOT_DONE_YET
		SAY	@2160 /* ~Hello again!  Have you dealt with Winski yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2150 /* ~No, I'll be back when he's taken care of.~ */ EXIT
		++ @2151 /* ~Not yet.  Where was he again?~	*/ + BELT_QUEST_4_ECHO
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_4_ECHO
		SAY @2159 /* ~Winski Peroate was spotted ...~ */
		++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ EXIT
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",4) Dead("winski2")~ THEN BELT_QUEST_4_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(2000) SetGlobal("#L_BG1WinskiDone","GLOBAL",1) AddexperienceParty(2000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Cythandria specific
	//////////////////////////////////////////////////////////////////////////
	IF ~~ THEN BELT_QUEST_5a
		SAY @2161 /* ~Cythandria was spotted ...~ */
		= @2174 /* ~We would like to hire you to being her to justice, dead or alive.~ */
		++ @2173 /* ~Not a problem.  I'll be back as soon a she's taken care of.~ */ + BELT_QUESTS_FF_NO_BANTER_FEMALE
		++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUESTS_FF_NO_BANTER_FEMALE
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",5) !Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",0)~ THEN BELT_QUEST_5_NOT_DONE_YET
		SAY	@2162 /* ~Hello again!  Have you dealt with Cythandria yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2171 /*~No, I'll be back when she's taken care of.~ */ EXIT
		++ @2172 /* ~Not yet.  Where was she again?~ */ + BELT_QUEST_5_ECHO
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_5_ECHO
		SAY @2161 /* ~Cythandria was spotted ...~ */
		++ @2173 /* ~Not a problem.  I'll be back as soon a she's taken care of.~ */ EXIT
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",5) OR(2) Dead("Cythan") Global("#L_CythanSurrend","GLOBAL",1)~ THEN BELT_QUEST_5_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(2000) SetGlobal("#L_BG1CythanDone","GLOBAL",1) AddexperienceParty(2000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Tamoko specific
	//////////////////////////////////////////////////////////////////////////
	IF ~~ THEN BELT_QUEST_6a
		SAY @2163 /* ~Tamoko was spotted ...~ */
		= @2174 /* ~We would like to hire you to being her to justice, dead or alive.~ */
		++ @2173 /* ~Not a problem.  I'll be back as soon a she's taken care of.~ */ + BELT_QUESTS_FF_NO_BANTER_FEMALE
		++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUESTS_FF_NO_BANTER_FEMALE
		++ @2175 /* ~I've spoken with her and let her go.  She is not a danger to anyone.~ */ + BELT_QUEST_6b
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_6b
		SAY @2176 /* ~Her freedom is not yours to give, <CHARNAME>.  The courts will decide her fate.~ */
		++ @2177 /* ~Her freedom may not be up to me, but her capture will not involve me.  I pass.~ */ + BELT_QUESTS_SKIP_THIS
		++ @2173 /* ~Not a problem.  I'll be back as soon a she's taken care of.~ */ + BELT_QUESTS_FF_NO_BANTER_FEMALE
	END

	IF ~Global("#L_SarvQuests","GLOBAL",6) !Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",0)~ THEN BELT_QUEST_6_NOT_DONE_YET
		SAY	@2164 /* ~Hello again!  Have you dealt with Tamoko yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2171 /*~No, I'll be back when she's taken care of.~ */ EXIT
		++ @2172 /* ~Not yet.  Where was she again?~ */ + BELT_QUEST_6_ECHO
		++ @2175 /* ~I've spoken with her and let her go.  She is not a danger to anyone.~ */ + BELT_QUEST_6b
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~~ THEN BELT_QUEST_6_ECHO
		SAY @2163 /* ~Tamoko was spotted ...~ */
		++ @2173 /* ~Not a problem.  I'll be back as soon a she's taken care of.~ */ EXIT
		++ @2175 /* ~I've spoken with her and let her go.  She is not a danger to anyone.~ */ + BELT_QUEST_6b
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS
	END

	IF ~Global("#L_SarvQuests","GLOBAL",6) OR(2) Dead("Tamoko") Global("#L_TamokoSurrend","GLOBAL",1)~ THEN BELT_QUEST_6_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(2000) SetGlobal("#L_BG1TamokoDone","GLOBAL",1) AddexperienceParty(2000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Cloudwulfe et al speciic
	// Most of it is in the CHAIN section below
	//////////////////////////////////////////////////////////////////////////
	IF ~Global("#L_SarvQuests","GLOBAL",7) Dead("ZHALIMAR") Dead("GARDUSH") Dead("NAAMAN") Dead("DIYAB") Dead("AASIM") Dead("ALAI")~ THEN BELT_QUEST_7_DONE
		SAY @2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		IF ~~ THEN DO ~GiveGoldForce(5000) SetGlobal("#L_BG1ZhalimarDone","GLOBAL",1) AddexperienceParty(5000)~ + BELT_QUESTS_PAUSE
	END

	//////////////////////////////////////////////////////////////////////////
	// Korlasz specific
	//////////////////////////////////////////////////////////////////////////
	IF ~~ THEN BELT_QUEST_8a
		SAY @2169 /* ~Korlasz was spotted heading into her family's crypt~ */ 
		= @2174 /* ~We would like to hire you to being her to justice, dead or alive.~ */
		++ @2184 /* ~I'm ready to go, but how do I find this crypt?~ */+ START_KORLASZ
		++ @2137 /* ~I have things to wrap up first.  I'll be back when I'm ready to take on more work.~ */ + BELT_QUESTS_LATER
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_ALL
	END

	IF ~Global("#L_SarvQuests","GLOBAL",8) !Dead("bdkorlas") !Global("BD_KORLASZ_SURRENDER","GLOBAL",1)~ THEN BELT_QUEST_8_NOT_DONE_YET
		SAY	@2170 /* ~Hello again!  Have you dealt with Korlasz yet?~ */
		+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
		++ @2184 /* ~How do I find this crypt?~ */ + START_KORLASZ
		++ @2137 /* ~I have things to wrap up first.  I'll be back when I'm ready to take on more work.~ */ + BELT_QUESTS_LATER
		++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_ALL
	END
END

//////////////////////////////////////////////////////////////////////////////
// Common - used by many
// If interjections are desired, they are put into NPC specific areas below
//////////////////////////////////////////////////////////////////////////////
CHAIN
	IF ~~ THEN BELT BELT_QUESTS_FF_NO_BANTER_MALE
		@2201 /* ~Excellent!~ */
		= IF ~!InMyArea("BDELTAN")~ @2139 /* ~I will make sure there are Flaming Fist to escort him to a cell if he surfaces from the sewers.~ */
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2139 /* ~I will make sure there are Flaming Fist to escort him to a cell if he surfaces from the sewers.~ */
	END
	++ @2141 /* ~I doubt that will be necessary.~ */ + BELT_QUESTS_WARNING
	++ @2140 /* ~Thank you.~ */ EXIT

CHAIN
	IF ~~ THEN BELT BELT_QUESTS_FF_NO_BANTER_FEMALE
		@2201 /* ~Excellent!~ */
		= IF ~!InMyArea("BDELTAN")~ @2179 /* ~I will make sure there are Flaming Fist to escort her to a cell if she surfaces from the sewers.~ */
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2179 /* ~I will make sure there are Flaming Fist to escort her to a cell if she surfaces from the sewers.~ */
	END
	++ @2141 /* ~I doubt that will be necessary.~ */ + BELT_QUESTS_WARNING
	++ @2140 /* ~Thank you.~ */ EXIT

CHAIN
	IF ~~ THEN BELT BELT_QUESTS_FF_NO_BANTER_GROUP
		@2201 /* ~Excellent!~ */
		= IF ~!InMyArea("BDELTAN")~ @2180 /* ~I will make sure there are Flaming Fist to escort them to a cell if they surface from the sewers.~ */
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2180 /* ~I will make sure there are Flaming Fist to escort them to a cell if they surface from the sewers.~ */
	END
	++ @2141 /* ~I doubt that will be necessary.~ */ + BELT_QUESTS_WARNING
	++ @2140 /* ~Thank you.~ */ EXIT

//////////////////////////////////////////////////////////////////////////////
// Angelo
//////////////////////////////////////////////////////////////////////////////
CHAIN
	IF ~~ THEN BELT BELT_QUEST_1a
		@2131 /* ~Angelo was spotted heading down into the sewers behind the Flaming Fist Headquarters.~ */
		= @2132 /* ~We would like to hire you to being him to justice, dead or alive.~ */
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2133 /* ~I'd prefer dead.~ */
		== %SHARTEEL_JOINED% IF ~!InMyArea("BDELTAN") IsValidForPartyDialogue("SHAR-TEEL")~ THEN @2133 /* ~I'd prefer dead.~ */
		== %SHARTEEL_JOINED% IF ~InMyArea("BDELTAN") IsValidForPartyDialogue("SHAR-TEEL")~ THEN @2193 /* ~Me too!~ */
		== BELT IF ~OR(2) InMyArea("BDELTAN") IsValidForPartyDialogue("SHAR-TEEL")~ THEN @2134 /* ~Dead or alive!~ */
	END
	++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ + BELT_QUEST_1b
	++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUEST_1b
	++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS

 CHAIN
	IF ~~ THEN BELT BELT_QUEST_1b
		@2201 /* ~Excellent!~ */
		= IF ~!InMyArea("BDELTAN")~ @2139 /* ~I will make sure there are Flaming Fist to escort him to a cell if he surfaces from the sewers.~ */
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2139 /* ~I will make sure there are Flaming Fist to escort him to a cell if he surfaces from the sewers.~ */
		== %SHARTEEL_JOINED% IF ~IsValidForPartyDialogue("SHAR-TEEL")~ THEN @2141 /* ~I doubt that will be necessary.~ */
		== BELT IF ~IsValidForPartyDialogue("SHAR-TEEL")~ THEN @2142 /* ~Dead or ALIVE!~ */
	END
	+ ~!IsValidForPartyDialogue("SHAR-TEEL")~ + @2141 /* ~I doubt that will be necessary.~ */ + BELT_QUESTS_WARNING
	+ ~!IsValidForPartyDialogue("SHAR-TEEL")~ + @2140 /* ~Thank you.~ */ EXIT

//////////////////////////////////////////////////////////////////////////////
// Tazok
//////////////////////////////////////////////////////////////////////////////
CHAIN
	IF ~~ THEN BELT BELT_QUEST_2a
		@2154 /* ~Tazok was spotted heading down into the sewers in front of the Iron Throne Headquarters.~ */
		= @2132 /* ~We would like to hire you to being him to justice, dead or alive.~ */
		== %KIVAN_JOINED% IF ~IsValidForPartyDialogue("KIVAN")~ THEN @2133 /* ~I'd prefer dead.~ */
		== BELT IF ~IsValidForPartyDialogue("KIVAN")~ THEN @2134 /* ~Dead or alive!~ */
	END
	++ @2135 /* ~Not a problem.  I'll be back as soon a he's taken care of.~ */ + BELT_QUEST_2b
	++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUEST_2b
	++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS

CHAIN
	IF ~~ THEN BELT BELT_QUEST_2b
		@2201 /* ~Excellent!~ */
		= IF ~!InMyArea("BDELTAN")~ @2139 /* ~I will make sure there are Flaming Fist to escort him to a cell if he surfaces from the sewers.~ */
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2139 /* ~I will make sure there are Flaming Fist to escort him to a cell if he surfaces from the sewers.~ */
		== %KIVAN_JOINED% IF ~IsValidForPartyDialogue("KIVAN")~ THEN @2141 /* ~I doubt that will be necessary.~ */
		== BELT IF ~IsValidForPartyDialogue("KIVAN")~ THEN @2142 /* ~Dead or ALIVE!~ */
	END
	+ ~!IsValidForPartyDialogue("KIVAN")~ + @2141 /* ~I doubt that will be necessary.~ */ + BELT_QUESTS_WARNING
	+ ~!IsValidForPartyDialogue("KIVAN")~ + @2140 /* ~Thank you.~ */ EXIT

//////////////////////////////////////////////////////////////////////////////
// Cloudwulfe et al speciic
//////////////////////////////////////////////////////////////////////////////
CHAIN
	IF ~~ THEN BELT BELT_QUEST_7a
		IF ~!Dead("ZHALIMAR")~ @2165 /* ~Zhalimar Cloudwulfe and his crew were spotted ... */
		= IF ~Dead("ZHALIMAR")~ @2167 /* ~The remainder of Zhalimar Cloudwulfe's crew were spotted ... */
		= @2183 /* ~We would like to hire you to being them to justice, dead or alive.~ */
	END
	++ @2178 /* ~Not a problem.  I'll be back as soon as they're taken care of.~ */ + BELT_QUESTS_FF_NO_BANTER_GROUP
	++ @2136 /* ~Oh, this will be a pleasure.  Consider it done.~ */ + BELT_QUESTS_FF_NO_BANTER_GROUP
	++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS

CHAIN
	IF ~Global("#L_SarvQuests","GLOBAL",7) OR(6) !Dead("ZHALIMAR") !Dead("GARDUSH") !Dead("NAAMAN") !Dead("DIYAB") !Dead("AASIM") !Dead("ALAI")~ THEN BELT BELT_QUEST_7_NOT_DONE_YET
		IF ~!Dead("ZHALIMAR")~ @2166 /* ~Hello again!  Have you dealt with Cloudwulfe yet?~ */
		= IF ~Dead("ZHALIMAR")~ @2168 /* ~Hello again!  Have you dealt with Cloudwulfe's crew yet?~ */
	END
	+ ~Global("#L_AcceptedRoom","GLOBAL",0)~ + @2158 /* ~I'm here about the room, actually.  I'll take it.~ */ + ROOM_TAKEN
	++ @2181 /* ~No, I'll be back when they're taken care of.~ */ EXIT
	++ @2182 /* ~Not yet.  Where were they again?~ */ + BELT_QUEST_7_ECHO
	++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS

CHAIN
	IF ~~ THEN BELT BELT_QUEST_7_ECHO
		IF ~!Dead("ZHALIMAR")~ @2165 /* ~Zhalimar Cloudwulfe and his crew were spotted ... */
		= IF ~Dead("ZHALIMAR")~ @2167 /* ~The remainder of Zhalimar Cloudwulfe's crew were spotted ... */
	END
	++ @2178 /* ~Not a problem.  I'll be back as soon as they're taken care of.~ */ EXIT
	++ @2148 /* ~I'd prefer to skip this one.~ */ + BELT_QUESTS_SKIP_THIS

//////////////////////////////////////////////////////////////////////////////
// Korlasz speciic
//////////////////////////////////////////////////////////////////////////////
CHAIN
	IF ~~ THEN BELT START_KORLASZ
		@2185 /* ~Hold still, I'll send you there.~ */
		= IF ~!InMyArea("LIIA")~ @2256 /* ~Oh by the way, <CHARNAME>, Duke Jannath is looking for research on The Dead Three.~ */
		= IF ~!InMyArea("LIIA")~ @2254 /* ~If you find any documents or research on them, Bhaal especially, please bring them to me.~ */
		= IF ~!InMyArea("LIIA")~ @2255 /* ~I will, of course, reimburse you for them.~ */
		== LIIA	IF ~InMyArea("LIIA")~ @2253 /* ~<CHARNAME>, one moment.  The Korlasz family are known to have worshipped The Dead Three over the years.~ */
	    = IF ~InMyArea("LIIA")~ @2254 /* ~If you find any documents or research on them, Bhaal especially, please bring them to me.~ */
		= IF ~InMyArea("LIIA")~ @2255	/* ~I will, of course, reimburse you for them.~ */
		== BELT @2261 /* ~Ok now.  Hold still.~ */
		= IF ~!InMyArea("BDELTAN")~ @2186 /* ~I will make sure a contingent of Flaming Fist is there to back you up.~ */ 
		== BDELTAN IF ~InMyArea("BDELTAN")~ @2186 /* ~I will make sure a contingent of Flaming Fist is there to back you up.~ */ 
	END
	IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutSceneEx("#L_Cut04",TRUE)~ EXIT

CHAIN
	IF ~Global("#L_SarvQuests","GLOBAL",8) OR(2) Dead("bdkorlas") Global("BD_KORLASZ_SURRENDER","GLOBAL",1)~ THEN BELT BELT_QUEST_8_DONE
		@2152 /* ~Well done <CHARNAME>!  Word has reached us on your success.~ */
		= IF ~!InMyArea("LIIA")~ @2257 /* ~Were you able to find any documents or research on The Dead Three, <CHARNAME>?~ */ 
		== LIIA IF ~InMyArea("LIIA")~ @2257 /* ~Were you able to find any documents or research on The Dead Three, <CHARNAME>?~ */
	END
	+ ~PartyHasItem("BDSHBHR")~ + @2258 /* ~Yes, I found some on Bhaal~ */ DO ~SetGlobal("BD_SAFEHOUSE_DONE","GLOBAL",1) SetGlobal("#L_BG1KorlaszDone","GLOBAL",1) GiveGoldForce(6000) AddXPObject(Player1,5000) AddXPObject(Player2,5000) AddXPObject(Player3,5000) AddXPObject(Player4,5000) AddXPObject(Player5,5000) AddXPObject(Player6,5000)~ + BHAAL_BOOKS_REWARD
	+ ~!PartyHasItem("BDSHBHR")~ + @2262 /* ~No, I'm sorry.  I wasn't able to find anything.~ */ DO ~SetGlobal("BD_SAFEHOUSE_DONE","GLOBAL",1) SetGlobal("#L_BG1KorlaszDone","GLOBAL",1) GiveGoldForce(6000) AddXPObject(Player1,5000) AddXPObject(Player2,5000) AddXPObject(Player3,5000) AddXPObject(Player4,5000) AddXPObject(Player5,5000) AddXPObject(Player6,5000)~ + BELT_QUESTS_ALL_DONE

CHAIN 
	IF ~~ THEN BELT BHAAL_BOOKS_REWARD
		@2201 /* ~Excellent!~ */
		= IF ~!InMyArea("LIIA")~ @2263 /* ~I will give you 6000 gold for the lot.~ */
		== LIIA IF ~InMyArea("LIIA")~ @2259 /* ~Most excellent!  I will give you 6000 gold for the lot.~ */
	END
	++ @2260 /* ~That's incredibly generous of you.  Glad to be of service!~ */ DO ~TakePartyItem("BDSHBHR") DestroyItem("BDSHBHR") GiveGoldForce(6000)~ + BELT_QUESTS_ALL_DONE

