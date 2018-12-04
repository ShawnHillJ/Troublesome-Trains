extends PanelContainer

enum powerups {empty, oil, explosion, smokescreen}

func _ready():
	pass

func update_image(number):
	#NO SWITCH STATEMENTS IN GODOT?!
	if number == powerups.empty:
		#update image to empty
		pass
	elif number == powerups.oil:
		#update image to oil
		pass
	elif number == powerups.explosion:
		#update image to oil
		pass
	elif number == powerups.smokescreen:
		#update image to oil
		pass
	else:
		pass
