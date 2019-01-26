extends KinematicBody2D

export (int) var speed = 100
export (float) var accel = 0.1

var motion = Vector2()


func _ready():
	
	$DebugLine.add_point(Vector2())
	$DebugLine.add_point(Vector2())


func _process(delta):
	
	update_motion(delta)
	move_and_slide(motion)
	
	$DebugLine.set_point_position(0, to_local(position))
	$DebugLine.set_point_position(1, to_local(get_global_mouse_position()))


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



func _on_ClickNPC_input_event(viewport, event, shape_idx):
	print(event)
	pass # replace with function body
