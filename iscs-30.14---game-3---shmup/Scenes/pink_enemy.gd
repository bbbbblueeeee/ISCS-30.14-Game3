extends "res://Scripts/enemy.gd"

@onready var laser_spawner: SpawnerComponent = $LaserSpawner
@onready var marker: Marker2D = $Marker2D
@onready var fire_timer: Timer = $FireTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_timer.timeout.connect(fire_lasers)
	visible_on_screen_notifier_2d.screen_exited.connect(func():
		world.remove_enemy()
		world.damage()
		queue_free
		)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		pass
	)
	hitbox_component.hit_hurtbox.connect(func():
		destroyed_component.destroy.unbind(1)
		)
	stats_component.no_health.connect(world.remove_enemy)


func fire_lasers() -> void:
	laser_spawner.spawn(marker.global_position)
