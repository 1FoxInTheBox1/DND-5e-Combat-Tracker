extends HBoxContainer

@export var max_hp : int
@export var hp : int
@export var ac : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_values()
	
func update_values() -> void:
	$CurrentHP.value = hp
	$MaxHP.value = max_hp
	$AC.value = ac
	

func set_max_hp(amount : int) -> void:
	max_hp = amount
	update_values()
	
func set_current_hp(amount : int) -> void:
	hp = amount
	update_values()

func set_ac(amount : int) -> void:
	ac = amount
	update_values()
	
func get_max_hp() -> int:
	return $MaxHP.value
	
func get_current_hp() -> int:
	return $CurrentHP.value
	
func get_ac() -> int:
	return $AC.value

func _on_current_hp_value_changed(value: float) -> void:
	set_current_hp(value)

func _on_max_hp_value_changed(value: float) -> void:
	set_max_hp(value)
