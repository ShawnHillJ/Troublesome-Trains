extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var lap_label = get_node("Lap")
onready var place_label = get_node("Place")
onready var items_buffer = get_node("Item Panel")


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func update_track_stats(update_list):
	lap_label.update_lap(2)
	place_label.update_place(1)
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
