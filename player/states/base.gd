extends RState

var player : Player

func setup(sm_owner : Node, sm : StateMachine) -> void:
	super(sm_owner, sm)
	player = sm_owner

