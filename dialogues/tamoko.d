/////////////////////////////////////////////////
// Updates to Tamoko's dialogue for her quests //
// Compiled via quests_common.tpa              //
/////////////////////////////////////////////////
REPLACE_TRIGGER_TEXT TAMOKO ~!InParty("skie")~ ~!InParty("skie") Global("#L_BG1SarevokDead","GLOBAL",0)~
REPLACE_TRIGGER_TEXT TAMOKO ~HPPercentLT(Myself,50)~ ~InParty("skie") Global("#L_BG1SarevokDead","GLOBAL",0)~

APPEND TAMOKO
	IF ~AreaCheck("BG0615")~ THEN BEGIN Tamoko_Quest1
		SAY @2223 /* ~Hello again, <CHARNAME>.  What is it you seek here?~ */
		++ @2221 /* ~The Dukes sent me to bring you in dead or alive.~ */ + Tamoko_Quest2
	END

	IF ~~ THEN BEGIN Tamoko_Quest2
		SAY @2224 /* ~I see.  My soul is ready to face you in one final battle.~ */
		++ @2226 /*	~Battle is not necessary, Tamoko.~ */ + Tamoko_Quest3
		++ @2233 /* ~Then let's end this.  The last of my foster father's murders will fall this <DAYNIGHT>.~ */ DO ~SetGlobal("#L_TamokoDie","GLOBAL",0) ActionOverride("Tamoko",Enemy())~ EXIT
	END

	IF ~~ THEN BEGIN Tamoko_Quest3
		SAY @2227 /* ~I do not choose to die by execution.  I would rather go out with honor.~ */
		++ @2225 /* ~I would testify for you at your trial.  I doubt being in love will be a hanging offense.~ */ + Tamoko_Quest4
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
		++ @2222 /* ~There are Flaming Fist waiting for you outside.~ */ DO ~ActionOverride("Tamoko",EscapeArea()) AddexperienceParty(5000) SetGlobal("#L_TamokoSurrend","GLOBAL",1) ~  EXIT
	END
	
	IF ~Global("#L_BG1SarevokDead","GLOBAL",1) !AreaCheck("BG0615") !AreaCheck("BG1200")~ THEN BEGIN Tamoko_Default
		SAY @2234 /* ~Please leave me be.  I have much to think about.~ */
		IF ~~ THEN EXIT
	END
END

