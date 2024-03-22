extends HBoxContainer

#func _ready() -> void:
	#roll_stat("STR");
	#roll_stat("DEX");
	#roll_stat("CON");
	#roll_stat("INT");
	#roll_stat("WIS");
	#roll_stat("CHA");

func roll_stat(stat : String) -> int:
	var attr_panel = get_node("%s" % stat);
	return attr_panel.roll();
	
func set_stat(stat : String, amount : int) -> void:
	get_node(stat).set_value(amount)
