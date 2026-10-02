class_name PositionClampComponent
extends Node


@export var actor: Node2D
@export var margin: = 10

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")
var top_border = 50
var bottom_border = ProjectSettings.get_setting("display/window/size/viewport_height")


func _process(delta: float) -> void:
	actor.global_position.x = clamp(actor.global_position.x, left_border+margin, right_border-margin)
	actor.global_position.y = clamp(actor.global_position.y, top_border+margin, bottom_border-margin)
