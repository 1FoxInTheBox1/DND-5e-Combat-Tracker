extends MarginContainer

signal initiative_updated

func get_initiative() -> int:
	return $PlayerDisplay/PlayerNameBox/InitiativeBox/InitiativeAmount.value
	
func set_initiative(amount : int) -> void:
	$PlayerDisplay/PlayerNameBox/InitiativeBox/InitiativeAmount.value = amount
	
func set_player_name(name : String) -> void:
	$PlayerDisplay/PlayerNameBox/NameLabel.text = name
	
func get_save_dict() -> Dictionary:
	var save_dict = {
		"save_type" : "player",
		"name" : $PlayerDisplay/PlayerNameBox/NameLabel.text,
		"initiative" : $PlayerDisplay/PlayerNameBox/InitiativeBox/InitiativeAmount.value
	}
	return save_dict


func _on_initiative_amount_value_changed(value: float) -> void:
	initiative_updated.emit()
