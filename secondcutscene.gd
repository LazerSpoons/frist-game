
extends Control
var personTalking = 1
var fade_speed = 0.5
var fade_alpha = 1.0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Polygon2D.visible = false
	$Timer.start()
	$Polygon2D.get_child(0).dialogue = ["Huh?", "Where am I?", "Huh? What do you mean, sir Ceaser?", "Oh right, im tryna conquer gaul (aka france)"]
	$Polygon2D.get_child(2).text = "Ceaser"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		# Reduce the alpha value over time for fading effect
		fade_alpha -= fade_speed * delta
   	 
		# Clamp alpha to stay within valid range (0.0 to 1.0)
		fade_alpha = clamp(fade_alpha, 0.0, 1.0)
		
		if $Polygon2D.get_child(0).page < 2 or $Polygon2D.get_child(0).page == 4 :
			personTalking = 1
		else:
			personTalking = 2
		# Update text color by adjusting alpha with modulate
		$TextureRect.modulate = Color(1, 1, 1, fade_alpha)
		if personTalking == 1:
			$Sprite2D.visible = false
			$Polygon2D/Sprite2D.visible = true
		if personTalking == 2:
			$Sprite2D.visible = true
			$Polygon2D/Sprite2D.visible = false
			
			$Polygon2D.get_child(2).text = "Roman Soldier"	
		
		if len($Polygon2D.get_child(2).text) > 8:
			$Polygon2D.get_child(2).push_font_size(20)
			print("hi")  


func _on_timer_timeout():
	$Polygon2D.visible = true
