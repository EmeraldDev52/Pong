extends Node


@onready var score_1: Label = $"../Score/score1"
@onready var score_2: Label = $"../Score/score2"





var player1_score: int = 0
var player2_score: int = 0

var player_turn: int = 1

signal scored

func score(player: int):
	if player == 1:
		player1_score += 1
		score_1.text = str(player1_score)
	else:
		player2_score += 1
		score_2.text = str(player2_score)
		
	scored.emit()


func _on_player_1_body_entered(body: Node2D) -> void:
	score(2)
	player_turn = 1


func _on_player_2_body_entered(body: Node2D) -> void:
	score(1)
	player_turn = 2
