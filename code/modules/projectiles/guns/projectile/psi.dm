//PSI-ONLY WEAPONS AND THE LIKE
//Credit to Spades_Neil of the baystation12 forums for rifle code and to their friend Joan for the rifle sprite
/obj/item/weapon/gun/projectile/shotgun/pump/rifle
	name = "bolt action rifle"
	desc = "A reproduction of an almost ancient weapon design from the early 20th century. Favored by hunters."
	icon = 'icons/obj/gun_psi.dmi'
	item_state = "shotgun" // Placeholder until we get a proper world sprite.
	icon_state = "boltaction"
	fire_sound = 'sound/weapons/rifleshot.ogg'
	max_shells = 5
	caliber = "rifle" // Prevents loading shotgun shells into the rifle.
	origin_tech = "combat=2" // Old rifle doesn't have very good tech.
	ammo_type = "/obj/item/ammo_casing/shotgun/rifle"
	cocksound = 'sound/weapons/riflebolt.ogg'

/obj/item/weapon/gun/projectile/shotgun/pump/rifle/chalk //Rifle pre-loaded with nerfed ammo
	desc = "A bolt-action rifle designed for competitive shooting. Comes shipped with chalk rounds pre-loaded into the gun."
	ammo_type = "/obj/item/ammo_casing/shotgun/rifle/chalk"

/obj/item/weapon/gun/projectile/blunder
	name = "blunderbuss"
	desc = "An ancient, large-bore gun. Fires lead shot."
	icon = 'icons/obj/gun_psi.dmi'
	slot_flags = SLOT_BACK
	item_state = "shotgun"
	icon_state = "blunderbuss"
	ammo_type = "/obj/item/ammo_casing/ball"
	caliber = "shot"
	max_shells = 1
	origin_tech = "combat=1" //what an old thing
	//overloading the load_into_chamber proc to make some changes to the ammo to make more sense
	load_into_chamber()
		if(in_chamber)
			return 1 //{R}

		if(!loaded.len)
			return 0
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		if(isnull(AC) || !istype(AC))
			return 0
		AC.loc = get_turf(src) //Eject casing onto ground.
		if(AC.BB)
			AC.name = "junk"
			AC.desc = "Some junk. Probably worthless."	//descriptions are magic - only when there's a projectile in the casing
			AC.icon_state = "junk"
			in_chamber = AC.BB //Load projectile into chamber.
			AC.BB.loc = src //Set projectile loc to gun.
			return 1
		return 0

/obj/item/weapon/gun/projectile/blunder/bpistol
	name = "blunderbuss pistol"
	desc = "A weapon commonly seen with pirates and cavalry."
	slot_flags = SLOT_BELT
	item_state = "gun"
	icon_state = "bpistol"
