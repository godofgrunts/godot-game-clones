extends CharacterBody2D

@onready var anim_sprite : AnimatedSprite2D = %AnimatedSprite2D
const SPEED : float = 50.0
const JUMP_VELOCITY : float = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	anim_sprite.flip_h = true
	global_position = Vector2(36, 144)

func _physics_process(delta):
	velocity.x = SPEED
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
			SignalManager.emit_signal("lose")
	
	if global_position.y >= 300:
		SignalManager.emit_signal("lose")
	
	if global_position.y <= -12:
		SignalManager.emit_signal("lose")
	
	if global_position.x >= 1500:
		SignalManager.emit_signal("win")
