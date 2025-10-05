extends Area2D

## Code Inspired by "Damage System for Beginner - Learn Godot 4 = no talking" by DevDrache
func _on_body_entered(body : CharacterBody2D):
	if "Enemy" in body.name:
		body.take_damage(1)
## End of Code Inspired by "Damage System for Beginner - Learn Godot wd4 = no talking" by DevDrache
