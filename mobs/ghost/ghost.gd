extends Sprite2D
class_name Ghost


@export var movement_speed := 32. * 3.
var player : CharacterBody2D = null


func _on_player_detector_body_entered(body:Node2D) -> void:
	player = body
