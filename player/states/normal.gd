extends "base.gd"



func on_process(delta: float) -> RState:
	var a := super(delta)
	if a:
		return a
	var mouse = player.get_global_mouse_position()
	var mouse_dir = player.global_position.direction_to(mouse)
	player.gun_anchor.global_rotation = mouse_dir.angle() 
	player.gun_anchor.scale.y = -1 if abs(player.gun_anchor.global_rotation_degrees) >= 90  else 1
	return null

func on_physics_process(delta: float) -> RState:
	var a := super(delta)
	if a:
		return a
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction.length_squared() > 0.1:
		player.velocity = direction * player.movement_speed
		if direction.x != 0:
			player.facing_direction = sign(direction.x)
			player.sprite.flip_h = !(player.facing_direction + 1)
	else:
		player.velocity *= 0
	player.move_and_slide()
	return null


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("attack"):
		var dir = player.global_position.direction_to(player.get_global_mouse_position())
		player.gun.shoot(dir)