extends CharacterBody2D


class_name Ball

signal bounce

@onready var game_manager: Node = %GameManager
@onready var timer: Timer = $Timer
@onready var audio_manager: Node = %AudioManager

const START_SPEED: float = 400
const ACCEL: float = 50
var speed: float

var direction := Vector2(1, 1)

var player_turn: int = 1: 
	get:
		return game_manager.player_turn

func _ready() -> void:
	reset()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		bounce.emit()
		direction = direction.bounce(collision.get_normal())
		var collision_object = collision.get_collider()
		
		if collision_object is Paddle:
			speed += ACCEL
			var dist = position.y - collision_object.position.y
			print(dist)
			direction = Vector2(direction.x, dist / (collision_object.paddle_height/2))


func _on_game_manager_scored() -> void:
	timer.start()


func _on_timer_timeout() -> void:
	reset()


func reset():
	speed = START_SPEED
	direction = Vector2(1 * -1 if player_turn == 1 else 1, 1).normalized()
	position = Vector2(0, randf_range(-1, 1) * get_viewport_rect().size.y/2)
