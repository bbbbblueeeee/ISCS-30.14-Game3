class_name HurtboxComponent
extends Area2D


var is_invincible = false:
	# inline setter so we can disable and enable
	# hurtbox when is_invincible is changed
	set(value):
		is_invincible = value
		for child in get_children():
			if not child is CollisionShape2D and not child is CollisionPolygon2D: continue
			child.set_deferred("disabled",is_invincible)

signal hurt(hitbox)
