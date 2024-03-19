extends Control


@export var creatureName : String

func _ready() -> void:
	$CreatureDisplay/CreatureNameBox/NameLabel.text = creatureName;

func roll_initiative() -> void:
	var result : int = $CreatureDisplay/AttrDisplay.roll_stat("DEX");
	$CreatureDisplay/CreatureNameBox/InitiativeBox/InitiativeAmount.value = result;
	
func get_initiative() -> int:
	return $CreatureDisplay/CreatureNameBox/InitiativeBox/InitiativeAmount.value;


func _on_delete_pressed() -> void:
	queue_free();
