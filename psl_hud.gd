extends CanvasLayer

@onready var bar = $Control/PSL_Bar
@onready var label = $Control/PSL_Label

func _ready():
	bar.min_value = 0
	bar.max_value = 8

	PSLManager.psl_changed.connect(update_bar)

	update_bar()

func update_bar():
	bar.value = PSLManager.psl
	label.text = "PSL  " + str(PSLManager.psl) + " / 8"
