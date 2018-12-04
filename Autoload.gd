extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var volume = 1.0
var player_count = 1
var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func set_vol(vol):
	volume = vol
	
func set_player_count(count):
	player_count = count