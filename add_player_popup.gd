extends Popup

signal window_closed(player_name : String, initiative : int)

func _on_done_pressed() -> void:
	window_closed.emit($MarginContainer/VBoxContainer/Input.text, $MarginContainer/VBoxContainer/Initiative.value)
	hide()


func _on_cancel_pressed() -> void:
	hide()
