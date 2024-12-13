extends Node2D
var red = Color(1.0,0.0,0.0,1.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$damageIndicator.get_child(0).text = "miss"
	$damageIndicator.get_child(0).set("theme_override_colors/font_color",red)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
