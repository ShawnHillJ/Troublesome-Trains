extends Area

var lifetime = 15;		#oil lasts for 3 seconds
var grav = -12;
var velocity = Vector3();
var base = 1; 			#base scale
var growth = 0.7;		#growth multiplier


func _process(delta):

	if (lifetime > 12):
		var size = base + (15-lifetime)*growth
		set_scale(Vector3(size, 1, size))

	lifetime -= delta
	if (lifetime <= 0):

		queue_free()
		#print("OIL DESPAWNED")

func _on_Area_body_entered(body):
#	print(body.name)
	if body is KinematicBody && body.name.begins_with("Player") == true:
		body.get_child(3).apply_oil()
#
#