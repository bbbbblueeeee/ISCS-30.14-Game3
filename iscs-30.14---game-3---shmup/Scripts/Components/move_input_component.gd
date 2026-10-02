class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
var speed_factor: int = 100

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	var h_input_axis = Input.get_axis("ui_left", "ui_right")
	var v_input_axis = Input.get_axis("ui_up","ui_down")
	move_component.velocity = Vector2(h_input_axis, v_input_axis).normalized()*speed_factor
