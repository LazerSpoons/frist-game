extends Control
var isOverFrance = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isOverFrance:
		$TextureRect/france.visible = true
	elif !isOverFrance:
		$TextureRect/france.visible = false


func _on_button_pressed():
	$click.play()
	$soundtimer2.wait_time = $click.stream.get_length() - .1
	$soundtimer2.start()




func _on_button_mouse_entered():
	isOverFrance = true


func _on_button_mouse_exited():
	isOverFrance = false


func _on_soundtimer_2_timeout():
	get_tree().change_scene_to_file("res://room_scene.tscn")
