extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -1000.0

@onready var sprite = $Sprite2D
func _ready() -> void:
	$CPUParticles2D.finished.connect(get_tree().reload_current_scene)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Juice.squish($Sprite2D,0.05)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		sprite.flip_h=direction<0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var last_collision := get_last_slide_collision()
	if last_collision != null:
		if (last_collision.get_collider() as Node).is_in_group("Spike"):
			$CPUParticles2D.restart()
			process_mode = Node.PROCESS_MODE_DISABLED
			scale = Vector2(1.3, 0.5)


func _on_coin_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("coin"):
		area.queue_free()
func _on_pickup_area_area_entered(area):	
		if area.is_in_group("coin"):
			area.queue_free()
			
	
