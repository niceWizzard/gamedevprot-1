extends Sprite2D
class_name Ghost

@export var movement_speed := 32. * 3.
@export var health : Health

var player : CharacterBody2D = null:
	get:
		if is_instance_valid(player):
			return player 
		else: 
			return null

const FIREBALL_SCN := preload("uid://dlkasqddgikyc")


var velocity : Vector2

func set_vel(v : Vector2, weight:= 0.35) -> void:
	velocity = lerp(velocity, v, weight)

func _on_player_detector_body_entered(body:Node2D) -> void:
	player = body

func _process(_delta: float) -> void:
	if abs(velocity.x) > 0.01:
		flip_h = !(sign(velocity.x) + 1)

func _physics_process(delta: float) -> void:
	global_position += velocity * delta


func _on_health_on_health_runout() -> void:
	queue_free()


func _on_hurtbox_on_hit(damage_info:DamageInfo) -> void:
	health.health -= damage_info.amount
	
