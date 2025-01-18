class_name StateMachine
extends Node

@export var initial_state : RState

var current_state : RState = null


func _ready() -> void:
	var child_states :Array[RState]= get_child_states() 
	assert(child_states.size() > 0, "There is no child states in the state machine!")

	var parent = self.get_parent()
	assert(parent != null, "State Machine should have a parent.")
	for state in child_states:
		state.setup(parent)

	if initial_state == null:
		initial_state = child_states[0]

	set_state(initial_state)


func _process(delta: float) -> void:
	var new_state = current_state.on_process(delta)
	if new_state != null:
		set_state(new_state)

func _physics_process(delta: float) -> void:
	var new_state = current_state.on_physics_process(delta)
	if new_state != null:
		set_state(new_state)

func set_state(s : RState) -> void:
	if current_state != null:
		current_state.on_exit()
	current_state = s
	s.on_enter()

func get_child_states() -> Array[RState]:
	var array : Array[RState] = []
	for child : Node in get_children():
		if child is RState:
			array.append(child)
	return array
