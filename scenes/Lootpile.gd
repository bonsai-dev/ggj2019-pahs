extends Node2D

var grow_rate = 0.2

var size = 5


func _process(delta):
	grow(delta)
	
func grow(delta):
	size = size + grow_rate * delta
	
	$CollisionShape2D.set_scale(Vector2(size, size))
	
func steal(count):
	size = size - count



func _on_Lootpile_body_entered(body):
	steal(2)
	pass # replace with function body
