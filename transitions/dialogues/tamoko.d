/////////////////////////////////////////////////
// Updates to Tamoko's dialogue for her quests //
// Compiled via quests_common.tpa              //
/////////////////////////////////////////////////
REPLACE_TRIGGER_TEXT TAMOKO ~!InParty("skie")~ ~!InParty("skie") Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_TRIGGER_TEXT TAMOKO ~HPPercentLT(Myself,50)~ ~InParty("skie") Global("#L_BG1SarevokDead","GLOBAL",0)~

APPEND TAMOKO
	IF WEIGHT #-3 ~AreaCheck("%BaldursGateDocks_IronThrone_L5%") GlobalGT("TamokoMove","GLOBAL",0)~ THEN BEGIN Tamoko_Quest1A
		SAY @2223 /* ~Hello again, <CHARNAME>.  What is it you seek here?~ */
		++ @2221 /* ~The Dukes sent me to bring you in dead or alive.~ */ + Tamoko_Quest2
	END

	IF WEIGHT #-3 ~AreaCheck("%BaldursGateDocks_IronThrone_L5%") Global("TamokoMove","GLOBAL",0)~ THEN BEGIN Tamoko_Quest1B
		SAY @2527 // ~Hello, <CHARNAME>.  What is it you seek here?~
		++ @2221 /* ~The Dukes sent me to bring you in dead or alive.~ */ + Tamoko_Quest2
	END

	IF ~~ THEN BEGIN Tamoko_Quest2
		SAY @2224 /* ~I see.  My soul is ready to face you in one final battle.~ */
		++ @2226 /*	~Battle is not necessary, Tamoko.~ */ + Tamoko_Quest3
		++ @2233 /* ~Then let's end this.  The last of my foster father's murders will fall this <DAYNIGHT>.~ */ DO ~SetGlobal("#L_TamokoDie","GLOBAL",0) ActionOverride("Tamoko",Enemy())~ EXIT
	END

	IF ~~ THEN BEGIN Tamoko_Quest3
		SAY @2227 /* ~I do not choose to die by execution.  I would rather go out with honor.~ */
		+ ~GlobalGT("TamokoMove","GLOBAL",0)~ + @2225 /* ~I would testify for you at your trial.  I doubt being in love will be a hanging offense.~ */ + Tamoko_Quest4
		+ ~OR(2) PartyHasItem("SCRL3F") PartyHasItem("#LSCRL3F")~ + @2526 /* ~The only documented evidence I have against you is Sarevok's diary that says you shared his bed. Hardly a hanging offense.~ */ + Tamoko_Quest4
		++ @2233 /* ~Then let's end this.  The last of my foster father's murders will fall this <DAYNIGHT>.~ */ DO ~SetGlobal("#L_TamokoDie","GLOBAL",0) ActionOverride("Tamoko",Enemy())~ EXIT
	END
	
	IF ~~ THEN BEGIN Tamoko_Quest4
		SAY @2228 /* ~You would not do this if you knew to whom you speak.~ */
		++ @2229 /* ~I know you helped Sarevok kill my foster father.  I recognized you from that night. */ + Tamoko_Quest5
		++ @2233 /* ~Then let's end this.  The last of my foster father's murders will fall this <DAYNIGHT>.~ */ DO ~SetGlobal("#L_TamokoDie","GLOBAL",0) ActionOverride("Tamoko",Enemy())~ EXIT
	END
	
	IF ~~ THEN BEGIN Tamoko_Quest5
		SAY @2230 /* ~And yet, you would forgive me.  You would help me?~ */
		++ @2231 /* ~What you did, you did for misguided love.  I can forgive that.~ */ + Tamoko_Quest6
	END
	
	IF ~~ THEN BEGIN Tamoko_Quest6
		SAY @2232 /* ~You truly are nothing like your brother, after all.~ */
		++ @2528 /* ~There are Flaming Fist waiting for you outside.~ */ DO ~ActionOverride("Tamoko",EscapeArea()) AddexperienceParty(5000) SetGlobal("#L_TamokoSurrend","GLOBAL",1) ~  EXIT
	END
	
	IF WEIGHT #-2 ~Global("#L_BG1SarevokDead","GLOBAL",1) !AreaCheck("%BaldursGateDocks_IronThrone_L5%") !AreaCheck("%BaldursGateDocks%")~ THEN BEGIN Tamoko_Default
		SAY @2234 /* ~Please leave me be.  I have much to think about.~ */
		IF ~~ THEN EXIT
	END
END

