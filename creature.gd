extends Control


@export var creatureName : String

func _ready() -> void:
	$CreatureDisplay/CreatureNameBox/NameLabel.text = creatureName;


func roll_initiative() -> void:
	var result : int = $CreatureDisplay/AttrDisplay.roll_stat("DEX");
	$CreatureDisplay/CreatureNameBox/InitiativeBox/InitiativeAmount.value = result;

	
func get_initiative() -> int:
	return $CreatureDisplay/CreatureNameBox/InitiativeBox/InitiativeAmount.value;


func queue_load(data : Dictionary) -> void:
	call_deferred("load_data", data)


func load_data(data : Dictionary) -> void:
	$CreatureDisplay/CreatureNameBox/NameLabel.text = data["name"]
	$CreatureDisplay/CreatureInfoBox/SizeOptions.select(data["size"])
	$CreatureDisplay/CreatureInfoBox/TypeOptions.select(data["type"])
	$CreatureDisplay/CreatureInfoBox/PB.value = data["pb"]
	
	$CreatureDisplay/HPDisplay.set_max_hp(data["max_hp"])
	$CreatureDisplay/HPDisplay.set_current_hp(data["hp"])
	$CreatureDisplay/HPDisplay.set_ac(data["ac"])
	
	$CreatureDisplay/AttrDisplay.set_stat("STR", data["str"])
	$CreatureDisplay/AttrDisplay.set_stat("DEX", data["dex"])
	$CreatureDisplay/AttrDisplay.set_stat("CON", data["con"])
	$CreatureDisplay/AttrDisplay.set_stat("INT", data["int"])
	$CreatureDisplay/AttrDisplay.set_stat("WIS", data["wis"])
	$CreatureDisplay/AttrDisplay.set_stat("CHA", data["cha"])
	
	$CreatureDisplay/CreatureNameBox/InitiativeBox/InitiativeAmount.value = data["initiative"]

func save() -> Dictionary:
	var save_dict = {
		"save_type" : "creature",
		"name" : $CreatureDisplay/CreatureNameBox/NameLabel.text,
		"size" : $CreatureDisplay/CreatureInfoBox/SizeOptions.selected,
		"type" : $CreatureDisplay/CreatureInfoBox/TypeOptions.selected,
		"pb" : $CreatureDisplay/CreatureInfoBox/PB.value,
		"max_hp" : $CreatureDisplay/HPDisplay.get_max_hp(),
		"hp" : $CreatureDisplay/HPDisplay.get_current_hp(),
		"ac" : $CreatureDisplay/HPDisplay.get_ac(),
		"str" : $CreatureDisplay/AttrDisplay.get_stat("STR"),
		"dex" : $CreatureDisplay/AttrDisplay.get_stat("DEX"),
		"con" : $CreatureDisplay/AttrDisplay.get_stat("CON"),
		"int" : $CreatureDisplay/AttrDisplay.get_stat("INT"),
		"wis" : $CreatureDisplay/AttrDisplay.get_stat("WIS"),
		"cha" : $CreatureDisplay/AttrDisplay.get_stat("CHA"),
		"initiative" : $CreatureDisplay/CreatureNameBox/InitiativeBox/InitiativeAmount.value
	}
	return save_dict

func _on_delete_pressed() -> void:
	queue_free()
