extends CharacterBody2D

signal health_depleted
var health = 100.0

func _physics_process(delta):
	var direction  = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 25.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	print(overlapping_mobs)
	if overlapping_mobs.size() > 1:
		health -= DAMAGE_RATE * (overlapping_mobs.size()-1) * delta
		%ProgressBar.value = health
		
		if health <= 0.0:
			health_depleted.emit()
