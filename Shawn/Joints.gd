extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var joints = []
var items = 0

var explosive_car = load("res://Traincar_Explosive.tscn")
var oil_car = load("res://Oilcar.tscn")
var cars = [oil_car, explosive_car]
var powerups = []

onready var joint1 = get_node("Joint1")
onready var outer_parent = get_node("../")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	joint1.set_node_a(get_path())


func add_powerup(type):
	var current_joint = joint1
	if items != 0:
		current_joint = joints[items - 1]
		
	var new_car_instance = cars[type].instance()
	var newname = "powerup" + String(items)
	new_car_instance.set_name(newname)
	add_child_below_node(new_car_instance, outer_parent)
	var new_car_path = get_node("../../../" + newname)
	
	if current_joint == joint1:
		current_joint.set_node_a()
		return
		
		
		
	
	
	current_joint.nodes.node_b = new_car_path
	

func remove_powerup():
	for joint in joints:
		pass
	
func _shift_joint_nodes(j1, j2):
#	Moves the item stored in j2.b to j2.a and sets j2.a
	pass