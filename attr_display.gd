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
	var result = attr_panel.roll();
	return result
	
func set_stat(stat : String, amount : int) -> void:
	get_node(stat).set_value(amount)
	
func get_stat(stat : String) -> int:
	return get_node(stat).get_value()

func display_roll_result(value : int, crit : bool, fail : bool) -> void:
	$RollResult.show_result(value, crit, fail)

func _on_str_roll_result(value: int, crit: bool, fail: bool) -> void:
	display_roll_result(value, crit, fail)


func _on_dex_roll_result(value: int, crit: bool, fail: bool) -> void:
	display_roll_result(value, crit, fail)


func _on_con_roll_result(value: int, crit: bool, fail: bool) -> void:
	display_roll_result(value, crit, fail)


func _on_int_roll_result(value: int, crit: bool, fail: bool) -> void:
	display_roll_result(value, crit, fail)


func _on_wis_roll_result(value: int, crit: bool, fail: bool) -> void:
	display_roll_result(value, crit, fail)


func _on_cha_roll_result(value: int, crit: bool, fail: bool) -> void:
	display_roll_result(value, crit, fail)
