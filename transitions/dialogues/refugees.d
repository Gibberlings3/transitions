////////////////////////////////////
// Refugee dialogues              //
// Import from Endless BG1        //
// Only the names have changed    //
// Compiled via timers_common.tpa //
////////////////////////////////////
BEGIN ~#LRfgAdt~
	IF ~Global("#L_InitRefugeeTalk","GLOBAL",0)~ THEN REFUGEES_INIT
		SAY @2285 /* ~We travelled all the way here from High Moor because they burnt down our farms.  We don't know who they were, only that they are still out there and their number is growing.  Will Baldur's Gate help us, we don't feel safe outside the city walls?~ */
		IF ~~ THEN DO ~SetGlobal("#L_InitRefugeeTalk","GLOBAL",1)~ JOURNAL @1030 /* ~Refugees from the Far North... */ EXIT
	END

	IF ~Global("#L_InitRefugeeTalk","GLOBAL",1) RandomNum(5,1)~ THEN REFUGEES_01
		SAY @2286 /* ~They burned everything down - after taking all our livestock. Why would anyone do that?~ */
		IF ~~ THEN EXIT
	END

	IF ~Global("#L_InitRefugeeTalk","GLOBAL",1) RandomNum(5,2)~ THEN REFUGEES_02
		SAY @2287 /* ~So many angry men, and they destroy everything in their wake. I really hope we're safe here in the south.~ */
		IF ~~ THEN EXIT
	END

	IF ~Global("#L_InitRefugeeTalk","GLOBAL",1) RandomNum(5,3)~ THEN REFUGEES_03
		SAY @2288 /* ~They asked us to join them, and then they started rampaging and killing... We fled with what few belongings we could carry.~ */
		IF ~~ THEN EXIT
	END

	IF ~Global("#L_InitRefugeeTalk","GLOBAL",1) RandomNum(5,4)~ THEN REFUGEES_04
		SAY @2289 /* ~They destroyed the whole village - and I don't want to know what they did to the villagers who didn't flee soon enough!~ */
		IF ~~ THEN EXIT
	END

	IF ~Global("#L_InitRefugeeTalk","GLOBAL",1) RandomNum(5,5)~ THEN REFUGEES_05
		SAY @2290 /* ~Join them! Join them! On a crusade of plundering and killing those murderers asked us to join them! I fled as soon as I could.~ */
		IF ~~ THEN EXIT
	END

BEGIN ~#LRfgChl~
	IF ~RandomNum(3,1)~ THEN CHILD_01
		SAY @2291 /* ~Mooooooom! The stranger is talking to me!!~ */
		IF ~~ THEN EXIT
	END

	IF ~RandomNum(3,2)~ THEN CHILD_02
		SAY @2292 /* ~I lost my puppy!~ */
		IF ~~ THEN EXIT
	END

	IF ~RandomNum(3,3)~ THEN CHILD_03
		SAY @2293 /* ~I wanna go home.~ */
		IF ~~ THEN EXIT
	END



