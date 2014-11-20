//PSI-ONLY BOOLET
//Credit to Spades_Neil of the baystation12 forums for rifle stuff
/obj/item/ammo_casing/shotgun/rifle
	name = "rifle round"
	desc = "A round from a rifle."
	icon_state = "s-casing"
	caliber = "rifle"
	projectile_type = "/obj/item/projectile/bullet/a762" // Because it uses 7.62 rounds, like the SAW. Should do the same damage.

/obj/item/ammo_casing/shotgun/rifle/chalk // For target shooting.
	name = "chalk rifle round"
	desc = "A round from a rifle, which uses a chalk bullet."
	projectile_type = "/obj/item/projectile/bullet/weakbullet/chalk"