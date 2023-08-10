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
	linear_velocity.x = [speed, -speed].pick_random()
	
	var sub_dir = ["up", "left"].pick_random()
	# If ball is going to left
	if linear_velocity.x < 0:
		if sub_dir == "up":
			linear_velocity = linear_velocity.rotated(deg_to_rad(randf_range(0.0, 45.0)))
		else:
			linear_velocity = linear_velocity.rotated(deg_to_rad(randf_range(315.0,360.0)))
	else:
		if sub_dir == "up":
			linear_velocity = linear_velocity.rotated(deg_to_rad(randf_range(90.0, 180.0)))
		else:
			linear_velocity = linear_velocity.rotated(deg_to_rad(randf_range(180.0, 270.0)))


func _physics_process(delta):
	if not shooted and Input.get_action_strength("shoot_ball"):
		shoot()
