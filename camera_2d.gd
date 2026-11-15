extends Camera2D


@onready var marker = $"../../Marker2D"
@onready var timer = $"End Screen/LevelTimer"
@export var level_duration = 5
var finished = false

func _ready():
	timer.text = str(int(level_duration))

func _process(dt)->void:
	
	level_duration = level_duration - dt if not finished else level_duration
	if level_duration < 0: 
		#lost, reset
		get_tree().reload_current_scene()
		
	else:
		timer.text = str(int(level_duration))
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		global_position = marker.global_position
		zoom = Vector2(0.1, 0.1)
		finished = true
		$"End Screen/Ending Title".show()
		$"../../AudioStreamPlayer".play()
		
		#hnununhunhnu
		# start a timer onscreen (label), 4 secs
		# await 4seconds
		# reset()
		#
		#
