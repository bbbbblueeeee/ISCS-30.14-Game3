extends ParallaxBackground

@onready var nebula: ParallaxLayer = %Nebula
@onready var stars: ParallaxLayer = %Stars


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	nebula.motion_offset.y += 5*delta
	stars.motion_offset.y +=15*delta
	
