#define CONNECT_WHITELIST_FILE "data/connect_whitelist.txt"

var/global/datum/connect_whitelist/connect_whitelist

/datum/connect_whitelist
	var/list/whitelisted
	var/whitelist_filename

/datum/connect_whitelist/New(filename)
	whitelist_filename = filename
	reload_list()

/datum/connect_whitelist/proc/reload_list()
	whitelisted = new/list()
	if (fexists(whitelist_filename))
		var/list/whitelist_file_contents = file2list(whitelist_filename)
		for (var/L in whitelist_file_contents)
			if (!L)
				continue
			L = trim(L)
			if (length(L) == 0 || copytext(L, 1, 2) == "#")
				continue
			L = ckey(L)
			if (length(L) == 0)
				continue
			whitelisted |= L
		return 1
	return 0

/datum/connect_whitelist/proc/write_list()
	fdel(whitelist_filename)	// A truncate proc would be nice...
	var/whitelist_file = file(whitelist_filename)

	whitelist_file << {"# Connection Whitelist
# Add keys below to add them to the whitelist.
# Any line beginning with # will be ignored
"}

	for(var/P in whitelisted)
		whitelist_file << P
	return 1

/datum/connect_whitelist/proc/add_players(players)
	for (var/P in players)
		whitelisted |= ckey(P)
	return 1

/datum/connect_whitelist/proc/remove_players(players)
	whitelisted -= players // Just in case...
	for (var/P in players)
		whitelisted -= ckey(P)
	return 1

/datum/connect_whitelist/proc/get_whitelist()
	// Shouldn't be modified.
	return whitelisted

/datum/connect_whitelist/proc/is_whitelisted(key)
	return ckey(key) in whitelisted

/datum/connect_whitelist/Topic(href, href_list[])
	..()
	if (!check_rights(R_BAN))
		message_admins("[key_name_admin(usr)] attempted to edit the connection whitelist without sufficient rights.")
		log_admin("[key_name(usr)] attempted to edit the connection whitelist without sufficient rights.")
		return

	var/topic_action = href_list["action"]
	if (!topic_action)
		return
	switch (topic_action)
		if ("reload_list")
			reload_list()
			message_admins("[key_name_admin(usr)] reloaded the connection whitelist.")
			log_admin("[key_name(usr)] reloaded the connection whitelist.")
		if ("write_list")
			write_list()
			message_admins("[key_name_admin(usr)] saved the connection whitelist to file.")
			log_admin("[key_name(usr)] saved the connection whitelist to file.")
		if ("set_use_whitelist")
			var/old_value = config.use_connect_whitelist
			config.use_connect_whitelist = text2num(href_list["enable"]) ? 1 : 0
			if (config.use_connect_whitelist != old_value)
				message_admins("[key_name_admin(usr)] [config.use_connect_whitelist ? "enabled" : "disabled"] use of the connection whitelist.")
				log_admin("[key_name(usr)] [config.use_connect_whitelist ? "enabled" : "disabled"] use of the connection whitelist.")
		if ("add_prompt")
			var/list/players_input = text2list(input("List player(s) to add, delimited by ;", "Add player(s)"), ";")
			var/list/players_to_add = new()
			for (var/P in players_input)
				if (!P)
					continue
				P = ckey(P)
				if (length(P) == 0)
					continue
				players_to_add |= P
			add_players(players_to_add)
		if ("remove_prompt")
			var/list/players_input = text2list(input("List player(s) to remove, delimited by ;", "Remove player(s)"), ";")
			remove_players(players_input)
		/*
		if ("add")
			var/list/players_to_add = text2list(href_list["players"])
			// TODO: validate input
			add_players(players_to_add)
		*/
		if ("remove")
			var/list/players_to_remove = text2list(href_list["players"])
			remove_players(players_to_remove)
		else
			src << "<span class='warning'>Unknown connect_whitelist Topic action: [topic_action]</span>"
			return

	manage_connect_whitelist()

/datum/connect_whitelist/proc/manage_connect_whitelist()
	set category = "Server"
	set name = "Manage connect whitelist"

	if (!check_rights(R_BAN))
		return

	var/document = {"<html><head><title>Manage connect whitelist</title>
		<!-- <script type='text/javascript' src='search.js'></script> -->
		<link rel='stylesheet' type='text/css' href='panels.css'>
		</head>
		<body>
		<div id='main'>
		<a href='?src=\ref[connect_whitelist];action=add_prompt'>Add</a> |
		<a href='?src=\ref[connect_whitelist];action=remove_prompt'>Remove</a> |
		<a href='?src=\ref[connect_whitelist];action=write_list'>Save list to file</a> |
		<a href='?src=\ref[connect_whitelist];action=reload_list'>Reload list from file</a> |
		<a href='?src=\ref[connect_whitelist];action=set_use_whitelist;enable=0'>Disable whitelist</a> |
		<a href='?src=\ref[connect_whitelist];action=set_use_whitelist;enable=1'>Enable whitelist</a>
		<table id='searchable' cellspacing='0'>
		<tr class='title'>
		<th>Key</th>
		<th>Actions</th>
		</tr>
	"}

	for (var/user_key in connect_whitelist.get_whitelist())
		document += {"
			<tr>
			<td>[user_key]</td>
			<td><a href='?src=\ref[connect_whitelist];action=remove;players=[user_key]' title='Remove [user_key]'>Remove</a></td>
			</tr>
		"}

	document += {"</table>
		<a href='?_src_=vars;Vars=\ref[connect_whitelist]'>Emergency varedit</a>
		</div></body></html>
	"}

	usr << browse(document, "window=manage_connect_whitelist;size=600x500")

/hook/startup/proc/setupConnectWhitelist()
	connect_whitelist = new /datum/connect_whitelist(CONNECT_WHITELIST_FILE)
	return 1
