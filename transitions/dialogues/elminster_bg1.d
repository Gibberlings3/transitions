///////////////////////////////////////////////////////////////////
// New dialogue file for elminster but uses old dialogue strings //
// Used jastey's reputation cut-offs to remain consistent        //
// Patched via elminster.tpa                                     //
///////////////////////////////////////////////////////////////////
BEGIN ~#LELMN01~
	IF ~ReputationGT(Player1,9) ReputationLT(Player1,16)~ THEN CHAT1
		SAY #12741
		IF ~~ THEN DO ~ActionOverride("#LELMN01",EscapeArea())~ EXIT
	END

	IF ~ReputationLT(Player1,10)~ THEN CHAT2
		SAY #12742
		IF ~~ THEN DO ~ActionOverride("#LELMN01",EscapeArea())~ EXIT
	END

	IF ~ReputationGT(Player1,15)~ THEN CHAT3
		SAY #12743
		IF ~~ THEN DO ~ActionOverride("#LELMN01",EscapeArea())~ EXIT
	END
// END OF NEW DIALOGUE FILE