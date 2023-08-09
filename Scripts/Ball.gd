extends RigidBody2D

var shooted: bool = false
var _speed: int = 500
var speed: int = 500:
	get:
		return _speed
	set(value):
		linear_velocity.x = speed
		_speed = value

func _ready():
	reset_stats()

func reset_stats():
	linear_velocity = Vector2.ZERO
	global_position = get_viewport_rect().size / 2
	shooted = false

func shoot():
	shooted = true
	linear_velocity.x = [speed, -speed].pick_random()

func _physics_process(delta):
	if not shooted and Input.get_action_strength("shoot_ball"):
		shoot()
