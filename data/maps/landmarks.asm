landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark 44,  116, LittlerootTownName
	landmark 44,   108,  Route101Name
	landmark 44,   100, OldaleTownName
	landmark 36,   100,  Route102Name
	landmark 44,   94,  Route103Name
	landmark 28,   100, PetalburgCityName
	landmark 20,   100,  Route104Name
	landmark 20,   108,  Route105Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  76,  52, MtMoonName
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 132,  52, RockTunnelName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName

LittlerootTownName:  db "LITTLEROOT¯TOWN@"
Route101Name:        db "ROUTE 101@"
OldaleTownName:      db "OLDALE¯TOWN@"
Route102Name:        db "ROUTE 102@"
Route103Name:        db "ROUTE 103@"
PetalburgCityName:   db "PETALBURG¯CITY@"
Route104Name:        db "ROUTE 104@"
Route105Name:        db "ROUTE 105@"
NotApplicableName:   db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
ViridianCityName:    db "VIRIDIAN¯CITY@"
LavenderTownName:    db "LAVENDER¯TOWN@"
VermilionCityName:   db "VERMILION¯CITY@"
CeladonCityName:     db "CELADON¯CITY@"
SaffronCityName:     db "SAFFRON¯CITY@"
FuchsiaCityName:     db "FUCHSIA¯CITY@"
IndigoPlateauName:   db "INDIGO¯PLATEAU@"
VictoryRoadName:     db "VICTORY¯ROAD@"
MtMoonName:          db "MT.MOON@"
RockTunnelName:      db "ROCK TUNNEL@"
LavRadioTowerName:   db "LAV¯RADIO TOWER@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
PokemonMansionName:  db "#MON¯MANSION@"
CeruleanCaveName:    db "CERULEAN¯CAVE@"
Route2Name:          db "ROUTE 2@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route28Name:         db "ROUTE 28@"
Route29Name:         db "ROUTE 29@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
DiglettsCaveName:    db "DIGLETT'S¯CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
BattleTowerName:     db "BATTLE¯TOWER@"
SpecialMapName:      db "SPECIAL@"
