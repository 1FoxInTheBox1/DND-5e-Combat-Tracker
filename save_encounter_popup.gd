extends Popup

signal window_closed(filename : String)

func _on_done_pressed() -> void:
	window_closed.emit($MarginContainer/VBoxContainer/Input.text);
	hide()


func _on_input_text_submitted(new_text: String) -> void:
	window_closed.emit($MarginContainer/VBoxContainer/Input.text);
	hide()


func _on_cancel_pressed() -> void:
	hide()
