extends Node2D

@onready var intereaction_area:IntereactionArea = $IntereactionArea
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	intereaction_area.interact = Callable(self,"_on_interact")

func _on_interact():
	pass
