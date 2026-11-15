extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func squash(target, amount = 1.3):
	var s = target.get_meta("size", target.scale)
	target.set_meta("size", s)
	var tw = target.create_tween()
	tw.tween_property(target, "scale", s * Vector2(amount, 2 - amount), 0.08)
	var back = tw.tween_property(target, "scale", s, 0.3)
	back.set_trans(Tween.TRANS_ELASTIC)
	back.set_ease(Tween.EASE_OUT)

func squish(target, amount = 1.3):
	var s = target.get_meta("size", target.scale)
	target.set_meta("size", s)
	var tw = target.create_tween()
	tw.tween_property(target, "scale", s * Vector2(2-amount, amount), 0.16)
	var back = tw.tween_property(target, "scale", s, 0.3)
	back.set_trans(Tween.TRANS_ELASTIC)
	back.set_ease(Tween.EASE_OUT)
	
func pop(target, size = 1.5):
		if target is Control:
			target.pivot_offset_ratio = Vector2(0.5, 0.5)
		var s = target.get_meta("size", target.scale)
		target.set_meta("size", s)
		target.scale = s * size
		var back = target.create_tween().tween_property(target, "scale",s, 0.3)
		back.set_trans(Tween.TRANS_BACK)
		back.set_ease(Tween.EASE_OUT)
		
