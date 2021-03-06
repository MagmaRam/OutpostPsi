var/global/list/gear_datums = list()

proc/populate_gear_list()
	for(var/type in typesof(/datum/gear)-/datum/gear)
		var/datum/gear/G = new type()
		gear_datums[G.display_name] = G

/datum/gear
	var/display_name       //Name/index.
	var/path               //Path to item.
	var/cost               //Number of points used.
	var/slot               //Slot to equip to.
	var/list/allowed_roles //Roles that can spawn with this item.
	var/whitelisted        //Term to check the whitelist for..

//Standard gear datums.

/datum/gear/cards
	display_name = "deck of cards"
	path = /obj/item/weapon/deck
	cost = 2

/datum/gear/dice
	display_name = "d20"
	path = /obj/item/weapon/dice/d20
	cost = 2

/datum/gear/comb
	display_name = "purple comb"
	path = /obj/item/weapon/fluff/cado_keppel_1
	cost = 2

/datum/gear/tie_horrible
	display_name = "horrible tie"
	path = /obj/item/clothing/tie/horrible
	cost = 2

/datum/gear/tie_blue
	display_name = "blue tie"
	path = /obj/item/clothing/tie/blue
	cost = 2

/datum/gear/tie_red
	display_name = "red tie"
	path = /obj/item/clothing/tie/red
	cost = 2

/datum/gear/hairflower
	display_name = "hair flower pin"
	path = /obj/item/clothing/head/hairflower
	cost = 1
	slot = slot_head

/datum/gear/bandana
	display_name = "pirate bandana"
	path = /obj/item/clothing/head/bandana
	cost = 1
	slot = slot_head

/datum/gear/overalls
	display_name = "overalls"
	path = /obj/item/clothing/suit/apron/overalls
	cost = 1
	slot = slot_wear_suit

/datum/gear/wcoat
	display_name = "waistcoat"
	path = /obj/item/clothing/suit/wcoat
	cost = 1
	slot = slot_wear_suit

/datum/gear/prescription
	display_name = "prescription sunglasses"
	path = /obj/item/clothing/glasses/sunglasses/prescription
	cost = 1
	slot = slot_glasses

/datum/gear/eyepatch
	display_name = "eyepatch"
	path = /obj/item/clothing/glasses/eyepatch
	cost = 1
	slot = slot_glasses

/datum/gear/flatcap
	display_name = "flat cap"
	path = /obj/item/clothing/head/flatcap
	cost = 1
	slot = slot_head

/datum/gear/labcoat
	display_name = "labcoat"
	path = /obj/item/clothing/suit/storage/labcoat
	cost = 1
	slot = slot_wear_suit

/datum/gear/sandal
	display_name = "sandals"
	path = /obj/item/clothing/shoes/sandal
	cost = 1
	slot = slot_shoes

/datum/gear/leather
	display_name = "leather shoes"
	path = /obj/item/clothing/shoes/leather
	cost = 1
	slot = slot_shoes

/datum/gear/dress_shoes
	display_name = "dress shoes"
	path = /obj/item/clothing/shoes/centcom
	cost = 1
	slot = slot_shoes

// Jumpsuits

/datum/gear/jumpsuit_black
	display_name = "black jumpsuit"
	path = /obj/item/clothing/under/color/black
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_black_f
	display_name = "feminine black jumpsuit"
	path = /obj/item/clothing/under/color/blackf
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_blue
	display_name = "blue jumpsuit"
	path = /obj/item/clothing/under/color/blue
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_green
	display_name = "green jumpsuit"
	path = /obj/item/clothing/under/color/green
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_pink
	display_name = "pink jumpsuit"
	path = /obj/item/clothing/under/color/pink
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_red
	display_name = "red jumpsuit"
	path = /obj/item/clothing/under/color/red
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_white
	display_name = "white jumpsuit"
	path = /obj/item/clothing/under/color/white
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_yellow
	display_name = "yellow jumpsuit"
	path = /obj/item/clothing/under/color/yellow
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_lightblue
	display_name = "lightblue jumpsuit"
	path = /obj/item/clothing/under/lightblue
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_aqua
	display_name = "aqua jumpsuit"
	path = /obj/item/clothing/under/aqua
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_purple
	display_name = "purple jumpsuit"
	path = /obj/item/clothing/under/purple
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_lightpurple
	display_name = "lightpurple jumpsuit"
	path = /obj/item/clothing/under/lightpurple
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_lightgreen
	display_name = "lightgreen jumpsuit"
	path = /obj/item/clothing/under/lightgreen
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_lightblue
	display_name = "lightblue jumpsuit"
	path = /obj/item/clothing/under/lightblue
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_lightbrown
	display_name = "lightbrown jumpsuit"
	path = /obj/item/clothing/under/lightbrown
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_brown
	display_name = "brown jumpsuit"
	path = /obj/item/clothing/under/brown
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_yellowgreen
	display_name = "yellowgreen jumpsuit"
	path = /obj/item/clothing/under/yellowgreen
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_darkblue
	display_name = "darkblue jumpsuit"
	path = /obj/item/clothing/under/darkblue
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_lightred
	display_name = "lightred jumpsuit"
	path = /obj/item/clothing/under/lightred
	slot = slot_w_uniform
	cost = 1

