/////////////////////////////////////////////
// Imp is tasked with finding the PC chest //
// Compiled via main_eet.tpa               //
/////////////////////////////////////////////
EXTEND_BOTTOM BOTSMITH 3
	IF ~Global("#L_PCChest","MYAREA",0) OR(5) Global("#L_AcceptedRoom","GLOBAL",1) Global("#L_HouseBGate1","GLOBAL",2) Global("#L_HouseBGate2","GLOBAL",2) Global("#L_HouseBeregost","GLOBAL",2) Global("#L_HouseHHedge","GLOBAL",2)~ THEN REPLY @2588 /* ~I have a chest full of items I've put aside. Can you find it and bring it here? */ GOTO sure_sure 
END

APPEND ~BOTSMITH~
	IF ~~ THEN BEGIN sure_sure
		SAY @2589 // ~Sure sure! No problem! I find it in a jiffy. You'll see!~
		IF ~~ DO ~SetGlobal("#L_PCChest","MYAREA",1) SetGlobalTimer("#L_PCChestTimer","MYAREA",THREE_MINUTES)~ EXIT
	END
	
	IF WEIGHT #-1 ~Global("#L_PCChest","MYAREA",2)~ THEN BEGIN found_it
		SAY @2590 // ~<PROPER_MASTERMISTRESS> <PROPER_MASTERMISTRESS>! I found your stuff! It's all in the middle chest, it is! Every last thing.~ 
		IF ~~ DO ~SetGlobal("#L_PCChest","MYAREA",3)~ EXIT
	END
END

