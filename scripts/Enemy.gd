extends KinematicBody2D

export (int) var speed = 100
export (float) var accel = 0.1
export (int) var nav_stop_threshold = 10
export (int) var max_speed = 700

var motion = Vector2()
var movTarget = null

onready var navigation = Global.navigation_east
onready var destination = Global.target_east

var path = []

func _ready():
	path.append(position)


func _process(delta):
	
	navigate(delta)

	move_and_slide(motion)


func navigate(delta):
	movTarget = path[0]
	var distance = position.distance_to(movTarget)

	if distance > nav_stop_threshold:
		update_motion(delta, movTarget)
	else:
		update_path()

func update_path():
	if path.size() > 1:
		path.remove(0)
	else:
		make_path()

func update_motion(delta, target):
	
	var newPosition = target
	var oldPosition = position
	
	motion = newPosition - oldPosition 
	
	if motion.length() > nav_stop_threshold:
		look_at(newPosition)
		#print(newPosition)
		motion = motion.normalized() * speed
	else:
		motion = motion * 0

	#debugLabel.text = "Length: " + str(motion.length()) + "\nX: " + str(motion.x) + "\nY: " + str(motion.y)


func move(position):
	movTarget = position
	
func make_path():
	path = navigation.get_simple_path(position, destination.global_position)
	pass