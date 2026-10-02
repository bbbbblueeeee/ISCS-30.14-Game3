class_name ScaleComponent
extends Node

@export var sprite: Node2D
@export var scale_amount = Vector2(1.3,1.3)
@export var scale_duration = 0.4


# Called when the node enters the scene tree for the first time.
func tween_scale() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.tween_property(sprite,"scale",scale_amount,scale_duration*0.1).from_current()
	tween.tween_property(sprite,"scale",Vector2.ONE,scale_duration*0.9).from(scale_amount)
