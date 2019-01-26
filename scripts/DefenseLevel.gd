extends Node2D

var selected_npc

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for guard in $Guards.get_children():
		guard.clickListener = self
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func npcClicked(npc):
	if selected_npc != null:
		selected_npc.isSelected = false
	selected_npc = npc
	npc.isSelected = true