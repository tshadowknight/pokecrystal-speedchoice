const_value set 2
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_SUPER_NERD2
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeofRage_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .FlyPoint
	dbw MAPCALLBACK_OBJECTS, .Wesley

.Trigger0
	end

.Trigger1
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_SUPER_NERD2
	return

.WesleyAppears
	appear LAKEOFRAGE_SUPER_NERD2
	return

LanceScript_0x70022:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue UnknownScript_0x70057
	opentext
	writetext UnknownText_0x70157
	buttonsound
	faceplayer
	check_permaoptions ROCKETLESS
	iftrue RocketlessLoRLanceScript1
	writetext UnknownText_0x701b4
	yesorno
	iffalse UnknownScript_0x7004e
UnknownScript_0x70035:
	check_permaoptions ROCKETLESS
	iftrue RocketlessLoRLanceScript2
	writetext UnknownText_0x702c6
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, MovementData_0x70155
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	domaptrigger MAHOGANY_MART_1F, $1
	end

RocketlessLoRLanceScript1:
	writetext UnknownText_0x701b4_Rocketless
	yesorno
	iffalse UnknownScript_0x7004e
RocketlessLoRLanceScript2:
	writetext UnknownText_0x702c6_Rocketless
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	setevent EVENT_DECIDED_TO_HELP_LANCE
	domaptrigger MAHOGANY_MART_1F, $0
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	domaptrigger TEAM_ROCKET_BASE_B2F, $3
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	domaptrigger MAHOGANY_TOWN, $1
	verbosegiveitem BASEMENT_KEY
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_WAREHOUSE_LAYOUT_1
	clearevent EVENT_WAREHOUSE_LAYOUT_2
	clearevent EVENT_WAREHOUSE_LAYOUT_3
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	verbosegiveitem CLEAR_BELL
	domaptrigger RADIO_TOWER_5F, $2
	domaptrigger ECRUTEAK_HOUSE, $0
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	domaptrigger TEAM_ROCKET_BASE_B3F, $3
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	setevent EVENT_TEAM_ROCKET_BASE_POPULATION
	setevent EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	setevent EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	setevent EVENT_RIVAL_TEAM_ROCKET_BASE
	check_permaoptions EARLY_KANTO
	iffalse .skip_boat_and_train
	; setup for boat
	setflag ENGINE_CREDITS_SKIP
	specialphonecall SPECIALCALL_SSTICKET
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	; fix people flags later on
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
.skip_boat_and_train
	check_permaoptions START_AT_GOLDENROD
	iffalse .regular_start
	verbosegiveitem HM_FLY
.regular_start	
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, MovementData_0x70155
	disappear LAKEOFRAGE_LANCE
	end

UnknownScript_0x7004e:
	writetext UnknownText_0x70371
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

UnknownScript_0x70057:
	faceplayer
	opentext
	writetext UnknownText_0x703a5
	yesorno
	iffalse UnknownScript_0x7004e
	jump UnknownScript_0x70035

GyaradosScript_0x70063:
	opentext
	writetext UnknownText_0x703cb
	pause 15
Randomizer_RedGyaradosCry::
	cry GYARADOS
	closetext
Randomizer_RedGyaradosSpecies::
	loadwildmon GYARADOS, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	if_equal $1, UnknownScript_0x7007a
	disappear LAKEOFRAGE_GYARADOS
UnknownScript_0x7007a:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext UnknownText_0x703df
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	dotrigger $0
	appear LAKEOFRAGE_LANCE
	end

GrampsScript_0x7008e:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x7009c
	writetext UnknownText_0x703f8
	waitbutton
	closetext
	end

UnknownScript_0x7009c:
	writetext UnknownText_0x70421
	waitbutton
	closetext
	end

SuperNerdScript_0x700a2:
	jumptextfaceplayer UnknownText_0x70444

CooltrainerFScript_0x700a5:
	jumptextfaceplayer UnknownText_0x704bb

MapLakeofRageSignpost0Script:
	jumptext UnknownText_0x708d7

