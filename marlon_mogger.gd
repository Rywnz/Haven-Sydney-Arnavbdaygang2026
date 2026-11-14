extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = -300.0
@export var gravity: float = 900.0

@onready var anim: AnimatedSprite2D = $Marlon


func _physics_process(delta: float) -> void:
	# Gravity pulls the character back down when not on the ground
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump (only when standing on the ground)
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_released("up") and velocity.y < 0:
		velocity.y = jump_velocity / 4
	# Left / right movement
	var dir_x := Input.get_axis("left", "right")
	velocity.x = dir_x * speed

	move_and_slide()

	update_animation(dir_x)


func update_animation(dir_x: float) -> void:
	if not is_on_floor():
		# In the air: use "jump" if you made one, otherwise keep "Run"
		var air_anim := "jump" if anim.sprite_frames.has_animation("jump") else "Run"
		if anim.animation != air_anim:
			anim.play(air_anim)
	elif dir_x != 0:
		if anim.animation != "Run":
			anim.play("Run")
	else:
		if anim.animation != "idle":
			anim.play("idle")

	# Face the direction we're moving
	if dir_x != 0:
		anim.flip_h = dir_x < 0

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		var spot = get_tree().get_first_node_in_group("start_spot")
		if spot:
			global_position = spot.global_position
			print("Teleported!")
		else:
			print("ERROR: Could not find start_spot!")
