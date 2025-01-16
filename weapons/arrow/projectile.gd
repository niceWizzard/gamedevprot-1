extends Sprite2D
class_name Projectile

@export var movement_speed := 32. * 8.

var direction := Vector2.ZERO


func setup(dir : Vector2):
	direction = dir.normalized()
	global_rotation = direction.angle() +  PI/4

func _physics_process(delta: float) -> void:
	global_position += direction * movement_speed * delta





