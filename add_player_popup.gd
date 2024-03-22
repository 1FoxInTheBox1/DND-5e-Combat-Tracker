extends Popup

signal window_closed(player_name : String)

func _on_done_pressed() -> void:
	window_closed.emit($VBoxContainer/Input.text)
	hide()


func _on_input_text_submitted(new_text: String) -> void:
	window_closed.emit($VBoxContainer/Input.text)
