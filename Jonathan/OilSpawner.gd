extends KinematicBody

#Will spawn oil using set parameters and then delete itself from scene

var oilamount = 10 #number of oil blobs spawned
var oilcounter = 0.3 #rate of oil spawning, or how far apart oil is spaced from each other.
var oiljumpheight = 3 #initial oil vertical speed in spawning effect

onready var OilBlobAsset = preload("res://Jonathan/OilBlob.tscn") #change path in final product?


func _process(delta):
	if oilamount > 0:
		oilcounter -= delta
		if (oilcounter <= 0):
			oilcounter = 0.3
			var OilBlob = OilBlobAsset.instance()
			get_tree().get_root().add_child(OilBlob)
			OilBlob.global_transform.origin = global_transform.origin
			OilBlob.velocity.y = oiljumpheight;
			oilamount -= 1
	else:
		queue_free()