const_value set 2
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_BALL1
	const ECRUTEAKCITY_BALL2
	const ECRUTEAKCITY_BALL3
	const ECRUTEAKCITY_BALLGUY
	const ECRUTEAKCITY_BYSTANDER1
	const ECRUTEAKCITY_BYSTANDER2
	const ECRUTEAKCITY_BYSTANDER3
	const ECRUTEAKCITY_BYSTANDER4

EcruteakCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

GrampsScript_0x1a4009:
	jumptextfaceplayer UnknownText_0x1a4105

GrampsScript_0x1a400c:
	jumptextfaceplayer UnknownText_0x1a4147

GrampsScript_0x1a400f:
	jumptextfaceplayer UnknownText_0x1a43cb

LassScript_0x1a4012:
	jumptextfaceplayer UnknownText_0x1a41db

LassScript_0x1a4015:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue UnknownScript_0x1a4023
	writetext UnknownText_0x1a421a
	waitbutton
	closetext
	end

UnknownScript_0x1a4023:
	writetext UnknownText_0x1a4269
	waitbutton
	closetext
	end

FisherScript_0x1a4029:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0x1a4037
	writetext UnknownText_0x1a42ac
	waitbutton
	closetext
	end

UnknownScript_0x1a4037:
	writetext UnknownText_0x1a4325
	waitbutton
	closetext
	end

YoungsterScript_0x1a403d:
	jumptextfaceplayer UnknownText_0x1a4386
	
Bystander1Script:
	jumptextfaceplayer Bystander1Text	
	
Bystander2Script:
	jumptextfaceplayer Bystander2Text	

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokeCenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	dwb EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION, HYPER_POTION


BallGuyStart:	
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, ECRUTEAKCITY_BALLGUY, 15	
	opentext
	writetext BallGuyIntroText
	waitbutton
	closetext	
	end	
	
WalkToPokeballsTriggerSouth:	
	checkevent EVENT_ECRUTEAK_START
	iftrue BallGuyDone
	scall BallGuyStart
	applymovement PLAYER, MoveToBalls1
	jump BallGuyChooseOne
	
WalkToPokeballsTriggerNorth:
	checkevent EVENT_ECRUTEAK_START
	iftrue BallGuyDone
	scall BallGuyStart
	applymovement PLAYER, MoveToBalls2
	
BallGuyChooseOne:
	opentext
	writetext BallGuyChooseOneText
	waitbutton
	closetext

BallGuyDone:	
	end 
	
BallGuyIntroText:
	text "Young trainer,"
	line "please step up!"
	done
	
BallGuyChooseOneText:
	text "You may choose"
	line "one #MON!"
	
	para "Choose wisely!"
	done

MoveToBalls1:
	step_up
	step_up
	step_right
	step_right
	turn_head_up
	step_end	
	
MoveToBalls2:
	step_up
	step_right
	step_right
	turn_head_up
	step_end	
	
	
CyndaquilPokeBallScript_Ecruteak:
	refreshscreen $0
;Randomizer_StarterCyndaquilOffset1::
	pokepic CYNDAQUIL
;Randomizer_StarterCyndaquilOffset2::
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText_Ecruteak
	yesorno
	iffalse DidntChooseStarterScript_Ecruteak
	disappear ECRUTEAKCITY_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText_Ecruteak
	buttonsound
	waitsfx
;Randomizer_StarterCyndaquilOffset3::
	pokenamemem CYNDAQUIL, $0
	writetext ReceivedStarterText_Ecruteak
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
;Randomizer_StarterCyndaquilOffset4::
	givepoke CYNDAQUIL, 25, BERRY
	closetext
	applymovement ECRUTEAKCITY_BALLGUY, BallGuyMove1 
	jump FinishUpStarterSelection

TotodilePokeBallScript_Ecruteak:
	refreshscreen $0
;Randomizer_StarterTotodileOffset1::
	pokepic TOTODILE
;Randomizer_StarterTotodileOffset2::
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText_Ecruteak
	yesorno
	iffalse DidntChooseStarterScript_Ecruteak
	disappear ECRUTEAKCITY_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText_Ecruteak
	buttonsound
	waitsfx
