extends CharacterBody2D

enum PaddleSide{
	player1,
	player2,
}

@export var paddle_side: PaddleSide = PaddleSide.player1
var paddle_textures: Dictionary = {
	PaddleSide.player1:preload("res://Assets/Game/paddleBlue.png"),
	PaddleSide.player2:preload("res://Assets/Game/paddleRed.png"),
}


func _ready():
	$Sprite2D.set_texture(paddle_textures[paddle_side])
