extends SpinBox

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var current_count = get_node("/root/Autoload").player_count

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	self.value = current_count

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_SpinBox_value_changed(value):
	print("is changed!")
	get_node("/root/Autoload").set_player_count(self.value)