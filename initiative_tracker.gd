extends Control

var creature_scene = preload("res://creature.tscn")
var player_scene = preload("res://player.tscn")

@onready var initiative_list = $CreatureList/CreatureVBox


	
func sort_initiative_list() -> void:
	var creatureList = initiative_list.get_children()
	creatureList.sort_custom(sort_initiative)
	
	for i in creatureList.size():
		initiative_list.move_child(creatureList[i], i)
	
	
func sort_initiative(a, b) -> bool:
	if a.get_initiative() > b.get_initiative():
		return true
	return false


func _on_roll_initiative_button_pressed() -> void:
	get_tree().call_group("NPC", "roll_initiative")
	call_deferred("sort_initiative_list")

		
func dupe_creature() -> void:
	print("TODO: Dupe creature");
	
	
func add_creature(data : Dictionary) -> void:
	var new_creature = creature_scene.instantiate()
	$CreatureList/CreatureVBox.add_child(new_creature)
	new_creature.load_data(data)
	var dupeButton : Button = new_creature.get_node("CreatureDisplay/DeleteButtonDisplay/Duplicate")
	dupeButton.pressed.connect(dupe_creature)
	

func add_player(data : Dictionary) -> void:
	var new_player = player_scene.instantiate()
	$CreatureList/CreatureVBox.add_child(new_player)
	new_player.set_player_name(data["name"])
	new_player.set_initiative(data["initiative"])


func _on_load_creature_pressed() -> void:
	$CreatureFileDialog.show();


func _on_save_encounter_pressed() -> void:
	$SaveEncounterPopup.show()
	

func _on_load_encounter_pressed() -> void:
	$EncounterFileDialog.show()


func _on_add_player_pressed() -> void:
	$AddPlayerPopup.show()


func _on_add_player_popup_window_closed(player_name: String, initiative : int) -> void:
	var player_dict = {
		"name" : player_name,
		"initiative" : initiative
	}
	add_player(player_dict)


func _on_save_encounter_popup_window_closed(filename: String) -> void:
	DirAccess.make_dir_absolute("user://encounters")
	var file = FileAccess.open("user://encounters/%s.save" % filename, FileAccess.WRITE)
	var save_nodes = $CreatureList/CreatureVBox.get_children();
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		file.store_line(json_string)
		
		
func _on_file_dialog_file_selected(path: String) -> void:
	var loaded_file = FileAccess.open(path, FileAccess.READ)
	while loaded_file.get_position() < loaded_file.get_length():
		var json_string = loaded_file.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var loaded_data = json.get_data()
		add_creature(loaded_data)
		
		

func _on_encounter_file_dialog_file_selected(path: String) -> void:
	var creatures = $CreatureList/CreatureVBox.get_children();
	for creature in creatures:
		creature.queue_free()
		
	var loaded_file = FileAccess.open(path, FileAccess.READ)
	while loaded_file.get_position() < loaded_file.get_length():
		var json_string = loaded_file.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var loaded_data = json.get_data()
		if (loaded_data["save_type"] == "creature"):
			add_creature(loaded_data)
		elif (loaded_data["save_type"] == "player"):
			add_player(loaded_data)
