@tool
class_name Hitbox
extends Area2D

signal on_hit(hurtbox : Hurtbox)


func _ready():
	area_entered.connect(
		func(area : Node2D):
			if area is Hurtbox:
				on_hit.emit(area)
	)
	
		