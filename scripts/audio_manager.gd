extends Node

@onready var bounce: AudioStreamPlayer2D = $Bounce
@onready var score: AudioStreamPlayer2D = $Score



func _on_ball_bounce() -> void:
	bounce.play()


func _on_game_manager_scored() -> void:
	score.play()
