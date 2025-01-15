extends CharacterBody2D

@export_category("Stats")
@export var movement_speed := 400.

@export_category("Components")
@export var sprite : Sprite2D
@export var bow_sprite : Node2D

var facing_direction = 1

func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	var mouse_dir = global_position.direction_to(mouse)
	bow_sprite.global_rotation = mouse_dir.angle()
		

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction.length_squared() > 0.1:
		velocity = direction * movement_speed
		if direction.x != 0:
			facing_direction = sign(direction.x)
			sprite.flip_h = !(facing_direction + 1)
	else:
		velocity *= 0
	move_and_slide()
