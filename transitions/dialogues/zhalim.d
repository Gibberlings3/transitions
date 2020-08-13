///////////////////////////////////////////////////
// Updates to Cloudwulf's dialogue for his quest //
// Compiled via quests_common.tpa                //
///////////////////////////////////////////////////
REPLACE_TRIGGER_TEXT ZHALIM ~True()~ ~Global("#L_BG1SarevokDead","GLOBAL",0)~

APPEND ZHALIM

	IF ~AreaCheck("BG0225")~ THEN BEGIN ZHALIM_QUEST
		SAY @2247 /* ~I recognize you.  You are foolish enough to follow us?  Die fool!~ */
		IF ~~ THEN DO ~ActionOverride("ZHALIMAR",Enemy()) ActionOverride("GARDUSH",Enemy()) ActionOverride("NAAMAN",Enemy()) ActionOverride("DIYAB",Enemy()) ActionOverride("AASIM",Enemy()) ActionOverride("ALAI",Enemy()) ActionOverride("EMITAR3",ApplySpell(Myself,DOPPLEGANGER_CHANGE_DEFAULT_LESSER))~ EXIT
	END

END