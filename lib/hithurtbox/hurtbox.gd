@tool
class_name Hurtbox
extends Area2D

@onready var hb_owner := get_parent()
signal on_hit(damage_info : DamageInfo)


func _ready():
	if Engine.is_editor_hint():
		monitoring = false
		collision_mask = 0

func hurt(info : DamageInfo) -> void:
	on_hit.emit(info)