extends Control

@onready var bar = $PSLBar
@onready var label = $PSLLabel

func _ready() -> void:
	PSLManager.psl_changed.connect(update_bar)
	update_bar()

func update_bar() -> void:
	bar.value = PSLManager.psl
	label.text = "PSL: " + str(PSLManager.psl) + "/8"
