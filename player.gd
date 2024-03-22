extends MarginContainer

func get_initiative() -> int:
	return $PlayerDisplay/PlayerNameBox/InitiativeBox/InitiativeAmount.value
	
func set_initiative(amount : int) -> void:
	$PlayerDisplay/PlayerNameBox/InitiativeBox/InitiativeAmount.value = amount
	
func set_player_name(name : String) -> void:
	$PlayerDisplay/PlayerNameBox/NameLabel.text = name
	
