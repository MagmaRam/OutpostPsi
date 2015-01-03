//Psi-only projectiles and all that jazz
//Credit to Spades_Neil of the baystation12 forums for rifle stuff
/obj/item/projectile/bullet/weakbullet/chalk // This is just for the chalk bullets, meant for competitive shooting without being dangerous to the crew.
	damage = 10
	stun = 0 // Basically rubber round damage without the stun. I left the values here because I'm still playing with the code, but this is the only one that needs to stay.
	weaken = 5

/obj/item/projectile/bullet/shot //This is for the blunderbuss and blunderbuss pistol
	damage = 40 //less deadly than normal stuff
	stun = 0
	weaken = 0