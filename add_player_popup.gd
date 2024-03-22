extends Popup

signal window_closed(player_name : String, initiative : int)

func _on_done_pressed() -> void:
	window_closed.emit($VBoxContainer/Input.text, $VBoxContainer/Initiative.value)
	hide()
