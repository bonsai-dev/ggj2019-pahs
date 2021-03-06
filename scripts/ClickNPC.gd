extends KinematicBody2D

export (int) var speed = 100
export (float) var accel = 0.1

var motion = Vector2()
var clickListener
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
		$Sprite.look_at(target)
		$CollisionShape2D.look_at(target)
		motion = motion.normalized() * speed
	else:
		motion = motion * 0

	#debugLabel.text = "Length: " + str(motion.length()) + "\nX: " + str(motion.x) + "\nY: " + str(motion.y)


func _on_ClickNPC_input_event(viewport, event, shape_idx):
	#get_parent().selected_npc = self
	if clickListener != null and event is InputEventMouseButton and not event.is_pressed():
		clickListener.npcClicked(self)
		
func deselectNpc():
	isSelected = false
	
func _input(event):
	if isSelected and event is InputEventMouseButton and event.is_pressed():
		if event.button_index == BUTTON_RIGHT:
			movTarget = event.position
		if event.button_index == BUTTON_LEFT and position.distance_to(event.position) > 15:
			deselectNpc()