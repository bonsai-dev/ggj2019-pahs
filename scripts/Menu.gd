extends Control

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _on_TextureButton_pressed(sceneName):
	match sceneName:
		"level1":
			get_tree().change_scene("res://HelloWorld.tscn")
		"level2":
			get_tree().change_scene("res://scenes/Defense.tscn")
