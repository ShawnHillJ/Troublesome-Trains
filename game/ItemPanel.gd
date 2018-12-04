extends CenterContainer

enum powerups {empty, oil, explosion, smokescreen}

func _ready():
	pass

func update_image(number):
	#NO SWITCH STATEMENTS IN GODOT?!
	if number == powerups.empty:
		$TextureRect.texture = get_parent().TextureEmpty
		pass
	elif number == powerups.oil:
		$TextureRect.texture = get_parent().TextureOil
		pass
	elif number == powerups.explosion:
		$TextureRect.texture = get_parent().TextureExplosion
		pass
	elif number == powerups.smokescreen:
		$TextureRect.texture = get_parent().TextureSmokescreen
		pass
	else:
		pass
