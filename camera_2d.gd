extends Camera2D


@onready var marker = $"../../Marker2D"



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		global_position = marker.global_position
		zoom = Vector2(0.1, 0.1)
