class_name HitboxComponent
extends Area2D

@export var damage = 1.0

signal hit_hurtbox(hurtbox)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_hurtbox_entered(hurtbox: HurtboxComponent):
	if not hurtbox is HurtboxComponent: return
	if hurtbox.is_invincible: return
	hit_hurtbox.emit(hurtbox)
	hurtbox.hurt.emit(self)
