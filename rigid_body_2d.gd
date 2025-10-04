extends RigidBody2D

var move_direction = Vector2.ZERO
var speed = 500

func _physics_process(delta):
	# Get input and update move_direction
	move_direction = Vector2.ZERO
	if Input.is_action_pressed("P1 Right"):
		move_direction.x += 1
	if Input.is_action_pressed("P1 Left"):
		move_direction.x -= 1
	if Input.is_action_pressed("P1 Up"):
		move_direction.y -= 1
	if Input.is_action_pressed("P1 Down"):
		move_direction.y += 1
	
	# Normalize the direction to prevent faster diagonal movement
	move_direction = move_direction.normalized()

func _integrate_forces(state):
	# Apply a force based on input
	state.apply_central_force(move_direction * speed) 
