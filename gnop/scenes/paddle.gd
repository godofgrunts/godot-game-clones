extends CharacterBody2D


const PLAYER_SPEED = 150.0
const CPU_SPEED = 100.0
const GAME_TYPE = "PADDLE"
var SPEED
var x_cord
var last_direction = 1

func _ready():
	if self.name == "Player":
		SPEED = PLAYER_SPEED
	else:
		SPEED = CPU_SPEED
	x_cord = self.global_position.x

func _physics_process(delta):
	var direction = 0
	if self.name == "Player":
		direction = Input.get_axis("up", "down")
	
	if self.name == "CPU":
		if GameState.ball_location.y > self.global_position.y:
			direction = 1
		elif GameState.ball_location.y < self.global_position.y:
			direction = -1
	
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if global_position.y > 288:
		velocity.y = 0
		global_position.y = 288
	elif global_position.y < 0:
		velocity.y = 0
		global_position.y = 0

	move_and_slide()
	
	global_position.x = x_cord
	if direction > 0:
		last_direction = 1
	elif direction < 0:
		last_direction = -1
	else:
		last_direction = last_direction
