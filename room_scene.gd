extends Node2D
var personTalking = 1
var fade_speed = 0.5
var fade_alpha = 1.0
var soundPlayed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Polygon2D.visible = false
	$Timer.start()
	$Polygon2D.get_child(0).dialogue = ["Huh?", "Where am I?"]
	$Polygon2D.get_child(2).text = "John"
	$Timer2.wait_time = $alarm.stream.get_length()
	$alarm.play()
	$Timer2.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		# Reduce the alpha value over time for fading effect
		fade_alpha -= fade_speed * delta
	   	 
			# Clamp alpha to stay within valid range (0.0 to 1.0)
		fade_alpha = clamp(fade_alpha, 0.0, 1.0)
			
			# Update text color by adjusting alpha with modulate
		$TextureRect.modulate = Color(1, 1, 1, fade_alpha)
		

func _on_timer_timeout():
	$Polygon2D.visible = true
	

func _on_timer_2_timeout():
	soundPlayed = true


func _on_button_pressed():
	print("hi") # Replace with function body.
