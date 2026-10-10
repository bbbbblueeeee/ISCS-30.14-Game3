extends Node2D

@export var YellowEnemyScene : PackedScene
@export var PinkEnemyScene : PackedScene

var game_ending: bool = false
var enemy_count: int = 0
var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var yellow_spawn_timer: Timer = $YellowSpawnTimer
@onready var pink_spawn_timer: Timer = $PinkSpawnTimer
@onready var game_timer: Timer = $GameTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yellow_spawn_timer.timeout.connect(handle_spawn.bind(YellowEnemyScene, yellow_spawn_timer))
	pink_spawn_timer.timeout.connect(handle_spawn.bind(PinkEnemyScene, pink_spawn_timer))
	game_timer.timeout.connect(end_spawning)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	enemy_count += 1
	print(enemy_count)

func remove_enemy() -> void:
	enemy_count -= 1

func end_spawning() -> void:
	yellow_spawn_timer.timeout.disconnect(handle_spawn)
	pink_spawn_timer.timeout.disconnect(handle_spawn)
	game_ending = true
	print(game_ending)
	

func _process(delta: float) -> void:
	if game_ending and enemy_count == 0:
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
