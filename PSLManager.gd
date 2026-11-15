extends Node

signal psl_changed

var psl: int = 5
const MAX_PSL: int = 8

func lose_psl() -> void:
	psl = max(0, psl - 1)
	psl_changed.emit()

func gain_psl() -> void:
	psl = min(MAX_PSL, psl + 5)
	psl_changed.emit()
