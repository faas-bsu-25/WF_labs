extends CharacterBody2D

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@onready var detect_area: Area2D = $DetectArea       
@onready var hitbox: Area2D = $Hitbox               

var health: int = 100 
var is_dead: bool = false
var is_attacking: bool = false
var player: Node = null

func _ready() -> void:
	animator.play("idle") 
	
	detect_area.body_entered.connect(_on_detect_area_body_entered)
	detect_area.body_exited.connect(_on_detect_area_body_exited)
	hitbox.body_entered.connect(_on_hitbox_body_entered)
	
func _physics_process(delta: float) -> void:
	if is_dead:
		return
	
	if is_attacking == false and player != null:
		start_attack()

func start_attack() -> void:
	is_attacking = true
	animator.play("attack")
	print("Enemy attacking player")
	await animator.animation_finished
	
	is_attacking = false
	
	if player != null and not is_dead:
		start_attack()
	
func _on_detect_area_body_entered(body: Node) -> void:
	if body.name == "Player":
		player = body
		print("Enemy detected player!")

func _on_detect_area_body_exited(body: Node) -> void:
	if body == player:
		player = null
		print("Enemy lost player!")
		animator.play("idle")

func _on_hitbox_body_entered(body: Node) -> void:
	if body.name == "Player":
		if body.has_method("take_damage"):
			body.take_damage(10)
			print("Enemy hit player!")

func take_damage(amount: int) -> void:
	if is_dead:
		return
	health -= amount
	print("Enemy took damage! Health =", health)
	if health <= 0:
		die()

func die() -> void:
	is_dead = true
	animator.play("death")
	queue_free()
