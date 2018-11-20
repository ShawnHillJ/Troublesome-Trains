extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var raycast = get_node("RayCast")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	if Input.is_action_just_pressed("X"):
		var collided = raycast.get_collider()
		var normal = raycast.get_collision_normal()
		if collided != null:
			print(collided.get_name())
			print("Normal:", normal)
			var angle_x = rad2deg(atan2(normal.y, normal.z))
			var angle_y = rad2deg(atan2(normal.x, normal.z))
			var angle_z = rad2deg(atan2(normal.x, normal.y))
			var tupled = [angle_x, angle_y, angle_z]
			print("Angle:", tupled)
        
		