extends Popup


func show_result(value : int, crit : bool, fail : bool):
	var result_text : String
	if (crit):
		result_text = "CRITICAL SUCCESS!\n"
	if (fail):
		result_text = "CRITICAL FAIL!\n"
	result_text = result_text + "Rolled a " + str(value)
	$VBoxContainer/Label.text = result_text
	show()
	
func _on_button_pressed() -> void:
	hide()
