extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		queue_free()
		Globals.coins += 1	
		Juice.squash(body.get_node("Sprite2D"),0.05)
