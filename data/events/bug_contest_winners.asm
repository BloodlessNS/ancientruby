BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherRick ; this reverts back to the player
	dw BugContestant_BugCatcherRick
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherRick:
	db BUG_CATCHER, RICK
	dbw CASCOON,     300
	dbw SILCOON,    285
	dbw WURMPLE,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw BEAUTIFLY, 286
	dbw BEAUTIFLY, 251
	dbw WURMPLE,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw SCYTHER,    357
	dbw BEAUTIFLY, 349
	dbw PINSIR,     368

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     332
	dbw BEAUTIFLY, 324
	dbw VENONAT,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw BEAUTIFLY, 318
	dbw WEEDLE,     295
	dbw WURMPLE,   285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw PINSIR,     366
	dbw VENONAT,    329
	dbw CASCOON,     314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw BEAUTIFLY, 341
	dbw SILCOON,    301
	dbw WURMPLE,   264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    326
	dbw BEAUTIFLY, 292
	dbw SILCOON,    282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw WEEDLE,     270
	dbw PINSIR,     282
	dbw WURMPLE,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw VENONAT,    267
	dbw SURSKIT,      254
	dbw CASCOON,     259
