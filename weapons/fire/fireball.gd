extends Sprite2D


@export var max_distance := 32. * 5.
@export var movement_speed := 32. * 8.

var direction := Vector2.ZERO

var is_fading := false
var travelled := 0.

func setup(dir : Vector2):
	direction = dir.normalized()
	global_rotation = direction.angle() -  PI/3


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


func _on_hitbox_on_hit(hurtbox: Hurtbox) -> void:
	hurtbox.hb_owner.queue_free()
	fade_out()