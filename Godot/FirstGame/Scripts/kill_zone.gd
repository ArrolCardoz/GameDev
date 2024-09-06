extends Area2D

@onready var timer = $Timer
@onready var die = $Die

func _on_body_entered(body):
	die.play()
	print("You Died!") 
	timer.start()
	Engine.time_scale= 0.75
	body.get_node("CollisionShape2D").queue_free()



func _on_timer_timeout():
	get_tree().reload_current_scene()
	Engine.time_scale= 1
	
	
