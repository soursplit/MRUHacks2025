extends CharacterBody2D

@export var speed = 400
var health: int =  3

func get_input():
	var input_direction = Input.get_vector("P1 Left", "P1 Right", "P1 Up", "P1 Down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func take_damage(damage:int):
	health -= damage
	print("Damagedwa")
	if health <= 0:
		$Sprite2D.visible = false
		print("Dead")
