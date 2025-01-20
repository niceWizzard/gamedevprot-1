extends CharacterBody2D

@export_category("Stats")
@export var movement_speed := 400.

@export_category("Components")
@export var sprite : Sprite2D
@export var bow_anchor : Node2D
@export var bow : Bow
@export var health : Health


var facing_direction = 1

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("attack"):
		var dir = global_position.direction_to(get_global_mouse_position())
		bow.shoot(dir)

func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	var mouse_dir = global_position.direction_to(mouse)
	bow_anchor.global_rotation = mouse_dir.angle() 
		

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


func _on_health_on_health_runout() -> void:
	queue_free()


func _on_hurtbox_on_hit(damage_info:DamageInfo) -> void:
	health.health -= damage_info.amount