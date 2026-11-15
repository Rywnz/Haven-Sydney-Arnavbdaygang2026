extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Marlon_Mogger":
		print("Teleporting to Level 2!")

		PSLManager.gain_psl()

		get_tree().call_deferred(
			"change_scene_to_file",
            "res://Level 2.tscn"
		)
