extends VBoxContainer

signal value_changed(new_value : int)

@export var attrName : String
var attrValue : int

func _ready() -> void:
	$StatNum.value = 10;
	$StatMod.text = "+0";

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$StatName.text = attrName;
	attrValue = $StatNum.value;
	var attrMod : int = floor(($StatNum.value - 10) / 2);
	if (attrMod >= 0):
		$StatMod.text = "+" + str(attrMod);
	else :
		$StatMod.text = str(attrMod);


func _on_stat_num_value_changed(value: float) -> void:
	value_changed.emit(value)
	
func set_value(value : int) -> void:
	$StatNum.value = value
	_on_stat_num_value_changed(value)
