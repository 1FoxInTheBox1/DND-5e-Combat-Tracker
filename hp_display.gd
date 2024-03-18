extends HBoxContainer

@export var max_hp : int
@export var hp : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = max_hp;
	update_hp_label();

func _on_damage_button_pressed() -> void:
	var damage_amount : int = $DamageAmount.value;
	hp -= damage_amount;
	update_hp_label();
	
func update_hp_label() -> void:
	$HPLabel.text = "HP: %d/%d " % [hp, max_hp];
