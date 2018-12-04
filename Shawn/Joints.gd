extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var joints = []
var items = 0

var explosive_car = load("res://Traincar_Explosive.tscn")
var oil_car = load("res://Oilcar.tscn")
var cars = [oil_car, explosive_car]

onready var joint1 = get_node("Joint1")
onready var outer_parent = get_node("../")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for x in range(6):
		joints.append(get_node("Joint" + String(x + 1)))
		
	joint1.nodes.node_a = self


func add_powerup(type):
	var current_joint = joints[items]
	current_joint.joints
	
	if current_joint != joint1:
		current_joint.nodes.node_a = joints[items - 1].nodes.node_b
		
	var new_car_instance = cars[type]
	
	add_child_below_node(new_car_instance, outer_parent, true)
	var new_car = get_node("../../../" + newname)
	current_joint.nodes.node_b = new_car_path
	

func remove_powerup():
	for joint in joints:
		pass
	
func _shift_joint_nodes(j1, j2):
#	Moves the item stored in j2.b to j2.a and sets j2.a
	pass