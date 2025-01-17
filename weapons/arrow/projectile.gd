extends Sprite2D
class_name Projectile

@export var max_distance := 32. * 5.
@export var movement_speed := 32. * 8.
@export var detector : CollisionShape2D

var direction := Vector2.ZERO

var is_fading := false
var travelled := 0.

func setup(dir : Vector2):
	direction = dir.normalized()
	global_rotation = direction.angle() +  PI/4

func _physics_process(delta: float) -> void:
	global_position += direction * movement_speed * delta
	travelled += movement_speed * delta
	if travelled > max_distance:
		set_physics_process(false)
		fade_out()



func fade_out() -> void:
	is_fading = true
	await create_tween().tween_property(self, "modulate:a", 0, 0.1).finished
	is_fading = false
	queue_free()


func _on_hitbox_body_entered(body:Node2D) -> void:
	set_physics_process(false)
	detector.set_deferred("disabled", true)
	await get_tree().create_timer(0.5).timeout
	fade_out()
