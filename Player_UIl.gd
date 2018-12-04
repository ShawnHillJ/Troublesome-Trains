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
	
func update_items_panel(poweruparray):
	$"Items Panel/Main Item".update_image(poweruparray[0])
	$"Items Panel/Item2".update_image(poweruparray[1])
	$"Items Panel/Item3".update_image(poweruparray[2])
	$"Items Panel/Item4".update_image(poweruparray[3])
	$"Items Panel/Item5".update_image(poweruparray[4])
	$"Items Panel/Item6".update_image(poweruparray[5])

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
