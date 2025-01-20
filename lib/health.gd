class_name Health
extends Node

@export var max_health := 100.

@onready var health := max_health:
    set(val):
        health = val
        on_health_change.emit()
        if health <= 0:
            on_health_runout.emit()



signal on_health_runout
signal on_health_change