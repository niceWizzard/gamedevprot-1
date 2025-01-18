extends Sprite2D


@export var movement_speed := 32. * 3.
var player : CharacterBody2D = null


func _process(delta: float) -> void:
	if player:
		var dir = global_position.direction_to(player.global_position)
		global_position += dir * movement_speed * delta
		



func _on_player_detector_body_entered(body:Node2D) -> void:
	player = body
