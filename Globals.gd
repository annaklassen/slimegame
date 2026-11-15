extends Node


var coins = 0

func reset():
	coins = 0

func _ready() -> void:
	get_tree().scene_changed.connect(reset)
