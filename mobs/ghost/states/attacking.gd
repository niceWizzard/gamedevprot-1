extends "state.gd"
@export_category("States")
@export var chasing : RState
@export var idle : RState

func on_physics_process(delta : float) -> RState:
    var a := super(delta)
    if a:
        return a
    var vec = ghost.player.global_position - ghost.global_position

    if vec.length() > 32. * 4.2:
        return chasing
    ghost.set_vel(Vector2.ZERO, 0.6)
    if not ghost.velocity.is_zero_approx():
        return null
    return null
