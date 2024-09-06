extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var label = $Label

#idk what is going on 
#     https://www.youtube.com/watch?v=ajCraxGAeYU
#     link to the youtube video I followed
const BASE_TEXT = "[E] to "

var active_area = []
var can_interact = true

func register_area(area:IntereactionArea):
	active_area.push_back(area)

func unregisterd_area(area:IntereactionArea):
	var index = active_area.find(area)
	if index != -1:
		active_area.remove_at(index)

func _process(delta):
	if active_area.size()>0 && can_interact:
		active_area.sort_custom(sort_by_distance_to_player)
		label.text = BASE_TEXT + active_area[0].action_name
		label.global_position = active_area[0].global_position
		label.global_position.y -= 36
		label.global_position.x -= label.size.x /2
		label.show()
	else:
		label.hide()

func sort_by_distance_to_player(area1,area2):
	var area1_to_player= player.global_position.distance_to(area1.global_position)
	var area2_to_player= player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

func _input(event):
	if event.is_action_pressed("interact")&& can_interact:
		if active_area.size()>0:
			can_interact = false
			label.hide()
			
			await active_area[0].interact.call()
			
			can_interact = true
