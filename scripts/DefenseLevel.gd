extends Node2D

var selected_npc

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$ClickNPC.clickListener = self
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func npcClicked(npc):
	selected_npc = npc
	print("npc is set")
	npc.isSelected = true