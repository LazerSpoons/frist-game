extends AnimationPlayer

var x = 0
var fade_speed = 1  # Adjust this value to control the fade speed.
var fade_alpha = 1.0   # Alpha starts fully opaque.
var click_sound = null  # Reference for click sound

# Called when the node enters the scene tree for the first time.
func _ready():
	$GAMEPLAYSWITCH.start()
	click_sound = $AudioStreamPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var total_characters = $blackscreen/optext.text.length()
	var visible_characters = $blackscreen/optext.get_visible_characters()
	if Input.is_action_pressed("SKI"):
				get_tree().change_scene_to_file("res://secondcutscene.tscn")
	if visible_characters < total_characters:
		if Time.get_ticks_msec() >= x + 100:
			if visible_characters < total_characters:
				var next_char = $blackscreen/optext.text[visible_characters]
				if next_char != " ":
					click_sound.play()  # Play the click sound

				# Reveal the next character
				$blackscreen/optext.set_visible_characters(visible_characters + 1)
				x = Time.get_ticks_msec()
	else:
		# Reduce the alpha value over time for fading effect
		fade_alpha -= fade_speed * delta
   	 
		# Clamp alpha to stay within valid range (0.0 to 1.0)
		fade_alpha = clamp(fade_alpha, 0.0, 1.0)

		# Update text color by adjusting alpha with modulate
		$blackscreen/optext.modulate = Color(1, 1, 1, fade_alpha)
		

func _on_gameplayswitch_timeout():
		get_tree().change_scene_to_file("res://secondcutscene.tscn")
