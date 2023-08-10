extends RigidBody2D

var shooted: bool = false
var _speed: int = 850
var speed: int = _speed:
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
	randomize()
	shooted = true
	
	linear_velocity = Vector2([speed, -speed].pick_random(), 0)


func _physics_process(delta):
	if not shooted and Input.get_action_strength("shoot_ball"):
		shoot()