;Randomizer_StarterTotodileOffset3::
	pokenamemem TOTODILE, $0
	writetext ReceivedStarterText_Ecruteak
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
;Randomizer_StarterTotodileOffset4::
	givepoke TOTODILE, 25, BERRY
	closetext
	applymovement ECRUTEAKCITY_BALLGUY, BallGuyMove2
	jump FinishUpStarterSelection	
	
ChikoritaPokeBallScript_Ecruteak:
	refreshscreen $0
;Randomizer_StarterChikoritaOffset1::
	pokepic CHIKORITA
;Randomizer_StarterChikoritaOffset2::
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText_Ecruteak
	yesorno
	iffalse DidntChooseStarterScript_Ecruteak
	disappear ECRUTEAKCITY_BALL3
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText_Ecruteak
	buttonsound
	waitsfx
;Randomizer_StarterChikoritaOffset3::
	pokenamemem CHIKORITA, $0
	writetext ReceivedStarterText_Ecruteak
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
;Randomizer_StarterChikoritaOffset4::
	givepoke CHIKORITA, 25, BERRY
	closetext
	applymovement ECRUTEAKCITY_BALLGUY, BallGuyMove3
	jump FinishUpStarterSelection		
	
FinishUpStarterSelection:		
	opentext
	writetext StarterSelectionFinishedText
	waitbutton	
	writetext BallGuy_GiveYouBalls
	buttonsound
	itemtotext POKE_BALL, $1
	scall BallGuy_ReceiveTheBalls
	giveitem POKE_BALL, 5
	buttonsound
	itemnotify	
	writetext BallGuy_GiveYouDex
	buttonsound
	waitsfx
	writetext BallGuy_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext BallGuyOutroText
	waitbutton
	closetext	
	special Special_FadeBlackQuickly
	setevent EVENT_ECRUTEAK_START
	disappear ECRUTEAKCITY_BALL1
	disappear ECRUTEAKCITY_BALL2
	disappear ECRUTEAKCITY_BALL3
	disappear ECRUTEAKCITY_BALLGUY
	disappear ECRUTEAKCITY_BYSTANDER1
	disappear ECRUTEAKCITY_BYSTANDER2
	disappear ECRUTEAKCITY_BYSTANDER3
	disappear ECRUTEAKCITY_BYSTANDER4
	special Special_ReloadSpritesNoPalettes	
	pause 15
	special Special_FadeInQuickly
	end

BallGuy_ReceiveTheBalls:
	jumpstd receiveitem
	end	

DidntChooseStarterScript_Ecruteak:
	writetext DidntChooseStarterText_Ecruteak
	waitbutton
	closetext
	end
	
BallGuyMove1:
	step_left
	step_down
	step_end

BallGuyMove2:
	step_down
	step_end

BallGuyMove3:
	step_right
	step_down
	step_end	
	
DidntChooseStarterText_Ecruteak:
	text "Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done	
	
ChoseStarterText_Ecruteak:
	text "I think that's"
	line "a great #MON"
	cont "too!"
	done	
	
ReceivedStarterText_Ecruteak:
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done	
	
TakeCyndaquilText_Ecruteak:
	text "You'll take"
; Randomizer_StarterCyndaquilTextOffset::
	line "CYNDAQUIL, the"
	cont "fire #MON?"
	done
	
TakeTotodileText_Ecruteak:
	text "Do you want"
;Randomizer_StarterTotodileTextOffset::
	line "TOTODILE, the"
	cont "water #MON?"
	done	
	
TakeChikoritaText_Ecruteak:
	text "So, you like"
;Randomizer_StarterChikoritaTextOffset::
	line "CHIKORITA, the"
	cont "grass #MON?"
	done	
	
StarterSelectionFinishedText:
	text "I'm sure you"	
	line "two will make"
	cont "a great team!"
	done

BallGuy_GiveYouBalls:
	text "Please take these"
	line "as well!"
	done
	
BallGuy_GiveYouDex:
	text "And last but"
	line "not least!"
	done	
	
BallGuy_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done	
	
