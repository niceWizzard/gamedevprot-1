extends "state.gd"

@export_category("States")
@export var attacking : RState
@export var idle : RState

var bias : float

func on_enter() -> void:
	super()
	bias = randf_range(-PI/4, PI/4)



func on_physics_process(delta : float) -> RState:
	var a := super(delta)
	if a:
		return a
	if ghost.player == null:
		return idle
	var distance := ghost.global_position.distance_to(ghost.player.global_position)
	if distance < 32 * 3.:
		return attacking
	elif distance > 32. * 10.:
		ghost.player = null
		return idle
	
	var dir = ghost.global_position.direction_to(ghost.player.global_position)
	ghost.set_vel(dir.rotated(bias) * ghost.movement_speed)
	return null
	
