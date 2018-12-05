extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Box_body_entered(body):
	print(body.name)
	if body is KinematicBody:# && body.name.begins_with("Player") == true:
		print(body.name)
		#body.PowerUpManager.AddPowerUp()
		get_parent().process_pickup(self)