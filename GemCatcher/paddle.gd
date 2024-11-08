extends Area2D

@export var speed: float = 160.0

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	position.x += direction * speed * delta
	position.x = clamp(position.x, 60, get_viewport_rect().size.x - 60)
