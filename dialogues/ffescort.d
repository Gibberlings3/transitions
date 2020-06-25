
BEGIN ~#LFFEsc1~
	IF ~Global("#L_QuestMsgSent","GLOBAL",1)~ THEN BEGIN QUEST_MSG
		SAY @2294 /* ~<PROPER_SIRMAAM>, the Dukes have sent me to request your aid in rounding up the remaining supporters of Sarevok.~ */
		++ @2295 /* ~Ok, let's go.~ */ DO ~SetGlobal("#L_QuestMsgSent","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutSceneEx("#L_Cut06",TRUE)~ EXIT
		++ @2296 /* ~I'll be there shortly.~ */ DO ~SetGlobal("#L_QuestMsgSent","GLOBAL",2)~ + QUEST_HURRY
		++ @2297 /* ~Tell the Dukes I'm not interested in being their bounty hunter.~ */ DO ~SetGlobal("#L_QuestMsgSent","GLOBAL",2) SetGlobal("#L_SarvQuests","GLOBAL",99) SetGlobalTimer("#L_SoDNotBefore","GLOBAL",FIFTEEN_DAYS)~ + QUEST_SKIP
	END

	IF ~~ THEN QUEST_HURRY
		SAY @2298 /* ~Please hurry, <PROPER_SIRMAAM>.  Time is of the essence.~ */
		IF ~~ THEN DO ~ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~ EXIT
	END

	IF ~~ THEN QUEST_SKIP
		SAY @2299 /* ~As you wish, <PRO_SIRMAAM>.~ */
		IF ~~ THEN DO ~ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~ EXIT
	END

	IF ~Global("#L_SarvQuests","GLOBAL",1) Dead("GALDOR") AreaCheck("BG1100")~ THEN BEGIN ESCORT_1
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~Global("#L_SarvQuests","GLOBAL",2) Dead("TAZOK") AreaCheck("BG0800")~ THEN BEGIN ESCORT_2
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~Global("#L_SarvQuests","GLOBAL",3) Dead("SEMAJ") AreaCheck("BG0300")~ THEN BEGIN ESCORT_3
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~Global("#L_SarvQuests","GLOBAL",4) Dead("Winski2") AreaCheck("BG1100")~ THEN BEGIN ESCORT_4
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~Global("#L_SarvQuests","GLOBAL",5) Dead("Cythan") AreaCheck("BG0800")~ THEN BEGIN ESCORT_5a
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~Global("#L_SarvQuests","GLOBAL",5) Global("#L_CythanSurrend","GLOBAL",1) AreaCheck("BG0800")~ THEN BEGIN ESCORT_5b
		SAY @2218 /* ~<PROPER_SIRMAAM>, I stayed behind to inform you that the prisoner has been taken into custody.~ */
		++ @2140 /* ~Thank you.~ */ + ESCORT_LEAVESb
	END

	IF ~Global("#L_SarvQuests","GLOBAL",6) Dead("Tamoko") Global("#L_TamokoDie","GLOBAL",0) AreaCheck("BG1200")~ THEN BEGIN ESCORT_6a
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~Global("#L_SarvQuests","GLOBAL",6) Global("#L_TamokoSurrend","GLOBAL",1) Global("#L_TamokoDie","GLOBAL",0) AreaCheck("BG1200")~ THEN BEGIN ESCORT_6b
		SAY @2218 /* ~<PROPER_SIRMAAM>, I stayed behind to inform you that the prisoner has been taken into custody.~ */
		++ @2140 /* ~Thank you.~ */ + ESCORT_LEAVESb
	END

	IF ~Global("#L_SarvQuests","GLOBAL",6) Dead("Tamoko") Global("#L_TamokoDie","GLOBAL",1) AreaCheck("BG1200")~ THEN BEGIN ESCORT_6c 
		SAY @2240 /* ~I'm sorry, <PRO_SIRMAAM>.  She grabbed my sword before I could stop her.~ */
		++ @2239 /* ~The last of my foster father's murders has fallen. May he rest in peace.~ */ + ESCORT_6d
		++ @2241 /* ~It isn't your fault.  I don't know if anyone could have saved her.~ */ + ESCORT_6d
	END

	IF ~~ THEN BEGIN ESCORT_6d
		SAY	@2242 /* ~We'll take away the body and inform the Dukes.  I'm sure they'll want to talk to you again.~ */
		++ @2243 /* ~Please see that she receives a proper burial.  Thank you.~ */ DO ~ActionOverride("Tamoko",DestroySelf()) ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~ EXIT
	END

	IF ~Global("#L_SarvQuests","GLOBAL",7) Dead("ZHALIMAR") Dead("GARDUSH") Dead("NAAMAN") Dead("DIYAB") Dead("AASIM") Dead("ALAI") AreaCheck("BG1200")~ THEN BEGIN ESCORT_7
		SAY @2194 /* ~No survivors?~ */
		++ @2195 /* ~I'm afraid not.~ */ + ESCORT_LEAVESa
	END

	IF ~~ THEN BEGIN ESCORT_LEAVESa
		SAY @2196 /* ~We'll inform the Dukes.~ */
		IF ~~ THEN DO ~ActionOverride("#LffEsc1",EscapeArea()) ActionOverride("#LffEsc2",EscapeArea()) ActionOverride("#LffEsc3",EscapeArea())~ EXIT
	END

	IF ~~ THEN BEGIN ESCORT_LEAVESb
		SAY @2219 /* ~I'll inform the Dukes.~ */
		IF ~~ THEN DO ~ActionOverride("#LffEsc2",EscapeArea())~ EXIT
	END

	IF ~True()~ THEN BEGIN ESCORT_GREETING
		SAY @2188 // ~Greetings, <SIRMAAM>.  We're here to escort any survivors to cells.~
		IF ~~ THEN EXIT
	END
	
// END OF NEW DIALOGUE FILE
