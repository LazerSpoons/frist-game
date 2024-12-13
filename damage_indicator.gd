extends Node2D
var pos
var hit = true
var red = Color(1.0,0.0,0.0,1.0)
# Called when the node enters the scene tree for the first time.
func _ready():
	if pos == 1:
		position.x = 100
		position.y = 304
	if pos == 2:
		position.x = 300
		position.y = 304
	if pos == 3:
		position.x = 500
		position.y = 304
	if pos == 4:
		position.x = 800
		position.y = 304
	if not hit:
		$Label.text = "miss"
		$Label.set("theme_override_colors/font_color",red)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
