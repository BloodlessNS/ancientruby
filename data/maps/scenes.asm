scene_var: MACRO
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,                               wPokecenter2FSceneID
	scene_var TRADE_CENTER,                                wTradeCenterSceneID
	scene_var COLOSSEUM,                                   wColosseumSceneID
	scene_var TIME_CAPSULE,                                wTimeCapsuleSceneID
	scene_var TRAINER_HOUSE_B1F,                           wTrainerHouseB1FSceneID
	scene_var VICTORY_ROAD_GATE,                           wVictoryRoadGateSceneID
	scene_var SAFFRON_MAGNET_TRAIN_STATION,                wSaffronMagnetTrainStationSceneID
	scene_var ROUTE_16_GATE,                               wRoute16GateSceneID
	scene_var ROUTE_17_ROUTE_18_GATE,                      wRoute17Route18GateSceneID
	scene_var INDIGO_PLATEAU_POKECENTER_1F,                wIndigoPlateauPokecenter1FSceneID
	scene_var WILLS_ROOM,                                  wWillsRoomSceneID
	scene_var KOGAS_ROOM,                                  wKogasRoomSceneID
	scene_var BRUNOS_ROOM,                                 wBrunosRoomSceneID
	scene_var KARENS_ROOM,                                 wKarensRoomSceneID
	scene_var LANCES_ROOM,                                 wLancesRoomSceneID
	scene_var HALL_OF_FAME,                                wHallOfFameSceneID
	scene_var ELMS_LAB,                                    wElmsLabSceneID
	scene_var PLAYERS_HOUSE_1F,                            wPlayersHouse1FSceneID
	scene_var CHERRYGROVE_CITY,                            wCherrygroveCitySceneID
	scene_var MR_POKEMONS_HOUSE,                           wMrPokemonsHouseSceneID
	scene_var GOLDENROD_GYM,                               wGoldenrodGymSceneID
	scene_var GOLDENROD_MAGNET_TRAIN_STATION,              wGoldenrodMagnetTrainStationSceneID
	scene_var GOLDENROD_POKECENTER_1F,                     wGoldenrodPokecenter1FSceneID
	scene_var ROUTE_34,                                    wRoute34SceneID ; unused
	scene_var ROUTE_34_ILEX_FOREST_GATE,                   wRoute34IlexForestGateSceneID ; unused
	scene_var CIANWOOD_CITY,                               wCianwoodCitySceneID
	scene_var BATTLE_TOWER_1F,                             wBattleTower1FSceneID
	scene_var BATTLE_TOWER_BATTLE_ROOM,                    wBattleTowerBattleRoomSceneID
	scene_var BATTLE_TOWER_ELEVATOR,                       wBattleTowerElevatorSceneID
	scene_var BATTLE_TOWER_HALLWAY,                        wBattleTowerHallwaySceneID
	scene_var BATTLE_TOWER_OUTSIDE,                        wBattleTowerOutsideSceneID ; unused
	scene_var MOUNT_MOON,                                  wMountMoonSceneID
	scene_var SPROUT_TOWER_3F,                             wSproutTower3FSceneID
	scene_var TIN_TOWER_1F,                                wTinTower1FSceneID
	scene_var BURNED_TOWER_1F,                             wBurnedTower1FSceneID
	scene_var BURNED_TOWER_B1F,                            wBurnedTowerB1FSceneID
	scene_var RADIO_TOWER_5F,                              wRadioTower5FSceneID
	scene_var RUINS_OF_ALPH_OUTSIDE,                       wRuinsOfAlphOutsideSceneID
	scene_var RUINS_OF_ALPH_RESEARCH_CENTER,               wRuinsOfAlphResearchCenterSceneID
	scene_var RUINS_OF_ALPH_HO_OH_CHAMBER,                 wRuinsOfAlphHoOhChamberSceneID
	scene_var RUINS_OF_ALPH_KABUTO_CHAMBER,                wRuinsOfAlphKabutoChamberSceneID
	scene_var RUINS_OF_ALPH_OMANYTE_CHAMBER,               wRuinsOfAlphOmanyteChamberSceneID
	scene_var RUINS_OF_ALPH_AERODACTYL_CHAMBER,            wRuinsOfAlphAerodactylChamberSceneID
	scene_var RUINS_OF_ALPH_INNER_CHAMBER,                 wRuinsOfAlphInnerChamberSceneID
	scene_var TEAM_ROCKET_BASE_B1F,                        wTeamRocketBaseB1FSceneID
	scene_var TEAM_ROCKET_BASE_B2F,                        wTeamRocketBaseB2FSceneID
	scene_var TEAM_ROCKET_BASE_B3F,                        wTeamRocketBaseB3FSceneID
	scene_var GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, wGoldenrodUndergroundSwitchRoomEntrancesSceneID
	scene_var SILVER_CAVE_ROOM_3,                          wSilverCaveRoom3SceneID ; unused
	scene_var VICTORY_ROAD,                                wVictoryRoadSceneID
	scene_var DRAGONS_DEN_B1F,                             wDragonsDenB1FSceneID
	scene_var DRAGON_SHRINE,                               wDragonShrineSceneID
	scene_var OLIVINE_PORT,                                wOlivinePortSceneID
	scene_var VERMILION_PORT,                              wVermilionPortSceneID
	scene_var FAST_SHIP_1F,                                wFastShip1FSceneID
	scene_var FAST_SHIP_B1F,                               wFastShipB1FSceneID
	scene_var MOUNT_MOON_SQUARE,                           wMountMoonSquareSceneID
	scene_var MOBILE_TRADE_ROOM,                           wMobileTradeRoomSceneID
	scene_var MOBILE_BATTLE_ROOM,                          wMobileBattleRoomSceneID
	scene_var LITTLEROOT_TOWN_INTRO,                       wLittlerootTownIntroSceneID
	scene_var LITTLEROOT_TOWN,                             wLittlerootTownSceneID
	scene_var RIVALS_HOUSE,                                wRivalsHouseSceneID
	scene_var OLDALE_TOWN,                                 wOldaleTownSceneID
	scene_var ROUTE_101,                                   wRoute101SceneID
	scene_var PETALBURG_CITY,                              wPetalburgCitySceneID
	scene_var ROUTE_102,                                   wRoute102SceneID
	scene_var PETALBURG_GYM,                               wPetalburgGymSceneID
	db -1
