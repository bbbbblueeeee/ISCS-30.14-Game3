class_name DestroyedComponent
extends Node

@export var actor: Node2D
@export var stats_component: StatsComponent
@export var destroy_effect_spawner_component: SpawnerComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stats_component.no_health.connect(destroy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func destroy() -> void:
	destroy_effect_spawner_component.spawn(actor.global_position)
	actor.queue_free()
