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
