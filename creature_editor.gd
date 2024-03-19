extends VSplitContainer

@onready var creature_options = $CreatureOptions

var loaded_creature : Dictionary

func save():
	if (creature_options.creature_name.is_empty()):
		print("Name was empty. Returning...")
		return
	if (creature_options.creature_size == -1):
		print("Size was empty. Returning...")
		return
	if (creature_options.creature_type == -1):
		print("Type was empty. Returning...")
		return
		
	var save_game = FileAccess.open("user://%s.save" % creature_options.creature_name, FileAccess.WRITE)
		
	var save_dict = {
		"name" : creature_options.creature_name,
		"size" : creature_options.creature_size,
		"type" : creature_options.creature_type,
		"max_hp" : creature_options.max_hp,
		"ac" : creature_options.ac,
		"str" : creature_options.str,
		"dex" : creature_options.dex,
		"con" : creature_options.con,
		"int" : creature_options.smart,
		"wis" : creature_options.wis,
		"cha" : creature_options.cha
	};
	
	var json_string = JSON.stringify(save_dict)
	save_game.store_line(json_string)


func _on_save_pressed() -> void:
	save()


func _on_load_pressed() -> void:
	$FileDialog.show()


func _on_file_dialog_file_selected(path: String) -> void:
	var loaded_file = FileAccess.open(path, FileAccess.READ)
	while loaded_file.get_position() < loaded_file.get_length():
		var json_string = loaded_file.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		loaded_creature = json.get_data()
		creature_options.load_creature(loaded_creature)
