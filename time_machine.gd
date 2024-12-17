extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	pass


func _on_button_pressed():
	$geoDash.self_modulate = Color(1,1,1,255)
	$Battery.self_modulate = Color(1,1,1,0)
	$Button.visible = false
	$Button2.visible = true

func _on_button_2_pressed():
	print("hi")
