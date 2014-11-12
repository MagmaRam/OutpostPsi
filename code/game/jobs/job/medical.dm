/datum/job/doctor
	title = "Medic"
	flag = DOCTOR
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the executive officer"
	selection_color = "#ffeef0"
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_external_airlocks)
	minimal_access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology)
	alt_titles = list("Medical Doctor", "Surgeon", "Emergency Physician")

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if (H.mind.role_alt_title)
			switch(H.mind.role_alt_title)
				if("Emergency Physician")
					H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
					H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/fr_jacket(H), slot_wear_suit)
					H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
				if("Surgeon")
					H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/blue(H), slot_w_uniform)
					H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat(H), slot_wear_suit)
					H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
					H.equip_to_slot_or_del(new /obj/item/clothing/head/surgery/blue(H), slot_head)
				if("Medic", "Medical Doctor")
					H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
					H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat(H), slot_wear_suit)
					H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/healthanalyzer(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_l_hand)
		//H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_to_slot_or_del(new /obj/item/device/pda/medical(H), slot_l_store)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1
