extends "state.gd"
@export_category("States")
@export var chasing : RState
@export var idle : RState

var can_attack := true

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
    if can_attack:
        attack()
    return null


func attack():
    can_attack = false
    var dir = ghost.global_position.direction_to(ghost.player.global_position)
    var fireball := ghost.FIREBALL_SCN.instantiate()
    fireball.setup(dir)
    fireball.global_position = ghost.global_position + dir * 32 * .5
    get_tree().root.add_child(fireball)
    await get_tree().create_timer(1.0).timeout
    can_attack = true