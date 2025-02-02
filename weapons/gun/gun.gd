extends Node2D
class_name Gun

@export_category("Stats")
@export var reload_time := .5

@export var bullet_spawn : Marker2D
@export var bullet : PackedScene
@export var gun_owner : Node2D

var can_shoot := true

func _ready() -> void:
	if !gun_owner:
		gun_owner = get_parent()

func shoot(dir : Vector2) -> void:
	if !can_shoot:
		return
	var bullet_obj = bullet.instantiate() as Projectile
	bullet_obj.setup(dir, gun_owner )
	bullet_obj.global_position = bullet_spawn.global_position
	get_tree().root.add_child(bullet_obj)
	can_shoot = false
	await get_tree().create_timer(reload_time).timeout
	can_shoot = true
