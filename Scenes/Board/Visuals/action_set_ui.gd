extends HBoxContainer


signal signal_action_selected(move)


## Display all actions of a selected piece
func display_action_set(action_set: Array) -> void:
	clear_action_set()
	
	for action in action_set:
		var button := Button.new()
		
		button.text = action.name
		button.add_theme_font_size_override("font_size", 4)
		button.size.y = 16
		button.pressed.connect(_on_action_pressed.bind(action))
		
		add_child(button)


## Clear all buttons for movesets
func clear_action_set() -> void:
	for button in get_children():
		button.queue_free()


func _on_action_pressed(move) -> void:
	signal_action_selected.emit(move)