MapLakeofRageSignpost1Script:
	opentext
	writetext UnknownText_0x70903
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x700b8
	waitbutton
	closetext
	end

UnknownScript_0x700b8:
	buttonsound
	special Special_MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer EVENT_BEAT_FISHER_ANDRE, FISHER, ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, FisherAndreScript

FisherAndreScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7058f
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer EVENT_BEAT_FISHER_RAYMOND, FISHER, RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, FisherRaymondScript

FisherRaymondScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x70611
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer EVENT_BEAT_COOLTRAINERM_AARON, COOLTRAINERM, AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, CooltrainermAaronScript

CooltrainermAaronScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7069c
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer EVENT_BEAT_COOLTRAINERF_LOIS, COOLTRAINERF, LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, CooltrainerfLoisScript

CooltrainerfLoisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x70752
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeofRageElixer:
	itemball ELIXER

LakeofRageTMDetect:
	itemball TM_DETECT

LakeofRageHiddenFullRestore:
	dwb EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE, FULL_RESTORE


LakeofRageHiddenRareCandy:
	dwb EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY, RARE_CANDY


LakeofRageHiddenMaxPotion:
	dwb EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION, MAX_POTION


MovementData_0x70155:
	teleport_from
	step_end

UnknownText_0x70157:
	text "This lake is full"
	line "of GYARADOS but"
	cont "nothing else…"

	para "So the MAGIKARP"
	line "are being forced"
	cont "to evolve…"
	done

UnknownText_0x701b4:
	text "Did you come here"
	line "because of the"
	cont "rumors?"

	para "You're <PLAYER>?"
	line "I'm LANCE, a"
	cont "trainer like you."

	para "I heard some ru-"
	line "mors, so I came to"
	cont "investigate…"

	para "I saw the way you"
	line "battled earlier,"
	cont "<PLAY_G>."

	para "I can tell that"
	line "you're a trainer"

	para "with considerable"
	line "skill."

	para "If you don't mind,"
	line "could you help me"
	cont "investigate?"
	done

UnknownText_0x701b4_Rocketless:
	text "Did you come here"
	line "because of the"
	cont "rumors?"

	para "You're <PLAYER>?"
	line "I'm LANCE, a"
	cont "trainer like you."

	para "I saw the way you"
	line "battled earlier,"
	cont "<PLAY_G>."

	para "I can tell that"
	line "you're a trainer"

	para "with considerable"
	line "skill."

	para "If you don't mind,"
	line "could you take"
	cont "this junk away?"
	done

UnknownText_0x702c6:
	text "LANCE: Excellent!"

	para "It seems that the"
	line "LAKE's MAGIKARP"

	para "are being forced"
	line "to evolve."

	para "A mysterious radio"
	line "broadcast coming"

	para "from MAHOGANY is"
	line "the cause."

	para "I'll be waiting"
	line "for you, <PLAY_G>."
	done

UnknownText_0x702c6_Rocketless:
	text "LANCE: Excellent!"

	para "I found all this"
	line "around town,"
	cont "but I have no use"
	cont "for it at all."

	para "Take it off my"
	line "hands, please!"
	done

UnknownText_0x70371:
	text "Oh… Well, if you"
	line "change your mind,"
	cont "please help me."
	done

UnknownText_0x703a5:
	text "LANCE: Hm? Are you"
	line "going to help me?"
	done

UnknownText_0x703cb:
	text "GYARADOS: Gyashaa!"
	done

UnknownText_0x703df:
	text "<PLAYER> obtained a"
	line "RED SCALE."
	done

UnknownText_0x703f8:
	text "The GYARADOS are"
	line "angry!"

	para "It's a bad omen!"
	done

UnknownText_0x70421:
	text "Hahah! The MAGI-"
	line "KARP are biting!"
	done

UnknownText_0x70444:
	text "I heard this lake"
	line "was made by ram-"
	cont "paging GYARADOS."

	para "I wonder if there"
	line "is any connection"

	para "to their mass out-"
	line "break now?"
	done

