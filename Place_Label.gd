extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var places = ["1st", "2nd", "3rd", "4th"]

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func update_place(place):
	if place <= 0 or place > 4:
		return
	self.text = places[place]

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
