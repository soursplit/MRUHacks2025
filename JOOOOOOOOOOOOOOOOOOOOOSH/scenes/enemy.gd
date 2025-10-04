extends CharacterBody2D

##Code inspired from "Create AI Enemies in Godot4 2D | Godot simple enemy tutorial ." by GameStick
@onready var target = $"../Player"
var speed = 150

## Handles physics of moving enemy
func _physics_process(delta):
	var direction = (target.position - position).normalized() ## Calculates direction to a chosen player and normalizes direction
	velocity = direction * speed ## Calculates vel
	look_at(target.position) ## Makes enemy look at chosen player
	move_and_slide() ## Function that handles smooth movement
##Code inspired from "Create AI Enemies in Godot4 2D | Godot simple enemy tutorial ." by GameStick
