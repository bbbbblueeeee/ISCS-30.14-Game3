extends Node2D

@onready var ship: Node2D = $Ship
@onready var stats_component: StatsComponent = $StatsComponent
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var enemy_generator: Node2D = $EnemyGenerator


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		)

func remove_enemy() -> void:
	enemy_generator.remove_enemy()

func damage() -> void:
	stats_component.health -= 1
	progress_bar.value = stats_component.health
	if stats_component.health == 0:
		ship.destroyed_component.destroy()
