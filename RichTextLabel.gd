extends RichTextLabel

var white = false
var wite = Color(255.0,255.0,255.0)
var black = Color(0,0,0)
var change_color_time = 0.5  
var timer = 0.0


func _ready():
	pass 


func _process(delta):
	timer -= delta
	if timer <= 0.0:
		if white:
			set("theme_override_colors/default_color", black)
			white = false
		else:
			set("theme_override_colors/default_color", wite)
			white = true
		timer = change_color_time  

