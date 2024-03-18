extends HBoxContainer

#func _ready() -> void:
	#roll_stat("STR");
	#roll_stat("DEX");
	#roll_stat("CON");
	#roll_stat("INT");
	#roll_stat("WIS");
	#roll_stat("CHA");

func roll_stat(stat : String) -> int:
	var attr_panel = get_node(stat);
	return attr_panel.roll();