UnknownText_0x704bb:
	text "Did my eyes de-"
	line "ceive me? I saw a"

	para "red GYARADOS in"
	line "the LAKE…"

	para "But I thought"
	line "GYARADOS were"
	cont "usually blue?"
	done

FisherAndreSeenText:
	text "Let me battle with"
	line "the #MON I just"
	cont "caught!"
	done

FisherAndreBeatenText:
	text "I might be an ex-"
	line "pert angler, but"

	para "I stink as a #-"
	line "MON trainer…"
	done

UnknownText_0x7058f:
	text "I won't lose as an"
	line "angler! I catch"
	cont "#MON all day."
	done

FisherRaymondSeenText:
	text "No matter what I"
	line "do, all I catch"

	para "are the same #-"
	line "MON…"
	done

FisherRaymondBeatenText:
	text "My line's all"
	line "tangled up…"
	done

UnknownText_0x70611:
	text "Why can't I catch"
	line "any good #MON?"
	done

CooltrainermAaronSeenText:
	text "If a trainer spots"
	line "another trainer,"

	para "he has to make a"
	line "challenge."

	para "That is our"
	line "destiny."
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

UnknownText_0x7069c:
	text "#MON and their"
	line "trainer become"

	para "powerful through"
	line "constant battling."
	done

CooltrainerfLoisSeenText:
	text "What happened to"
	line "the red GYARADOS?"

	para "It's gone?"

	para "Oh, darn. I came"
	line "here for nothing?"

	para "I know--let's"
	line "battle!"
	done

CooltrainerfLoisBeatenText:
	text "Good going!"
	done

UnknownText_0x70752:
	text "Come to think of"
	line "it, I've seen a"
	cont "pink BUTTERFREE."
	done

MeetWesleyText:
	text "WESLEY: Well, how"
	line "do you do?"

	para "Seeing as how it's"
	line "Wednesday today,"

	para "I'm WESLEY of"
	line "Wednesday."
	done

WesleyGivesGiftText:
	text "Pleased to meet"
	line "you. Please take a"
	cont "souvenir."
	done

WesleyGaveGiftText:
	text "WESLEY: BLACKBELT"
	line "beefs up the power"
	cont "of fighting moves."
	done

WesleyWednesdayText:
	text "WESLEY: Since you"
	line "found me, you must"

	para "have met my broth-"
	line "ers and sisters."

	para "Or did you just"
	line "get lucky?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done

UnknownText_0x708d7:
	text "LAKE OF RAGE,"
	line "also known as"
	cont "GYARADOS LAKE."
	done

UnknownText_0x70903:
	text "FISHING GURU'S"
	line "HOUSE"
	done

LakeofRage_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $7, 1, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE
	warp_def $1f, $1b, 1, LAKE_OF_RAGE_MAGIKARP_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 5
	signpost 27, 21, SIGNPOST_READ, MapLakeofRageSignpost0Script
	signpost 31, 25, SIGNPOST_READ, MapLakeofRageSignpost1Script
	signpost 28, 11, SIGNPOST_ITEM, LakeofRageHiddenFullRestore
	signpost 4, 4, SIGNPOST_ITEM, LakeofRageHiddenRareCandy
	signpost 5, 35, SIGNPOST_ITEM, LakeofRageHiddenMaxPotion

.PersonEvents:
	db 12
	person_event SPRITE_LANCE, 28, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LanceScript_0x70022, EVENT_LAKE_OF_RAGE_LANCE
	person_event SPRITE_GRAMPS, 26, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x7008e, -1
	person_event SPRITE_SUPER_NERD, 13, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x700a2, -1
	person_event SPRITE_COOLTRAINER_F, 29, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x700a5, -1
	person_event SPRITE_FISHER, 23, 30, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_FISHER, 26, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_COOLTRAINER_M, 15, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_COOLTRAINER_F, 7, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_GYARADOS, 22, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GyaradosScript_0x70063, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	person_event SPRITE_SUPER_NERD, 4, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	person_event SPRITE_POKE_BALL, 10, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, LakeofRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	person_event SPRITE_POKE_BALL, 2, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, LakeofRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
