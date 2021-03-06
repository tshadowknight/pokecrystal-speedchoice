
; MonType: ; cf5f
PARTYMON   EQU 0
OTPARTYMON EQU 1
BOXMON     EQU 2
BREEDMON   EQU 3
WILDMON    EQU 4

; Options: ; cfcc
INST_TEXT      EQU 0
FAST_TEXT      EQU 1
MED_TEXT       EQU 2
SLOW_TEXT      EQU 3
NO_TEXT_SCROLL EQU 4
; bits
STEREO         EQU 5
BATTLE_SHIFT   EQU 6
BATTLE_SCENE   EQU 7

; Options2:
MENU_ACCOUNT 	EQU 0
HOLD_TO_MASH 	EQU 1
PARKBALL_EFFECT	EQU 2

; wPermanentOptions:
ROCKETLESS EQU 0
SPINNERS EQU 1
SPINNERHELL EQU 2 ; this isn't actually just a bit, but both spinner hell modes have bit 2 set
MAX_RANGE EQU 3
NERF_HMS EQU 4
BETTER_ENC_SLOTS EQU 5
DISABLE_GENDER EQU 6
BW_XP EQU 7

; wPermanentOptions2:
BETTER_MARTS EQU 8
BETTER_MARTS_F EQU 0
EVOLVED_EARLY_WILDS EQU 9
EVOLVED_EARLY_WILDS_F EQU 1
GOAL_MASK EQU %00001100
RACE_GOAL EQU 10

GOAL_NONE EQU 0
GOAL_ELITEFOUR EQU %00000100
GOAL_RED EQU %00001000

EARLY_KANTO EQU 12
EARLY_KANTO_F EQU 4

EASY_TIN_TOWER EQU 13
EASY_TIN_TOWER_F EQU 5

START_AT_GOLDENROD EQU 14
START_AT_GOLDENROD_F EQU 6

; GBPrinter:
PRINT_LIGHTEST EQU $00
PRINT_LIGHTER  EQU $20
PRINT_NORMAL   EQU $40
PRINT_DARKER   EQU $60
PRINT_DARKEST  EQU $7f

; WalkingDirection: ; d043
STANDING EQU -1
DOWN     EQU 0
UP       EQU 1
LEFT     EQU 2
RIGHT    EQU 3

; FacingDirection: ; d044
FACE_CURRENT EQU 0
FACE_DOWN  EQU 8
FACE_UP    EQU 4
FACE_LEFT  EQU 2
FACE_RIGHT EQU 1

; TimeOfDay: ; d269
MORN     EQU 0
DAY      EQU 1
NITE     EQU 2
DARKNESS EQU 3

; ScriptFlags: ; d434
SCRIPT_RUNNING EQU 2

; ScriptMode: ; d437
SCRIPT_OFF EQU 0
SCRIPT_READ EQU 1
SCRIPT_WAIT_MOVEMENT EQU 2
SCRIPT_WAIT EQU 3

; CurDay: ; d4cb
SUNDAY    EQU 0
MONDAY    EQU 1
TUESDAY   EQU 2
WEDNESDAY EQU 3
THURSDAY  EQU 4
FRIDAY    EQU 5
SATURDAY  EQU 6

; MapObjects: ; d71e

PLAYER_OBJECT EQU 0

NUM_OBJECTS   EQU $10

; InputType: ; c2c7
AUTO_INPUT EQU $ff

; WhichRegisteredItem: ; d95b
REGISTERED_POCKET EQU %11000000
REGISTERED_NUMBER EQU %00111111

; PlayerState: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SLIP      EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8

OBJECT_STRUCT_LENGTH EQU 40
NUM_OBJECT_STRUCTS EQU 13

; After-Champion Spawn
SPAWN_LANCE EQU 1
SPAWN_RED EQU 2

; wPokemonWithdrawDepositParameter
PC_WITHDRAW EQU 0
PC_DEPOSIT EQU 1
DAYCARE_WITHDRAW EQU 2
DAYCARE_DEPOSIT EQU 3

; wCurrentDexMode
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN
