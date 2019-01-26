extends KinematicBody2D

export (int) var speed = 100
export (float) var accel = 0.1

var motion = Vector2()
var isSelected = false
var movTarget = null


func _ready():
	
	$DebugLine.add_point(Vector2())
	$DebugLine.add_point(Vector2())


func _process(delta):
	#var target = get_global_mouse_position();
	var target = position
	if movTarget != null:
		target = movTarget
	update_motion(delta, target)
	move_and_slide(motion)
	
	if motion.length() == 0:
		movTarget = null
	
	$DebugLine.set_point_position(0, to_local(position))
	$DebugLine.set_point_position(1, to_local(get_global_mouse_position()))

	$DebugLine.visible = isSelected


func update_motion(delta, target):
	
	var newPosition = target
	var oldPosition = position
	
	motion = newPosition - oldPosition 
	
	if motion.length() > $Sprite.texture.get_width():
		look_at(target)
		motion = motion.normalized() * speed
	else:
		motion = motion * 0

	#debugLabel.text = "Length: " + str(motion.length()) + "\nX: " + str(motion.x) + "\nY: " + str(motion.y)


func move(position):
	movTarget = position