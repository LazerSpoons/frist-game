
extends Control
var personTalking = 1
var fade_speed = 0.5
var fade_alpha = 1.0
var nameSaid = false
var mcPages = [0,1,2,4]
var chronoPages = [3,5,6]
# Called when the node enters the scene tree for the first time.
func _ready():
	$Polygon2D.visible = false
	$Timer.start()
	$Polygon2D.get_child(0).dialogue = ["Huh?",
	 "Where am I?",
	 "I swear I was just in my room, until I touched that time machine..", 
	"Nowhere and everywhere.",
	"The space between time where the past, present and future intersect.",
	 "What? Wait, who are you?",
	 "Greetings, I am S-T-E-V-E.",
	"S.T.E.V.E. Your Space Time Exploration Vehicle Envoy", 
	"You seem to have stumbled upon my artifact.",
	"How do I go back?",
	"Thats the problem.... lets take a look at the machine",
	"As you can See, It's out of charge",
	"So, am I stuck here?",
	"Not exactly...by completing the built in game you can partially charge it.",
	"Great! So I just have to do that?",
	"Hold your horses.I did say partially",
	"?",
	"While I can control where you go, it will still bring you to the past, where you'll have to locate the machine and repeat til you can come back safely",
	"how can I find the time machine?",
	"u got this",
	"??",
	"Alr.. lets press charge and see what he was talking about",
	"A Rhythm game? I'm lowk goated at this so...",
	"we ball"
		
	]
	$Polygon2D.get_child(2).text = "You"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		# Reduce the alpha value over time for fading effect
		fade_alpha -= fade_speed * delta
   	 	
		# Clamp alpha to stay within valid range (0.0 to 1.0)
		fade_alpha = clamp(fade_alpha, 0.0, 1.0)
		
		if $Polygon2D.get_child(0).page in mcPages:
			personTalking = 1
			$Polygon2D.get_child(2).text = "You"
		else:
			personTalking = 2
		if $Polygon2D.get_child(0).page > 5:
			nameSaid = true
		# Update text color by adjusting alpha with modulate
		$TextureRect.modulate = Color(1, 1, 1, fade_alpha) 
		if personTalking == 1:
			$Sprite2D.visible = false
			$Polygon2D/Sprite2D.visible = true
		if personTalking == 2:
			$Sprite2D.visible = true
			$Polygon2D/Sprite2D.visible = false
			if not nameSaid and personTalking == 2:
				$Polygon2D.get_child(2).text = "???"	
			elif nameSaid and personTalking == 2:
				$Polygon2D.get_child(2).text = "S.T.E.V.E"
		if len($Polygon2D.get_child(2).text) > 8:
			$Polygon2D.get_child(2).push_font_size(20) 
		if $Polygon2D.get_child(0).page >= 9:
			$timeMachine.visible = true




func _on_timer_timeout():
	$Polygon2D.visible = true
