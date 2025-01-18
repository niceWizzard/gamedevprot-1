extends "state.gd"

@export_category("States")
@export var chasing : RState

func on_process(delta : float) -> RState:
    var a = super(delta)
    if a :
        return a
    if ghost.player:
        return chasing
    return null
    
