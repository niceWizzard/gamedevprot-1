extends "move.gd"


@export var normal : RState

var time := 2.5

func on_enter() -> void:
    super()
    player.hurtbox_collision_shape.set_deferred("disabled",true)
    player.anim_player.play("hurt")
    

func on_physics_process(delta: float) -> RState:
    var a := super(delta)
    if a :
        return a
    time -= delta
    if time <= 0:
        return normal
    return null

func on_exit() -> void:
    super()
    player.hurtbox_collision_shape.set_deferred("disabled",false)
    player.anim_player.play("normal")
    time = 2.5
