extends ProgressBar
class_name HealthBar

@export var autohide := true
@export var autohide_seconds := 1.5

var timer := Timer.new()

func _ready() -> void:
	if autohide:
		add_child(timer)
		timer.one_shot = true
		hide()

func set_current(v : int) -> void:
	show()
	value = v
	if not autohide:
		return
	if not timer.paused:
		timer.stop()
	timer.start(autohide_seconds)
	await timer.timeout
	hide()

