extends Area2D

signal _on_gem_off_screen

@export var speed: float 
@export var ateryhjrdyhfg ="good"

@export var horizontal_speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += horizontal_speed * delta
	position.y += speed * delta
	
	if position.y > get_viewport_rect().size.y:
		_on_gem_off_screen.emit()
		set_physics_process(false)
		queue_free()
