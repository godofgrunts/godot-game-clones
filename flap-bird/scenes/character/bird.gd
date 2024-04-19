extends CharacterBody2D

@onready var anim_sprite : AnimatedSprite2D = %AnimatedSprite2D
const SPEED : float = 300.0
const JUMP_VELOCITY : float = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	global_position = Vector2(36, 144)

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	if velocity.y >= 0:
		anim_sprite.stop()

	# Handle jump.
	if Input.is_action_just_pressed("flap") and velocity.y >= 0:
		anim_sprite.play("default")
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	for i in get_slide_collision_count():
		if get_slide_collision(i):
			print("dead")
