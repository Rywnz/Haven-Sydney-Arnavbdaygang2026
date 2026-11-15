extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Marlon_Mogger":
		PSLManager.lose_psl()
		get_tree().reload_current_scene()
