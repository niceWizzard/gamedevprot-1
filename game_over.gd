extends Control

@export var player : Player

func _ready() -> void:
	hide()
	player.health.on_health_runout.connect(
		func():
			show()
	)


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().quit()
