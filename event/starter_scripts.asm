CyndaquilPokeBallScriptCommon::
	refreshscreen $0
Randomizer_StarterCyndaquilOffset1::
	pokepic CYNDAQUIL
Randomizer_StarterCyndaquilOffset2::
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	end
CyndaquilPokeBallScriptConfirmed::		
	writetext ChoseStarterText
	buttonsound
	waitsfx
Randomizer_StarterCyndaquilOffset3::
	pokenamemem CYNDAQUIL, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
Randomizer_StarterCyndaquilOffset4::
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	end
	
TotodilePokeBallScriptCommon::	
	refreshscreen $0
Randomizer_StarterTotodileOffset1::
	pokepic TOTODILE
Randomizer_StarterTotodileOffset2::
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	end
TotodilePokeBallScriptConfirmed::		
	writetext ChoseStarterText
	buttonsound
	waitsfx
Randomizer_StarterTotodileOffset3::
	pokenamemem TOTODILE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
Randomizer_StarterTotodileOffset4::
	givepoke TOTODILE, 5, BERRY
	closetext
	end

ChikoritaPokeBallScriptCommon::	
	refreshscreen $0
Randomizer_StarterChikoritaOffset1::
	pokepic CHIKORITA
Randomizer_StarterChikoritaOffset2::
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	end
ChikoritaPokeBallScriptConfirmed::		
	writetext ChoseStarterText
	buttonsound
	waitsfx
Randomizer_StarterChikoritaOffset3::
	pokenamemem CHIKORITA, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
Randomizer_StarterChikoritaOffset4::
	givepoke CHIKORITA, 5, BERRY
	closetext
	end
	
DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end	

TakeCyndaquilText:
	text "ELM: You'll take"
Randomizer_StarterCyndaquilTextOffset::
	line "CYNDAQUIL, the"
	cont "fire #MON?"
	done	
	
TakeTotodileText:
	text "ELM: Do you want"
Randomizer_StarterTotodileTextOffset::
	line "TOTODILE, the"
	cont "water #MON?"
	done

TakeChikoritaText:
	text "ELM: So, you like"
Randomizer_StarterChikoritaTextOffset::
	line "CHIKORITA, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done	
	
ChoseStarterText:
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done
	