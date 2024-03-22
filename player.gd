extends MarginContainer

func get_initiative() -> int:
	return $PlayerDisplay/PlayerNameBox/InitiativeBox/InitiativeAmount.value
	
func set_player_name(name : String) -> void:
	$PlayerDisplay/PlayerNameBox/NameLabel.text = name
