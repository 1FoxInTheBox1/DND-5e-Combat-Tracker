extends VBoxContainer


var creature_name : String
var creature_size : int
var creature_type : int
var max_hp : int
var ac : int
var str : int
var dex : int
var con : int
var smart : int
var wis : int
var cha : int

func load_creature(loaded_creature : Dictionary) -> void:
	creature_name = loaded_creature["name"]
	$CreatureNameBox/NameLabel.text = creature_name
	creature_size = loaded_creature["size"]
	$CreatureInfoBox/SizeOptions.select(creature_size)
	creature_type = loaded_creature["type"]
	$CreatureInfoBox/TypeOptions.select(creature_type)
	
	max_hp = loaded_creature["max_hp"]
	$Health/MaxHP.value = max_hp
	ac = loaded_creature["ac"]
	$Health/AC.value = ac
	
	str = loaded_creature["str"]
	$Attributes/STR.set_value(str)
	dex = loaded_creature["dex"]
	$Attributes/DEX.set_value(dex)
	con = loaded_creature["con"]
	$Attributes/CON.set_value(con)
	smart = loaded_creature["int"]
	$Attributes/INT.set_value(smart)
	wis = loaded_creature["wis"]
	$Attributes/WIS.set_value(wis)
	cha = loaded_creature["cha"]
	$Attributes/CHA.set_value(cha)
	

func _on_name_label_text_changed(new_text: String) -> void:
	creature_name = new_text

func _on_size_options_item_selected(index: int) -> void:
	creature_size = index

func _on_type_options_item_selected(index: int) -> void:
	creature_type = index

func _on_max_hp_value_changed(value: float) -> void:
	max_hp = value

func _on_ac_value_changed(value: float) -> void:
	ac = value

func _on_str_value_changed(new_value: int) -> void:
	str = new_value

func _on_dex_value_changed(new_value: int) -> void:
	dex = new_value

func _on_con_value_changed(new_value: int) -> void:
	con = new_value

func _on_int_value_changed(new_value: int) -> void:
	smart = new_value

func _on_wis_value_changed(new_value: int) -> void:
	wis = new_value

func _on_cha_value_changed(new_value: int) -> void:
	cha = new_value
