extends Control

var rng = RandomNumberGenerator.new()

@export var attrName : String

func _ready() -> void:
	$AttrPanel.attrName = attrName;
	$RollButton.text = "Roll %s" % attrName;
		
func roll() -> int:
	var result : int = rng.randi_range(1, 20) + floor(($AttrPanel/StatNum.value - 10) / 2);
	print(str("Rolled stat %s and got result %d" % [attrName, result]));
	return result;
 
func _on_roll_button_pressed() -> void:
	roll();
