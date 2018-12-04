extends Button

export(String) var scene_to_load
onready var sound_effect1 = get_node("../../../../Sound Control/Mouseover")
onready var sound_effect2 = get_node("../../../../Sound Control/Click")



func _on_StartGame_mouse_entered():
	sound_effect1.play() # replace with function body


func _on_OptionsButton_mouse_entered():
	sound_effect1.play()

func _on_Credits_mouse_entered():
	sound_effect1.play()

func _on_OptionsButton_pressed():
	sound_effect2.play()

func _on_StartGame_pressed():
	sound_effect2.play()

func _on_Credits_pressed():
	sound_effect2.play()



