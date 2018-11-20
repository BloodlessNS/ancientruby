treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ROUTE_28,                  TREEMON_SET_CITY
	treemon_map ROUTE_30,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_31,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_34,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_40,                  TREEMON_SET_CITY
	treemon_map ROUTE_41,                  TREEMON_SET_CITY
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_CITY
	treemon_map CIANWOOD_CITY,             TREEMON_SET_CITY
	treemon_map GOLDENROD_CITY,            TREEMON_SET_CITY
	treemon_map SILVER_CAVE_OUTSIDE,       TREEMON_SET_CITY
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	db -1

RockMonMaps:
	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	treemon_map ROUTE_40,                  TREEMON_SET_ROCK
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, TREEMON_SET_ROCK
	treemon_map RALTS_WELL_B1F,         TREEMON_SET_ROCK
	db -1
