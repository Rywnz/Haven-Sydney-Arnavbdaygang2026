extends Node

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart_game"):
		reset_player_position()

func reset_player_position() -> void:
	# Find the player and the spawn marker in the current active level
	var player = get_tree().get_first_node_in_group("player") as Node2D
	var start_spot = get_tree().get_first_node_in_group("start_spot") as Node2D
	
	if player and start_spot:
		player.global_position = start_spot.global_position
		
		# Optional: Reset velocity so the player doesn't keep falling or sliding
		if "velocity" in player:
			player.velocity = Vector2.ZERO
