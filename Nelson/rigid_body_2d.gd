extends RigidBody2D

var speed = 500

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1
	
	if input_vector.length() > 0:
		# Apply acceleration or constant force to move
		velocity = input_vector.normalized() * speed 
	else:
		# Apply friction (deceleration) when no input
		# Use lerp for a smooth slowdown
		velocity = lerp(velocity, Vector2.ZERO, friction_factor) 

	# Apply the velocity to the RigidBody2D
		linear_velocity = velocity
