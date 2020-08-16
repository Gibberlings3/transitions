/////////////////////////////////////////////////////////////
// Snarky additions to BG2 dialogue to lighten it up a bit //
// Compiled via snark_n_wit.tpa using snw_bg2.tra          //
/////////////////////////////////////////////////////////////

EXTEND_BOTTOM SUELLE2 18
	IF ~ReputationLT(Player1,10) !Global("#L_Snark","GLOBAL",0)~ THEN REPLY @4000 /* ~Only partially?~ */ + 19
	IF ~ReputationGT(Player1,9) !Global("#L_Snark","GLOBAL",0)~ THEN REPLY @4000 /* ~Only partially?~ */ + 20
END
