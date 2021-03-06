extends KinematicBody2D

export (int) var speed = 100
export (float) var accel = 0.1

var motion = Vector2()

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)
	
	$Line2D.set_point_position(0, to_local(position))
	$Line2D.set_point_position(1, to_local(get_global_mouse_position()))

func _ready():
	$Line2D.add_point(Vector2())
	$Line2D.add_point(Vector2())

func update_motion(delta):
	
	
	
	var newPosition = get_global_mouse_position()
	var oldPosition = position
	

	motion = newPosition - oldPosition 
	
	if motion.length() > $Sprite.texture.get_width():
		look_at(get_global_mouse_position())
		motion = motion.normalized() * speed
	else:
		motion = motion * 0

	#debugLabel.text = "Length: " + str(motion.length()) + "\nX: " + str(motion.x) + "\nY: " + str(motion.y)
