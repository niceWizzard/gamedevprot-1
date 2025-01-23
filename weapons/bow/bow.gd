class_name Bow
extends Sprite2D

@export_category("Stats")
@export var reload_time := .5

@export var arrow_spawn : Marker2D
@export var arrow : PackedScene
@export var arrow_placeholder_sprite : Sprite2D
@export var bow_owner : Node2D

var can_shoot := true

func _ready() -> void:
	if !bow_owner:
		bow_owner = get_parent()

func shoot(dir : Vector2) -> void:
	if !can_shoot:
		return
	var arrow_obj = arrow.instantiate() as Projectile
	arrow_obj.setup(dir, bow_owner )
	arrow_obj.global_position = arrow_spawn.global_position
	get_tree().root.add_child(arrow_obj)
	can_shoot = false
	arrow_placeholder_sprite.hide()
	await get_tree().create_timer(reload_time).timeout
	can_shoot = true
	arrow_placeholder_sprite.show()


