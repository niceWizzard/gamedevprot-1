extends "move.gd"





func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("attack"):
		var dir = player.global_position.direction_to(player.get_global_mouse_position())
		player.gun.shoot(dir)