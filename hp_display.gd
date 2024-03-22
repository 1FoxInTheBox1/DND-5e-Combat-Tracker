extends HBoxContainer

@export var max_hp : int
@export var hp : int
@export var ac : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_values()


func _on_damage_button_pressed() -> void:
	hp -= $DamageAmount.value
	update_values()

	
func update_values() -> void:
	$CurrentHP.value = hp
	$MaxHP.value = max_hp
	$AC.value = ac
	

func set_max_hp(amount : int) -> void:
	max_hp = amount
	hp = amount
	update_values()
	

func set_ac(amount : int) -> void:
	ac = amount
	update_values()
