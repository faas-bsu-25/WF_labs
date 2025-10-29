extends CharacterBody2D

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Area2D = $Hitbox
@onready var detect_area: Area2D = $DetectArea

var health = 40
var is_dead = false
var speed = 100

var player: Node = null
var is_chasing = false

func _ready():
	animator.play("idle")
	hitbox.connect("body_entered", Callable(self, "_on_Hitbox_body_entered"))
	detect_area.connect("body_entered", Callable(self, "_on_DetectArea_body_entered"))
	detect_area.connect("body_exited", Callable(self, "_on_DetectArea_body_exited"))


func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if is_chasing and player != null:
		chase_player()
	else:
		idle_stance()

	move_and_slide()


# ========== 追击逻辑 ==========
func chase_player():
	if player == null or is_dead:
		return

	animator.play("run")

	var dir = sign(player.global_position.x - global_position.x)
	velocity.x = dir * speed
	animator.flip_h = dir < 0


func idle_stance():
	animator.play("idle")
	velocity.x = move_toward(velocity.x, 0, 20)  # 站着不动


# ========== 受伤逻辑 ==========
func _on_Hitbox_body_entered(body):
	if body.is_in_group("player_attack"):
		take_damage(10)


func take_damage(amount: int):
	if is_dead:
		return
	health -= amount
	animator.play("hurt")
	print("Enemy took damage! Health =", health)

	if health <= 0:
		die()


func die():
	is_dead = true
	animator.play("death")
	velocity = Vector2.ZERO
	await animator.animation_finished
	queue_free()


# ========== 玩家检测 ==========
func _on_DetectArea_body_entered(body):
	if body.name == "Player":
		player = body
		is_chasing = true
		animator.play("attack")
		print("Enemy: detected player!")


func _on_DetectArea_body_exited(body):
	if body == player:
		player = null
		is_chasing = false
