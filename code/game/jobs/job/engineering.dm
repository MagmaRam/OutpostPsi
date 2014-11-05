/datum/job/engineer
	title = "Station Engineer"
	flag = ENGINEER
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the executive officer"
	selection_color = "#fff5cc"
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_emergency_storage, access_external_airlocks, access_construction, access_atmospherics)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_emergency_storage, access_external_airlocks, access_construction, access_atmospherics)
	alt_titles = list("Atmospheric Technician")


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(H), slot_l_ear)
		var/alt_title = "Station Engineer"
		if (H.mind.role_alt_title)
			alt_title = H.mind.role_alt_title
		switch(alt_title)
			if("Atmospheric Technician")
				switch(H.backbag)
					if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
					if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_norm(H), slot_back)
					if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/atmospheric_technician(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
				H.equip_to_slot_or_del(new /obj/item/device/pda/atmos(H), slot_l_store)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/atmostech(H), slot_belt)
			else
				switch(H.backbag)
					if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/industrial(H), slot_back)
					if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_eng(H), slot_back)
					if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/engineer(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(H), slot_shoes)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/full(H), slot_belt)
				H.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat(H), slot_head)
				H.equip_to_slot_or_del(new /obj/item/device/t_scanner(H), slot_r_store)
				H.equip_to_slot_or_del(new /obj/item/device/pda/engineering(H), slot_l_store)

		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H.back), slot_in_backpack)
		return 1
