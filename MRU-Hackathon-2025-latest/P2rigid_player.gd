extends RigidBody2D

@onready var healthBar = $HealthBar

var move_direction = Vector2.ZERO
var speed = 2000


var maxHealth = 150
var health = 3

func _ready():
	healthBar.set_health_bar(health,maxHealth)

func _physics_process(delta):
	# Get input and update move_direction
	move_direction = Vector2.ZERO
	if Input.is_action_pressed("P2 Right"):
		move_direction.x += 1
	if Input.is_action_pressed("P2 Left"):
		move_direction.x -= 1
	if Input.is_action_pressed("P2 Up"):
		move_direction.y -= 1
	if Input.is_action_pressed("P2 Down"):
		move_direction.y += 1
	
	# Normalize the direction to prevent faster diagonal movement
	move_direction = move_direction.normalized()

func _integrate_forces(state):
	# Apply a force based on input
	state.apply_central_force(move_direction * speed) 
	
func take_damage(damage:int):
	health -= damage
	healthBar.set_health_bar(health,maxHealth)
	print("Damagedwa")
	if health <= 0:
		$Sprite2D.visible = false
		print("Dead")
