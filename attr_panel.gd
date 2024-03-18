extends VBoxContainer

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
