extends CharacterBody2D

signal enemy_died
signal health_changed

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@onready var detect_area: Area2D = $DetectArea       
@onready var hitbox: Area2D = $Hitbox               

var health: int = 100 
var is_dead: bool = false
var is_attacking: bool = false
var player: Node = null
var max_health = 100

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
	if body.is_in_group("Player"):
		body.take_damage(20)
		print("Enemy hit player!")
		hitbox.monitoring = false
		await get_tree().create_timer(0.05).timeout
		hitbox.monitoring = true

func take_damage(amount: int) -> void:
	if is_dead:
		return
	health -= amount
	print("Enemy took damage! Health =", health)
	health_changed.emit()
	if health <= 0:
		die()

func die() -> void:
	is_dead = true
	animator.play("death")
	emit_signal("enemy_died") 
	queue_free()
