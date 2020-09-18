/////////////////////////////////////////////////////////////////////////////////////////////////////
// Flaming Fist Healers come to Undercity either inside the temple or just outside of it           //
// They offer to heal the party and confiscate Sarevok's sword                                     //
// If they're spawned inside the temple, they'll disarm the traps and take away the bodies as well //
// Slightly edited version of jastey's c#stsdpr dialogue from her Endless BG1 mod                  //
/////////////////////////////////////////////////////////////////////////////////////////////////////
BEGIN ~#LffHlr1~
	IF ~Global("#L_FFWrapItUp","MYAREA",0)~ THEN BEGIN duke_priest
		SAY @2000 // ~<CHARNAME>! The Dukes sent us to see to your well-being. We will take care of the bodies of Sarevok and his minions.~
		= @2001	// ~We've also come to collect Sarevok's sword.  The dukes don't want it to become a rallying symbol for his minions.~
		IF ~~ THEN + do_disarm
		IF ~AreaCheck("%Undercity%")~ THEN + skip_disarm 
	END

	IF ~~ THEN BEGIN do_disarm
		SAY @2002 // ~Do you want us to heal you and disarm the traps while we're here?~ 
		++ @2003 /* ~Uh, sure.  Go ahead.~ */ + duke_priest_02
		++ @2004 /* ~No thanks, I'll manage on my own.~ */ + just_bodies
	END

	IF ~~ THEN BEGIN skip_disarm
		SAY @2009 // ~Do you want us to heal you while we're here?~ 
		++ @2003 /* ~Uh, sure.  Go ahead.~ */ + duke_priest_nodisarm_02
		++ @2004 /* ~No thanks, I'll manage on my own.~ */ + duke_priest_01
	END

	IF ~~ THEN BEGIN duke_priest_01
		SAY @2005 // ~You've done a great deed for the city, <CHARNAME>, indeed for the entire Sword Coast.~
		= @2006 // ~Return to the Palace when you are ready and speak to the Dukes, they wish to thank you. Fare well.~
		IF ~~ THEN DO ~SetGlobal("#L_SwordTaken","GLOBAL",1) ActionOverride("#LffHlr1",TakePartyItem("SW2H16")) ActionOverride("#LffHlr1",DestroyItem("SW2H16")) ActionOverride("#LffHlr1",EscapeArea()) ActionOverride("#LffHlr2",EscapeArea())~ EXIT
	END  

	IF ~~ THEN BEGIN duke_priest_02
		SAY @2007 /* ~With pleasure. Please hold still for a moment...~ */
		IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutscene("#L_Cut01")~ EXIT
	END

	IF ~~ THEN BEGIN duke_priest_nodisarm_02
		SAY @2007 /* ~With pleasure. Please hold still for a moment...~ */
		IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutscene("#L_Cut02")~ EXIT
	END

	IF ~~ THEN BEGIN just_bodies
		SAY @2010 /* ~We'll just get the bodies out of the way.~ */
		IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutscene("#L_Cut03")~ EXIT
	END

	IF ~Global("#L_FFWrapItUp","MYAREA",1)~ THEN BEGIN duke_priest_03
		SAY @2008 /* ~That should do it.~ */
		IF ~~ THEN + duke_priest_01
	END
// END OF NEW DIALOGUE FILE