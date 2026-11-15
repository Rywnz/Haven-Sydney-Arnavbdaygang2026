extends Control

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Level 1.tscn") 


func _on_quit_pressed() -> void:
	print("Quit button was clicked!")
	get_tree().quit()
