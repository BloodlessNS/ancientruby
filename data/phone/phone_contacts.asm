phone: MACRO
; trainer class, trainer id, map, time 1, script 1, time 2, script 2
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,   PLAYERS_HOUSE_1F, ANYTIME, MomPhoneScript,      0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,  N_A,              ANYTIME, BillPhoneScript1,    0,       BillPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_ELM,   ELMS_LAB,         ANYTIME, ElmPhoneScript1,     0,       ElmPhoneScript2
	phone SCHOOLBOY,    JACK1,              NATIONAL_PARK,    ANYTIME, JackPhoneScript1,    ANYTIME, JackPhoneScript2
	phone POKEFANF,     BEVERLY1,           NATIONAL_PARK,    ANYTIME, BeverlyPhoneScript1, ANYTIME, BeverlyPhoneScript2
	phone SAILOR,       HUEY1,              NATIONAL_PARK, ANYTIME, HueyPhoneScript1, ANYTIME, HueyPhoneScript2
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone COOLTRAINERM, GAVEN3,             ROUTE_2,         ANYTIME, GavenPhoneScript1,   ANYTIME, GavenPhoneScript2
	phone COOLTRAINERF, BETH1,              ROUTE_2,         ANYTIME, BethPhoneScript1,    ANYTIME, BethPhoneScript2
	phone BIRD_KEEPER,  JOSE2,              ROUTE_2,         ANYTIME, JosePhoneScript1,    ANYTIME, JosePhoneScript2
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone LASS,         DANA1,              ROUTE_40,         ANYTIME, DanaPhoneScript1,    ANYTIME, DanaPhoneScript2
	phone SCHOOLBOY,    CHAD1,              ROUTE_40,         ANYTIME, ChadPhoneScript1,    ANYTIME, ChadPhoneScript2
	phone POKEFANM,     DEREK1,             ROUTE_40,         ANYTIME, DerekPhoneScript1,   ANYTIME, DerekPhoneScript2
	phone FISHER,       TULLY1,             ROUTE_101,         ANYTIME, TullyPhoneScript1,   ANYTIME, TullyPhoneScript2
	phone POKEMANIAC,   BRENT1,             ROUTE_101,         ANYTIME, BrentPhoneScript1,   ANYTIME, BrentPhoneScript2
	phone PICNICKER,    TIFFANY3,           ROUTE_101,         ANYTIME, TiffanyPhoneScript1, ANYTIME, TiffanyPhoneScript2
	phone BIRD_KEEPER,  VANCE1,             ROUTE_101,         ANYTIME, VancePhoneScript1,   ANYTIME, VancePhoneScript2
	phone FISHER,       WILTON1,            ROUTE_101,         ANYTIME, WiltonPhoneScript1,  ANYTIME, WiltonPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_BUENA, GOLDENROD_DEPT_STORE_ROOF, ANYTIME, BuenaPhoneScript1, ANYTIME, BuenaPhoneScript2
