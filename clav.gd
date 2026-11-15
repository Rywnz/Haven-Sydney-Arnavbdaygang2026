extends Node2D

var dialogue

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.name == "Marlon_Mogger":
		if dialogue == null:
			dialogue = preload("res://Dialogue.tscn").instantiate()
			get_tree().current_scene.add_child(dialogue)

		dialogue.get_node("Control").visible = true
		dialogue.get_node("Control/Panel/Label").text = "Oh you are too powerfull. I thought you could never mog me but you managed to bounce back. You are the true embodiement of BP I respect you.
You are now rank 1 mogger again.
Marlon you have bounced back, you are a true mogger"


func _on_body_exited(body):
	if body.name == "Marlon_Mogger" and dialogue != null:
		dialogue.get_node("Control").visible = false
