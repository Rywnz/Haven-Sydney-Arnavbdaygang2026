extends Control




func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Level 1.tscn") # Replace with your game scene path



func _on_quit_pressed() -> void:
	get_tree().quit()
