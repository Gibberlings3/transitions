/////////////////////////////////////////////////////////////
// Snarky additions to SoD dialogue to lighten it up a bit //
// Compiled via snark_n_wit.tpa using snw_sod.tra          //
/////////////////////////////////////////////////////////////

// Response to a dumb question from Corwin
EXTEND_TOP BDSCHAEL 13 
	++ @3000 /*	= ~How the hells should I know?~ */ GOTO 14
END

// Response to Liia when she asks the pc to join the coalition
EXTEND_TOP BDLIIA 11 #1
	++ @3001 /* ~You want me to join the army?~ */ EXTERN ~BDELTAN~ ACCOMPANY_NOT_JOIN
END

// Duke Eltan's compelling response (well, I hope it's more compelling than 'Will you join them')
APPEND BDELTAN
	IF ~~ THEN BEGIN ACCOMPANY_NOT_JOIN
		SAY @3002 /* ~Accompany is more to the point.~ */
		+ ~Class(Player1,BARD_ALL)~ + @3003	/* ~What would you have me do?  Entertain your troops?  I'm just a bard!~ */ + MORE_THAN_A_BARD
		++ @3004 /* ~What could I possibly do that your trained army couldn't accomplish?  Well...besides...~ */ + BESIDES_EVERYTHING
	END

	IF ~~ THEN BEGIN MORE_THAN_A_BARD
		SAY @3005 /* ~A bard whose talents far exceed that of song.  A bard that solved the iron crisis, exposed Sarevok, and saved my life.~ */
		IF ~~ GOTO OKIE_DOKES
	END

	IF ~~ THEN BEGIN BESIDES_EVERYTHING
		SAY @3006 /* ~You mean besides solving the iron crisis?  Exposing Sarevok?  Saving my life?~ */
		IF ~~ GOTO OKIE_DOKES
	END

	IF ~~ THEN BEGIN OKIE_DOKES
		SAY @3007 /* ~Besides your obvious talent for tactics and getting to the root of the problem, you are a symbol of hope for the entire region.~ */
		= @3008	/* ~I know it is a heavy burden to lay upon one so young, but we don't always get to choose our destiny.~ */
		++ @3009 /* ~I can't promise anything, and I'm not joining any army ... just so we're clear.  But I'll go along and help where I'm able.~ */ EXTERN ~BDBELT~ 38
		++ @3010 /* ~So the reward for a dangerous job well done is more dangerous work. I have laid my own path, I will follow it.~ */ EXTERN ~BDBELT~ 38
		++ @3011 /* ~On the contrary, my coin is on the edge.  I choose my own destiny, and I choose to see this through.~ */ EXTERN ~BDBELT~ 38
	END
END

ALTER_TRANS BDENTAR
	BEGIN 18 END
	BEGIN 0 END
	BEGIN
		"TRIGGER" ~Global("#L_Snark","GLOBAL",0)~
	END
EXTEND_BOTTOM BDENTAR 18
	IF ~!Global("#L_Snark","GLOBAL",0)~ THEN REPLY @3012 /* ~With all due respect sir, I'm not a babysitter.  Neither is the Fist.  But if you insist upon this folly, her fate is upon your head, not mine.~ */ DO ~AddJournalEntry(256390,QUEST)~ GOTO 44
END

