extends Timer
@onready var timer = $"../CanvasLayer/Control/VBoxContainer/Timer/Label"
@onready var level_timer = $"../LevelTimer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_timer_timeout():pass
	
	

		
	#LevelTimer.text = str(int(level_timer.time_left))
	
	
