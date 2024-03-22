extends Control

var creature_scene = preload("res://creature.tscn")
var player_scene = preload("res://player.tscn")

@onready var initiative_list = $CreatureList/CreatureVBox

func _ready() -> void:
	pass
	#for n in 5:
		#var instance = creature_scene.instantiate();
		#initiative_list.add_child(instance);
	
	
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
		var new_creature = creature_scene.instantiate()
		$CreatureList/CreatureVBox.add_child(new_creature)
		new_creature.load_data(loaded_data)
		var dupeButton : Button = new_creature.get_node("CreatureDisplay/DeleteButtonDisplay/Duplicate")
		dupeButton.pressed.connect(dupe_creature)
		
func dupe_creature() -> void:
	print("TODO: Dupe creature");


func _on_load_creature_pressed() -> void:
	$FileDialog.show();


func _on_save_encounter_pressed() -> void:
	pass # Replace with function body.


func _on_load_encounter_pressed() -> void:
	pass # Replace with function body.

func _on_add_player_pressed() -> void:
	$AddPlayerPopup.show()

func _on_add_player_popup_window_closed(player_name: String) -> void:
	var new_player = player_scene.instantiate()
	$CreatureList/CreatureVBox.add_child(new_player)
	new_player.set_player_name(player_name)
