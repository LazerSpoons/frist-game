extends RichTextLabel
var dialogue = ["hi","bye"]
var page = 0	
var firstSpace = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible_characters(0)
	$"../Timer2".start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if  Input.is_action_pressed("SKI"):
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				text = dialogue[page]
				set_visible_characters(0)
	set_visible_characters(get_visible_characters()+1)	



func _on_timer_timeout():
	pass


func _on_timer_2_timeout():
	text = dialogue[page]
	$"../Timer".start()
