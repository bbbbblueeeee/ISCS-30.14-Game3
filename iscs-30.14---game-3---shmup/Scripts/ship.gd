extends Node2D

@onready var left_marker: Marker2D = $LeftMarker
@onready var right_marker: Marker2D = $RightMarker
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var fire_timer: Timer = $FireTimer
@onready var scale_component: ScaleComponent = $ScaleComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_timer.timeout.connect(fire_lasers)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func fire_lasers() -> void:
	spawner_component.spawn(left_marker.global_position)
	spawner_component.spawn(right_marker.global_position)
	scale_component.tween_scale()
