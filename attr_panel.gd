extends VBoxContainer

signal value_changed(new_value : int)
signal roll_result(value : int, crit : bool, fail : bool)

var rng = RandomNumberGenerator.new()
@export var attrName : String
var attrValue : int
@export var hideButton : bool

func _ready() -> void:
	$StatName.text = attrName
	$StatNum.value = 10
	$StatMod.text = "+0"
	if (hideButton):
		$RollButton.hide()

func _process(delta: float) -> void:
	var attrMod : int = floor(($StatNum.value - 10) / 2)
	if (attrMod >= 0):
		$StatMod.text = "+" + str(attrMod)
	else:
		$StatMod.text = str(attrMod)

func _on_stat_num_value_changed(value: float) -> void:
	value_changed.emit(value)
	
func roll() -> int:
	var roll : int = rng.randi_range(1, 20)
	var mod : int = floor(($StatNum.value - 10) / 2)
	if (roll == 20):
		print("NATURAL 20!")
		roll_result.emit(roll + mod, true, false);
	elif (roll == 1):
		print("CRIT FAIL!")
		roll_result.emit(roll + mod, false, true);
	else:
		roll_result.emit(roll + mod, false, false);
	print(str("Rolled stat %s and got result %d" % [attrName, roll + mod]))
	return roll + mod
 
func _on_roll_button_pressed() -> void:
	roll()
	
func set_value(value : int) -> void:
	$StatNum.value = value
	_on_stat_num_value_changed(value)
	
func get_value() -> int:
	return $StatNum.value
