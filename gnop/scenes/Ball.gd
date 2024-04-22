extends CharacterBody2D

var speed = 50.0
var direction = Vector2(-1, 0)

func _ready():
	self.global_position = GameState.ball_location

func _physics_process(delta):
	velocity = direction * speed
	var collision_info = move_and_collide(velocity * delta)
	GameState.ball_location = self.global_position
	if collision_info:
		match collision_info.get_collider().GAME_TYPE:
			"PADDLE":
				speed = speed * 1.05
				direction = Vector2(direction.x * -1, collision_info.get_collider().last_direction)
				$Hit.play()
			"WALL":
				speed = speed * 1.02
				direction = Vector2(direction.x, direction.y * -1)
				$Hit.play()
			"GOAL":
				GameState.emit_signal("goal", collision_info.get_collider().name)
				$Score.play()
				reset()

func reset():
	if (GameState.p2_score == 0) and (GameState.p1_score == 0):
		speed = 50
	else:
		speed = speed * 1.02
	self.global_position = Vector2(256, 144)
	direction = Vector2(-1, 0)
