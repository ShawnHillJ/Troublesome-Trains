extends Area

var lifetirme = 5

func _process(delta):
	lifetime -= delta
	if (lifetime <= 0):
		queue_free()