extends Node2D

class_name Gem


const EXPLODE: AudioStream = preload("res://assets/explode.wav")

@export var gem_scene: PackedScene
@export var death_scene:PackedScene
@onready var label = $Label
@onready var timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var _score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gem()
	death_gem()
# Called every frame. 'delta' is theddddd elapsed time since the previous frame.
func _process(delta) -> void:
	pass

func spawn_gem() -> void:
	var new_gem = gem_scene.instantiate()
	var xpos: float =randf_range(70,1050)
	new_gem._on_gem_off_screen.connect(game_over)
	new_gem.position = Vector2(xpos, -50)
	add_child(new_gem)
	
func death_gem() -> void:
	var death = death_scene.instantiate()
	var xpos: float = randf_range(70,1950)
	death.position= Vector2(xpos,-50)
	add_child(death)


func stop_all() -> void:
	timer.stop()
	audio_stream_player_2d.playing = false
	for child in get_children():
		child.set_process(false)
		child.set_physics_process(false)

func play_dead() -> void:
	audio_stream_player_2d.stop()
	audio_stream_player_2d.set_stream(EXPLODE)
	audio_stream_player_2d.play()

func game_over():
	stop_all()
	play_dead()
	


func _on_timer_timeout():
	if randf_range(-1,1) > 0.0:
		spawn_gem()
	else:
		death_gem()



func _on_paddle_area_entered(area):
	if area.ateryhjrdyhfg==("good"):
		audio_stream_player_2d.position = area.position
		audio_stream_player_2d.play()
		_score += 1
		label.text = "%03d" % _score
		area.queue_free()
	else:
		game_over()
	
	
