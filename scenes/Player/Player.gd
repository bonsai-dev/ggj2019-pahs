extends KinematicBody2D

export (int) var speed = 100
export (float) var accel = 0.1

var motion = Vector2()
onready var debugLabel = get_node("DebugLabel")
onready var debugLine = get_node("Line2D")

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)
	
	debugLine.set_point_position(0, to_local(position))
	debugLine.set_point_position(1, to_local(get_global_mouse_position()))

func _ready():
	debugLine.add_point(Vector2())
	debugLine.add_point(Vector2())

func update_motion(delta):
	
	look_at(get_global_mouse_position())
	
	var newPosition = get_global_mouse_position()
	var oldPosition = position
	
	#motion = newPosition.distance_to(oldPosition)
	motion = newPosition - oldPosition 
	
	motion = motion.normalized() * speed

	#debugLabel.text = "Length: " + str(motion.length()) + "\nX: " + str(motion.x) + "\nY: " + str(motion.y)
