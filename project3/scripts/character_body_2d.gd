extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -700.0
const CLIMB_SPEED = 120.0

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_area: Area2D = $AttackArea2D
@onready var jump_sound: AudioStreamPlayer2D = $jump
@onready var attack_sound: AudioStreamPlayer2D = $attack

var on_ladder = false 
var is_climbing = false
var is_attacking = false

func _physics_process(delta: float) -> void:
	
	if on_ladder:
		velocity.y = 0
		if Input.is_action_pressed("up"):
			velocity.y = -CLIMB_SPEED
			is_climbing = true
		elif Input.is_action_pressed("down"):
			velocity.y = CLIMB_SPEED
			is_climbing = true
		else:
			velocity.y = 0
			is_climbing = false
			animator.play("idle")
	else:
		if not is_on_floor():
			velocity += get_gravity() * delta

	# attacking so no moving
	if is_attacking:
		move_and_slide()
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
	
	if Input.is_action_just_pressed("attack"):
		start_attack()
		return
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		animator.flip_h = direction < 0

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if is_on_floor():
		if direction:
			animator.play("run")
		else:
			animator.play("idle")
	else:
		animator.play("jump")
		
	move_and_slide()
	
func start_attack():
	is_attacking = true
	velocity.x = 0
	animator.play("attack")
	attack_sound.play() 
	attack_area.monitoring = true
	
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if animator.animation == "attack":
		is_attacking = false
		attack_area.monitoring = false
	
func _on_attack_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.take_damage(10)
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.on_ladder = true


func _on_area_2d_body_exited(body: Node2D) -> void:

	if body.name == "Player":
		body.on_ladder = false
