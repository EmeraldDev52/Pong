extends StaticBody2D

class_name Paddle

var movement_speed: float = 600.0

@export var move_up_key: String
@export var move_down_key: String

@onready var hitbox: CollisionShape2D = $CollisionShape2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


var velocity: float = 0

var paddle_height

func _ready() -> void:
	paddle_height = collision_shape_2d.shape.get_rect().size.y


func _physics_process(delta: float) -> void:
	var direction: float = Input.get_action_strength(move_down_key) - Input.get_action_strength(move_up_key)
	velocity = direction * movement_speed
	
	position.y += velocity * delta
	
	position.y = clamp(position.y, -get_viewport_rect().size.y/2 + (hitbox.shape.get_rect().size.y / 2), get_viewport_rect().size.y/2 - (hitbox.shape.get_rect().size.y / 2))
