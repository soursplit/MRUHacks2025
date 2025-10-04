extends CharacterBody2D
var speed = 500

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = speed * direction
	
	move_and_slide()
