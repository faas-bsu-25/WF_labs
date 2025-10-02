extends CharacterBody2D

var jump_power = 700
var is_hurt = false

func _on_animated_sprite_2d_animation_finished() -> void:
	is_hurt = false
	pass # Replace with function body.

func hurt():
	is_hurt = true
	$AnimatedSprite2D.play("hurt")
	$SFX/crash.play()

func _process(delta: float) -> void:
	
	self.velocity.y += get_gravity().y * delta
	
	
	if(Input.is_action_just_pressed("jump")):
		self.velocity.y = -jump_power
	$AnimatedSprite2D.play("jump")
	$SFX/jump.play()
	
	if is_on_floor() and !is_hurt:
		$AnimatedSprite2D.play("default")
	
	
	move_and_slide()
