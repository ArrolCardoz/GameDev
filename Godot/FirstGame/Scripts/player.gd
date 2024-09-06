extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump = $Jump


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Handle's animation
	#direction value will be 1,0,-1 for right, idel and left respectivly
	if direction==1:
		animated_sprite.flip_h = false
		animated_sprite.play("Run")
	elif direction<0:
		animated_sprite.flip_h= true
		animated_sprite.play("Run")
	else :
		animated_sprite.play("Idel")
	
	if not is_on_floor():
		animated_sprite.play("jump")
		
		
		
	move_and_slide()
