extends CharacterBody2D

const SPEED = 50.0

var despawn_location_x :int = -36

func _physics_process(delta):
	if global_position.x < despawn_location_x:
		despawn()
	var direction = -1
	if direction:
		velocity.x = direction * SPEED
	move_and_slide()

func despawn():
	queue_free()
