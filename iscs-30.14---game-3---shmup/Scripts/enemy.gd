extends Node2D

@onready var stats_component: StatsComponent = $StatsComponent
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent
@onready var world: Node2D = $".."
@onready var enemy_generator: Node2D = $"../EnemyGenerator"

signal remove_enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
