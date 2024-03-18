extends Control

var creature_scene = preload("res://creature.tscn");

@onready var initiative_list = $CreatureList/CreatureVBox;

func _ready() -> void:
	for n in 5:
		var instance = creature_scene.instantiate();
		initiative_list.add_child(instance);
	
func sort_initiative_list() -> void:
	var creatureList = initiative_list.get_children();
	creatureList.sort_custom(sort_initiative);
	
	for i in creatureList.size():
		initiative_list.move_child(creatureList[i], i);
	
func sort_initiative(a, b) -> bool:
	if a.get_initiative() > b.get_initiative():
		return true;
	return false;

func _on_roll_initiative_button_pressed() -> void:
	get_tree().call_group("NPC", "roll_initiative");
	call_deferred("sort_initiative_list");