BallGuyOutroText:	
	text "Be sure to say"
	line "hi to professor"
	cont "ELM if you ever"
	cont "visit NEW BARK"
	cont "TOWN."
	para "He donated these"
	line "#MON after all!"
	
	para "Well, so long!"
	done
	
PreventEscapeText:
	opentext
	writetext TheresNoEscapeText
	waitbutton
	closetext
	end
	
PreventEscape1:
	checkevent EVENT_ECRUTEAK_START
	iftrue BallGuyDone
	scall PreventEscapeText
	applymovement PLAYER, NoEscapeMovement1
	end
	
PreventEscape2:
	checkevent EVENT_ECRUTEAK_START
	iftrue BallGuyDone
	scall PreventEscapeText
	applymovement PLAYER, NoEscapeMovement2
	end

PreventEscape3:
	checkevent EVENT_ECRUTEAK_START
	iftrue BallGuyDone
	scall PreventEscapeText
	applymovement PLAYER, NoEscapeMovement3
	end

	
TheresNoEscapeText:
	text "Trainer, please"
	line "choose a #MON!"
	done
	
NoEscapeMovement1:
	step_right
	step_end	
	
NoEscapeMovement2:
	step_up
	step_end	
	
NoEscapeMovement3:
	step_left
	step_end	
	
UnusedMissingDaughterText:
; This text is neither used nor referenced in the final game.
	text "Oh, no. Oh, no…"

	para "My daughter is"
	line "missing."

	para "No… She couldn't"
	line "have gone to the"
	cont "BURNED TOWER."

	para "I told her not to"
	line "go near it…"

	para "People seem to"
	line "disappear there…"

	para "Oh, what should I"
	line "do…?"
	done

UnknownText_0x1a4105:
	text "ECRUTEAK used to"
	line "have two towers:"

	para "one each in the"
	line "east and west."
	done

UnknownText_0x1a4147:
	text "Ah, child."
	line "Have you learned"

	para "to dance like the"
	line "KIMONO GIRLS?"

	para "If you go to their"
	line "DANCE THEATER, an"

	para "odd old man will"
	line "give you something"
	cont "nice, I hear."
	done

UnknownText_0x1a41db:
	text "I'm going to prac-"
	line "tice at the DANCE"

	para "THEATER. Care to"
	line "join me?"
	done

UnknownText_0x1a421a:
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

UnknownText_0x1a4269:
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

UnknownText_0x1a42ac:
	text "I heard a rumor"
	line "about OLIVINE"
	cont "LIGHTHOUSE."

	para "The #MON that"
	line "serves as the"

	para "beacon fell ill."
	line "Sounds like they"
	cont "are in trouble."
	done

UnknownText_0x1a4325:
	text "The #MON at"
	line "OLIVINE LIGHTHOUSE"
	cont "has been cured."

	para "Boats can safely"
	line "sail out to sea at"
	cont "night again."
	done

UnknownText_0x1a4386:
	text "I hear #MON are"
	line "rampaging at the"

	para "LAKE OF RAGE. I'd"
	line "like to see that."
	done
	
Bystander1Text:
	text "Ooh…"
	line "I wonder what kind"
	cont "of #MON are"
	cont "available today."
	done 	

Bystander2Text:	
	text "Man, I wish"
	line "I could get a"
	cont "#MON too…"
	done
	
UnknownText_0x1a43cb:
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #MON"
	line "perished in it."

	para "A rainbow-colored"
	line "#MON descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by ECRUTEAK"
	line "GYM LEADERS."

	para "Me?"

	para "I was a trainer"
	line "way back when."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "ECRUTEAK CITY"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done

TinTowerSignText:
	text "TIN TOWER"

	para "A legendary #-"
	line "MON is said to"
	cont "roost here."
	done

EcruteakGymSignText:
	text "ECRUTEAK CITY"
	line "#MON GYM"
	cont "LEADER: MORTY"

	para "The Mystic Seer of"
	line "the Future"
	done

EcruteakDanceTheaterSignText:
	text "ECRUTEAK DANCE"
	line "THEATER"
	done

BurnedTowerSignText:
	text "BURNED TOWER"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Please stay away,"
	line "as it is unsafe."
	done
	

		

EcruteakCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 15
	warp_def $1a, $23, 1, ROUTE_42_ECRUTEAK_GATE
	warp_def $1b, $23, 2, ROUTE_42_ECRUTEAK_GATE
	warp_def $b, $12, 1, ECRUTEAK_HOUSE
	warp_def $2, $14, 1, WISE_TRIOS_ROOM
	warp_def $3, $14, 2, WISE_TRIOS_ROOM
	warp_def $1b, $17, 1, ECRUTEAK_POKECENTER_1F
	warp_def $15, $5, 1, ECRUTEAK_LUGIA_SPEECH_HOUSE
	warp_def $15, $17, 1, DANCE_THEATRE
	warp_def $15, $1d, 2, ECRUTEAK_MART
	warp_def $1b, $6, 1, ECRUTEAK_GYM
	warp_def $1b, $d, 1, ECRUTEAK_ITEMFINDER_HOUSE
	warp_def $7, $25, 1, TIN_TOWER_1F
	warp_def $5, $5, 1, BURNED_TOWER_1F
	warp_def $12, $0, 3, ROUTE_38_ECRUTEAK_GATE
	warp_def $13, $0, 4, ROUTE_38_ECRUTEAK_GATE

.XYTriggers:
	db 7
	xy_trigger $FF, 28, 16, $0, WalkToPokeballsTriggerNorth, $0, $0
	xy_trigger $FF, 29, 16, $0, WalkToPokeballsTriggerSouth, $0, $0
	
	xy_trigger $FF, 27, 16, $0, PreventEscape1, $0, $0
	xy_trigger $FF, 28, 17, $0, PreventEscape2, $0, $0
	xy_trigger $FF, 28, 18, $0, PreventEscape2, $0, $0
	xy_trigger $FF, 28, 19, $0, PreventEscape2, $0, $0
	xy_trigger $FF, 27, 20, $0, PreventEscape3, $0, $0

.Signposts:
	db 8
	signpost 21, 15, SIGNPOST_READ, EcruteakCitySign
	signpost 10, 38, SIGNPOST_READ, TinTowerSign
	signpost 28, 8, SIGNPOST_READ, EcruteakGymSign
	signpost 21, 21, SIGNPOST_READ, EcruteakDanceTheaterSign
	signpost 10, 2, SIGNPOST_READ, BurnedTowerSign
	signpost 27, 24, SIGNPOST_READ, EcruteakCityPokeCenterSign
	signpost 21, 30, SIGNPOST_READ, EcruteakCityMartSign
	signpost 14, 23, SIGNPOST_ITEM, EcruteakCityHiddenHyperPotion

.PersonEvents:
	db 15
	person_event SPRITE_GRAMPS, 15, 18, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a4009, -1
	person_event SPRITE_GRAMPS, 21, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a400c, -1
	person_event SPRITE_LASS, 29, 21, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LassScript_0x1a4012, -1
	person_event SPRITE_LASS, 9, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x1a4015, -1
	person_event SPRITE_FISHER, 22, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a4029, -1
	person_event SPRITE_YOUNGSTER, 14, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a403d, -1
	person_event SPRITE_GRAMPS, 7, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a400f, EVENT_ECRUTEAK_CITY_GRAMPS

	person_event SPRITE_POKE_BALL, 26, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CyndaquilPokeBallScript_Ecruteak, EVENT_ECRUTEAK_START
	person_event SPRITE_POKE_BALL, 26, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TotodilePokeBallScript_Ecruteak, EVENT_ECRUTEAK_START
	person_event SPRITE_POKE_BALL, 26, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ChikoritaPokeBallScript_Ecruteak, EVENT_ECRUTEAK_START

	person_event SPRITE_FISHER, 25, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, EVENT_ECRUTEAK_START
	
	person_event SPRITE_LASS, 30, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, EVENT_ECRUTEAK_START
	person_event SPRITE_GRAMPS, 29, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, EVENT_ECRUTEAK_START
	
	person_event SPRITE_LASS, 28, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Bystander1Script, EVENT_ECRUTEAK_START
	person_event SPRITE_YOUNGSTER, 29, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Bystander2Script, EVENT_ECRUTEAK_START
	

	