/datum/gear/jumpsuit_
	display_name = "darkred jumpsuit"
	path = /obj/item/clothing/under/darkred
	slot = slot_w_uniform
	cost = 1

// Gloves

/datum/gear/black_gloves
	display_name = "black gloves"
	path = /obj/item/clothing/gloves/black
	cost = 1
	slot = slot_gloves

/datum/gear/red_gloves
	display_name = "red gloves"
	path = /obj/item/clothing/gloves/red
	cost = 1
	slot = slot_gloves

/datum/gear/blue_gloves
	display_name = "blue gloves"
	path = /obj/item/clothing/gloves/blue
	cost = 1
	slot = slot_gloves

/datum/gear/orange_gloves
	display_name = "orange gloves"
	path = /obj/item/clothing/gloves/orange
	cost = 1
	slot = slot_gloves

/datum/gear/purple_gloves
	display_name = "purple gloves"
	path = /obj/item/clothing/gloves/purple
	cost = 1
	slot = slot_gloves

/datum/gear/brown_gloves
	display_name = "brown gloves"
	path = /obj/item/clothing/gloves/brown
	cost = 1
	slot = slot_gloves

/datum/gear/green_gloves
	display_name = "green gloves"
	path = /obj/item/clothing/gloves/green
	cost = 1
	slot = slot_gloves

/datum/gear/white_gloves
	display_name = "white gloves"
	path = /obj/item/clothing/gloves/white
	cost = 1
	slot = slot_gloves

/datum/gear/black_shoes
	display_name = "black shoes"
	path = /obj/item/clothing/shoes/black
	cost = 1
	slot = slot_shoes

/datum/gear/blue_shoes
	display_name = "blue shoes"
	path = /obj/item/clothing/shoes/blue
	cost = 1
	slot = slot_shoes

/datum/gear/brown_shoes
	display_name = "brown shoes"
	path = /obj/item/clothing/shoes/brown
	cost = 1
	slot = slot_shoes

/datum/gear/green_shoes
	display_name = "green shoes"
	path = /obj/item/clothing/shoes/green
	cost = 1
	slot = slot_shoes

/datum/gear/orange_shoes
	display_name = "orange shoes"
	path = /obj/item/clothing/shoes/orange
	cost = 1
	slot = slot_shoes

/datum/gear/purple_shoes
	display_name = "purple shoes"
	path = /obj/item/clothing/shoes/purple
	cost = 1
	slot = slot_shoes

/datum/gear/red_shoes
	display_name = "red shoes"
	path = /obj/item/clothing/shoes/red
	cost = 1
	slot = slot_shoes

/datum/gear/white_shoes
	display_name = "white shoes"
	path = /obj/item/clothing/shoes/white
	cost = 1
	slot = slot_shoes

/datum/gear/yellow_shoes
	display_name = "yellow shoes"
	path = /obj/item/clothing/shoes/yellow
	cost = 1
	slot = slot_shoes

/datum/gear/jackboots
	display_name = "jackboots"
	path = /obj/item/clothing/shoes/jackboots
	cost = 1
	slot = slot_shoes

/datum/gear/webbing
	display_name = "webbing"
	path = /obj/item/clothing/tie/storage/webbing
	cost = 1

/datum/gear/armband
	display_name = "red armband"
	path = /obj/item/clothing/tie/armband
	cost = 1

/datum/gear/armband_cargo
	display_name = "cargo armband"
	path = /obj/item/clothing/tie/armband/cargo
	cost = 1

/datum/gear/armband_engineering
	display_name = "engineering armband"
	path = /obj/item/clothing/tie/armband/engine
	cost = 1

/datum/gear/armband_science
	display_name = "science armband"
	path = /obj/item/clothing/tie/armband/science
	cost = 1

/datum/gear/armband_hydroponics
	display_name = "hydroponics armband"
	path = /obj/item/clothing/tie/armband/hydro
	cost = 1

/datum/gear/armband_medical
	display_name = "medical armband"
	path = /obj/item/clothing/tie/armband/med
	cost = 1

/datum/gear/armband_emt
	display_name = "EMT armband"
	path = /obj/item/clothing/tie/armband/medgreen
	cost = 1

