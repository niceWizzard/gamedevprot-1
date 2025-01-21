extends CharacterBody2D
class_name Ghost

@export var sprite : Sprite2D
@export var movement_speed := 32. * 3.
@export var health : Health
@export_flags_2d_physics var steer_mask: int


var player : CharacterBody2D = null:
	get:
		if is_instance_valid(player):
			return player 
		else: 
			return null

const FIREBALL_SCN := preload("uid://dlkasqddgikyc")


func set_vel(v : Vector2, weight:= 0.35) -> void:
	velocity = lerp(velocity, v, weight)

func _on_player_detector_body_entered(body:Node2D) -> void:
	player = body

func _process(_delta: float) -> void:
	if abs(velocity.x) > 0.01:
		sprite.flip_h = !(sign(velocity.x) + 1)

func _physics_process(delta: float) -> void:
	global_position += velocity * delta


func _on_health_on_health_runout() -> void:
	queue_free()


func _on_hurtbox_on_hit(damage_info:DamageInfo) -> void:
	health.health -= damage_info.amount
	
func calc_steer_dir(desired_dir : Vector2, ray_count := 16, mask : int= steer_mask) -> Vector2:
	var rays : Array[Vector2] = []
	var interests : Array[float] = []
	for i in range(ray_count):
		var angle := i * 2 * PI/ray_count
		var vec := Vector2.RIGHT.rotated(angle).normalized()
		rays.append(vec)
		interests.append( desired_dir.dot(vec))
	
	#Dangers
	var space_state := get_world_2d().direct_space_state
	var output := Vector2()
	for i in ray_count:
		var ray := rays[i]
		var query := PhysicsRayQueryParameters2D.create(
			global_position,
			global_position + ray * 32 * 1.,
			mask,
			[self]
		)
		var hit := space_state.intersect_ray(query)
		if not hit.is_empty():
			interests[i] -= 5
			
		output += interests[i] * ray
	
	return output.normalized()