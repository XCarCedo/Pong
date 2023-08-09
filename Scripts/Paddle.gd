extends CharacterBody2D

enum PaddleSide{
	player1,
	player2,
}

@export var paddle_side: PaddleSide = PaddleSide.player1
@export var speed:int = 400
var paddle_textures: Dictionary = {
	PaddleSide.player1:preload("res://Assets/Game/paddleBlue.png"),
	PaddleSide.player2:preload("res://Assets/Game/paddleRed.png"),
}

func _ready():
	$Sprite2D.set_texture(paddle_textures[paddle_side])

func _physics_process(delta):
	if paddle_side == PaddleSide.player1:
		if Input.get_action_strength("p1_up"):
			velocity.y -= speed
		elif Input.get_action_strength("p1_down"):
			velocity.y += speed
	elif paddle_side == PaddleSide.player2:
		if Input.get_action_strength("p2_up"):
			velocity.y -= speed
		elif Input.get_action_strength("p2_down"):
			velocity.y += speed
	
	move_and_slide()
	velocity.y = 0
