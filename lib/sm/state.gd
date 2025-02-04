class_name RState
extends Node

var sm_owner : Node
var sm : StateMachine

func _ready() -> void:
    set_physics_process(false)
    set_process(false)

func setup(sm_owner : Node, sm : StateMachine) -> void:
    self.sm_owner = sm_owner
    self.sm = sm

func on_ready() -> void:
    pass

func on_enter() -> void:
    pass

func on_exit() -> void:
    pass

func on_process(delta: float) -> RState:
    return null


func on_physics_process(delta:  float) -> RState:
    return null

func on_unhandled_input(event: InputEvent) -> RState:
    return null

