mob/living/carbon/proc/dream()
	dreaming = 1
	var/list/dreams = list(
		"an ID card","a bottle","a familiar face","a crewmember","a toolbox","a security officer","a captain",
		"voices from all around","deep space","a doctor","an engine","a criminal","an ally","darkness",
		"light","a scientist","a monkey","a catastrophe","a loved one","a gun","warmth","freezing","the sun",
		"a hat","a ruined station","a planet","phoron","air","the medical bay","the bridge","blinking lights",
		"a blue light","an abandoned laboratory","Nanotrasen","crime","blood","healing","power","respect",
		"riches","space","a crash","happiness","pride","a fall","water","flames","ice","melons","flying","the eggs","money",
		"a head of personnel","a head of security","a chief engineer","a research director","a chief medical officer",
		"a detective","a warden","an internal affairs agent","a station engineer","a janitor","atmospheric technician",
		"a quartermaster","a cargo technician","a gardener","a miner","a psychologist","a chemist","a geneticist",
		"a virologist","a roboticist","a cook","a bartender","a counselor","a librarian","a mouse","an ERT member",
		"a beach","the holodeck","a smokey room","a voice","the cold","a mouse","an operating table","the bar","the rain","a skrell",
		"a unathi","a tajaran","an AI core","a mining station","a research station","a beaker of strange liquid",
		"an executive officer", "the solar arrays"
		)
	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			var/dream_image = pick(dreams)
			dreams -= dream_image
			src << "\blue <i>... [dream_image] ...</i>"
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(prob(5) && !dreaming) dream()

mob/living/carbon/var/dreaming = 0