extends Camera2D

@export var player : CharacterBody2D

func _process(delta: float) -> void:
	if is_instance_valid(player):
		global_position = player.global_position
