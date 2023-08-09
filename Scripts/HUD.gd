extends Control

@export var player1: Paddle
@export var player2: Paddle
@export var player1_score_text: String = "Score: {}"
@export var player2_score_text: String = "Score: {}"

func _process(_delta: float) -> void:
	$P1Score.text = player1_score_text.format([player1.score], "{}")
	$P2Score.text = player2_score_text.format([player2.score], "{}")
