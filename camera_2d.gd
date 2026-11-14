extends Camera2D

@export var decay: float = 1.0 # How quickly the shake stops
var shake_strength: float = 0.0

func apply_shake(strength: float) -> void:
	shake_strength = max(shake_strength, strength)

func _process(delta: float) -> void:
	if shake_strength > 0.0:
		shake_strength = lerpf(shake_strength, 0.0, decay * delta)
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
	else:
		offset = Vector2.ZERO
