extends CharacterBody2D
class_name Player

@export_category("Stats")
@export var movement_speed := 400.

@export_category("Components")
@export var sprite : Sprite2D
@export var gun_anchor : Node2D
@export var gun : Gun
@export var health : Health


var facing_direction = 1




func _on_health_on_health_runout() -> void:
	queue_free()


func _on_hurtbox_on_hit(damage_info:DamageInfo) -> void:
	health.health -= damage_info.amount
