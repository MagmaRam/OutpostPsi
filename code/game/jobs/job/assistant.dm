/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant", "Medical Intern", "Research Assistant", "Security Cadet")

/datum/job/assistant/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)

	var/obj/item/clothing/under/jumpsuit = new /obj/item/clothing/under/color/grey(H)
	var/obj/item/clothing/tie/job_armband

	switch(H.mind.role_alt_title)
		if("Technical Assistant")
			job_armband = new /obj/item/clothing/tie/armband/engine()
		if("Medical Intern")
			job_armband = new /obj/item/clothing/tie/armband/med()
		if("Research Assistant")
			job_armband = new /obj/item/clothing/tie/armband/science()
		if("Security Cadet")
			job_armband = new /obj/item/clothing/tie/armband()

	if(istype(job_armband))
		jumpsuit.add_accessory(job_armband)
	H.equip_to_slot_or_del(jumpsuit, slot_w_uniform)

	return 1

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
