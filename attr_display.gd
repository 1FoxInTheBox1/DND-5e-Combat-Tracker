extends MarginContainer

#func _ready() -> void:
	#roll_stat("STR");
	#roll_stat("DEX");
	#roll_stat("CON");
	#roll_stat("INT");
	#roll_stat("WIS");
	#roll_stat("CHA");

func roll_stat(stat : String) -> int:
	var attr_panel = get_node("HBoxContainer/%s" % stat);
	return attr_panel.roll();
