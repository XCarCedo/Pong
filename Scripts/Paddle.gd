extends StaticBody2D
class_name Paddle

enum PaddleSide{
	player1,
	player2,
}

@export var win_area: Area2D
@export var paddle_side: PaddleSide = PaddleSide.player1
@export var speed:int = 10
var score: int = 0
var paddle_textures: Dictionary = {
	PaddleSide.player1:preload("res://Assets/Game/paddleBlue.png"),
	PaddleSide.player2:preload("res://Assets/Game/paddleRed.png"),
}
var ball_scene: PackedScene = load("res://Scenes/Ball.tscn")

func _ready():
	if win_area:
		win_area.connect("body_exited", _on_body_exited_win_area)
	$Sprite2D.set_texture(paddle_textures[paddle_side])

func _physics_process(delta):
	if paddle_side == PaddleSide.player1:
		if Input.get_action_strength("p1_up"):
			position.y -= speed
		elif Input.get_action_strength("p1_down"):
			position.y += speed
	elif paddle_side == PaddleSide.player2:
		if Input.get_action_strength("p2_up"):
			position.y -= speed
		elif Input.get_action_strength("p2_down"):
			position.y += speed
	

func _on_body_exited_win_area(body: PhysicsBody2D):
	if "ball" in body.get_groups():
		score += 1
		body.queue_free()
		var ball_ins = ball_scene.instantiate()
		get_tree().get_first_node_in_group("game").call_deferred("add_child", ball_ins)