/datum/gear/skirt_blue
	display_name = "blue plaid skirt"
	path = /obj/item/clothing/under/dress/plaid_blue
	slot = slot_w_uniform
	cost = 1

/datum/gear/skirt_red
	display_name = "red plaid skirt"
	path = /obj/item/clothing/under/dress/plaid_red
	slot = slot_w_uniform
	cost = 1

/datum/gear/skirt_purple
	display_name = "purple plaid skirt"
	path = /obj/item/clothing/under/dress/plaid_purple
	slot = slot_w_uniform
	cost = 1

/datum/gear/skirt_black
	display_name = "black skirt"
	path = /obj/item/clothing/under/blackskirt
	slot = slot_w_uniform
	cost = 1

/datum/gear/sundress
	display_name = "sundress"
	path = /obj/item/clothing/under/sundress
	slot = slot_w_uniform
	cost = 1

/datum/gear/uniform_captain
	display_name = "captain's dress uniform"
	path = /obj/item/clothing/under/dress/dress_cap
	slot = slot_w_uniform
	cost = 1
	allowed_roles = list("Captain")

/datum/gear/uniform_hop
	display_name = "HoP dress uniform"
	path = /obj/item/clothing/under/dress/dress_hop
	slot = slot_w_uniform
	cost = 1
	allowed_roles = list("Executive Officer")

/datum/gear/uniform_hr
	display_name = "HR director uniform"
	path = /obj/item/clothing/under/dress/dress_hr
	slot = slot_w_uniform
	cost = 1
	allowed_roles = list("Executive Officer")

/datum/gear/kilt
	display_name = "kilt"
	path = /obj/item/clothing/under/kilt
	slot = slot_w_uniform
	cost = 1

/datum/gear/exec_suit
	display_name = "executive suit"
	path = /obj/item/clothing/under/suit_jacket/really_black
	slot = slot_w_uniform
	cost = 1

//Security
/datum/gear/security
	display_name = "Security HUD"
	path = /obj/item/clothing/glasses/hud/security
	cost = 3
	slot = slot_glasses
	allowed_roles = list("Security Officer","Head of Security","Warden")

/datum/gear/black_vest
	display_name = "black webbing vest"
	path = /obj/item/clothing/tie/storage/black_vest
	cost = 3
	// allowed_roles = list("Security Officer","Head of Security","Warden")

/datum/gear/armpit
	display_name = "shoulder holster"
	path = /obj/item/clothing/tie/holster/armpit
	cost = 3
	allowed_roles = list("Captain", "Executive Officer", "Security Officer", "Head of Security")

/datum/gear/sec_beret
	display_name = "security beret"
	path = /obj/item/clothing/head/beret/sec
	cost = 1
	slot = slot_head
	allowed_roles = list("Security Officer","Head of Security","Warden")

//Engineering
/datum/gear/eng_beret
	display_name = "engineering beret"
	path = /obj/item/clothing/head/beret/eng
	cost = 1
	slot = slot_head
	allowed_roles = list("Station Engineer","Atmospheric Technician","Chief Engineer")

/datum/gear/brown_vest
	display_name = "brown webbing vest"
	path = /obj/item/clothing/tie/storage/brown_vest
	cost = 3
	// allowed_roles = list("Station Engineer","Atmospheric Technician","Chief Engineer")

/datum/gear/engineer_bandana
	display_name = "engineering bandana"
	path = /obj/item/clothing/head/helmet/greenbandana/fluff/taryn_kifer_1
	cost = 1
	slot = slot_head
	allowed_roles = list("Station Engineer","Atmospheric Technician","Chief Engineer")

//Science
/datum/gear/scanning_goggles
	display_name = "scanning goggles"
	path = /obj/item/clothing/glasses/fluff/uzenwa_sissra_1
	cost = 2
	allowed_roles = list("Roboticist", "Scientist", "Research Director")

//Species-specific gear datums.
/datum/gear/zhan_furs
	display_name = "Zhan-Khazan furs"
	path = /obj/item/clothing/suit/tajaran/furs
	cost = 1
	slot = slot_wear_suit
	whitelisted = "Tajaran"

/datum/gear/zhan_scarf
	display_name = "Zhan-Khazan headscarf"
	path = /obj/item/clothing/head/tajaran/scarf
	cost = 1
	slot = slot_head
	whitelisted = "Tajaran"

/datum/gear/unathi_robe
	display_name = "roughspun robe"
	path = /obj/item/clothing/suit/unathi/robe
	cost = 1
	slot = slot_wear_suit
	whitelisted = "Unathi"

/datum/gear/unathi_mantle
	display_name = "hide mantle"
	path = /obj/item/clothing/suit/unathi/mantle
	cost = 1
	slot = slot_wear_suit
	whitelisted = "Unathi"
