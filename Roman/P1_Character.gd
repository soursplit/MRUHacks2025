extends CharacterBody2D

@export var speed = 400

const PUSH_FORCE: = 150.0
const min_push_force: = 100.0

func get_input():
	var input_direction = Input.get_vector("P1 Left", "P1 Right", "P1 Up", "P1 Down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			var push_force = (PUSH_FORCE * velocity.length() / speed) + min_push_force
			c.get_collider().apply_central_impulse(-c.get_normal()*push_force)
