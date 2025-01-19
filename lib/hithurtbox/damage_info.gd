class_name DamageInfo
extends RefCounted

func _init(_amount : int, origin : Node2D):
    self.amount = _amount
    self.unsafe_origin_object = origin


var amount : int
var unsafe_origin_object : Node2D

var origin_object : Node2D:
    get():
        return unsafe_origin_object if is_instance_valid(unsafe_origin_object) else null