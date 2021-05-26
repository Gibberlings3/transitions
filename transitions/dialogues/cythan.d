/////////////////////////////////////////////////////
// Updates to Cynthandria's dialogue for her quest //
// Compiled via quests_common.tpa                  //
/////////////////////////////////////////////////////
REPLACE_TRIGGER_TEXT CYTHAN ~NumTimesTalkedTo(0)~ ~NumTimesTalkedTo(0) Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_TRIGGER_TEXT CYTHAN ~HPPercentLT(Myself,50)~ ~HPPercentLT(Myself,50) Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_ACTION_TEXT CYTHAN ~GiveItem("SCRL2L",LastTalkedToBy)~ ~~
REPLACE_ACTION_TEXT CYTHAN ~GiveItem("SCRL2M",LastTalkedToBy)~ ~~
REPLACE_ACTION_TEXT CYTHAN ~GiveItem("SCRL3F",LastTalkedToBy)~ ~DropInventory()~
APPEND CYTHAN
	IF ~AreaCheck("%EBaldursGate_ElfsongTavern_L2%")~ THEN BEGIN Cythan_Quest1
		SAY @2220 /* ~You?  What do you want?!~ */
		++ @2221 /* ~The Dukes sent me to bring you in dead or alive.~ */ + Cythan_Quest2
	END

	IF ~~ THEN BEGIN Cythan_Quest2
		SAY @2210 /* ~So my choice is the noose or death by a bhaal-spawn?~ */
		= @2217 /* ~How ironic.~ */
		+ ~RandomNum(2,1)~ + @2211 /* ~I don't think you'll be hung for sharing a bed with Sarevok.  You'll at least have a better chance at survival this way.~ */ + Cythan_Quest3a
		+ ~RandomNum(2,2)~ + @2211 /* ~I don't think you'll be hung for sharing a bed with Sarevok.  You'll at least have a better chance at survival this way.~ */ + Cythan_Quest3b
		++ @2212 /* ~You'll die for certain if you choose to fight.~ */ + Cythan_Quest3b
		++ @2213 /* ~No, you have just one choice.  Any last words?~ */ + Cythan_Quest3c
	END

	IF ~~ THEN BEGIN Cythan_Quest3a
		SAY @2214 /* ~I'd rather see if I can take you with me!~ */
		IF ~~ THEN DO ~ActionOverride("Cythan",Enemy())~  EXIT
	END
	
	IF ~~ THEN BEGIN Cythan_Quest3b
		SAY @2216 /* ~Fine!  I surrender!~ */
		++ @2222 /* ~There are Flaming Fist waiting for you outside.~ */ DO ~SetGlobal("#L_CythanSurrend","GLOBAL",1) ActionOverride("Cythan",DropInventory()) ActionOverride("Cythan",EscapeArea())~  EXIT
	END
	
	IF ~~ THEN BEGIN Cythan_Quest3c
		SAY @2215 /* ~I'll see you in hell!~ */
		IF ~~ THEN DO ~ActionOverride("Cythan",Enemy())~  EXIT
	END
	
	IF ~Global("#L_BG1SarevokDead","GLOBAL",1) !AreaCheck("%EBaldursGate_ElfsongTavern_L2%")~ THEN BEGIN Cythan_Default
		SAY @2187 // ~Get away from me.  I have nothing to say to you.~
		IF ~~ THEN EXIT
	END
END