extends Node2D

var action = 0
var temp = null  # Store the reference to the sprite.
var ArrowScene = preload("res://arrow.tscn")
var firstNotePassed = false  # To track if the first note has been processed.
var inLeft = false
var inMidLeft = false
var inMidRight = false
var inRight = false
var score = 0
var tL = null
var tML = null
var tMR = null
var tR = null
var temp1 = null
var hitIndicator = preload("res://damage_indicator.tscn")
var missedNote = preload("res://missIndicator.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Desync.start()

	# Connect signals for entering and exiting bodies for each Area2D
	$Left2D.body_entered.connect(Callable(self, "_on_left2d_entered"))
	$Left2D.body_exited.connect(Callable(self, "_on_left2d_exited"))
	
	$MidLeft2D.body_entered.connect(Callable(self, "_on_midleft2d_entered"))
	$MidLeft2D.body_exited.connect(Callable(self, "_on_midleft2d_exited"))
	
	$MidRight2D.body_entered.connect(Callable(self, "_on_midright2d_entered"))
	$MidRight2D.body_exited.connect(Callable(self, "_on_midright2d_exited"))
	
	$Right2D.body_entered.connect(Callable(self, "_on_right2d_entered"))
	$Right2D.body_exited.connect(Callable(self, "_on_right2d_exited"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  Input.is_action_just_pressed("left"):
		print(inLeft)
		if inLeft:
			score += 1
			$scoreBox.text = "Score: " + str(score)
			tL.queue_free()
		inLeft = false
	if  Input.is_action_just_pressed("right"):
		print(inRight)
		if inRight:
			score += 1
			$scoreBox.text = "Score: " + str(score)
			tR.queue_free()
		inRight = false
	if  Input.is_action_just_pressed("down"):
		print(inMidLeft)
		if inMidLeft:
			score += 1
			$scoreBox.text = "Score: " + str(score)
			tML.queue_free()
		inMidLeft = false
	if  Input.is_action_just_pressed("up"):
		print(inMidRight)
		if inMidRight:
			temp1 = hitIndicator.instantiate()
			add_child(temp1)
			temp1.pos = 3
			score += 1
			$scoreBox.text = "Score: " + str(score)
			tMR.queue_free()
		inMidRight = false

var midi_event_count = 0  # Counter to track every MIDI event

func _on_midi_player_midi_event(channel, event):
	if event.type == 144:
		# Increment the event counter
		midi_event_count += 1
		
		# Only spawn an arrow on every other event (when count is even)
		temp = ArrowScene.instantiate()  # Instance the Arrow scene.
		add_child(temp)  # Add the Arrow instance to the scene tree.
		
			
			# Adjust position based on orientation
		if temp.get_orientation() == 1:
			temp.get_child(0).position.x -= 150
		elif temp.get_orientation() == 3:
			temp.get_child(0).position.x += 150
		elif temp.get_orientation() == 4:
			temp.get_child(0).position.x += 300


# Detection functions for each Area2D - Enter
func _on_left2d_entered(body):
	$endiingztimer.start()
	tL = body
	inLeft = true
	

func _on_midleft2d_entered(body):
	$endiingztimer.start()
	tML = body
	inMidLeft = true
	

func _on_midright2d_entered(body):
	$endiingztimer.start()
	tMR = body
	inMidRight = true
	

func _on_right2d_entered(body):
	$endiingztimer.start()
	tR = body
	inRight = true
	

# Detection functions for each Area2D - Exit (Delete the body)
func _on_left2d_exited(body):
	inLeft = false
	body.get_parent().queue_free()

func _on_midleft2d_exited(body):
	inMidLeft = false
	
	body.get_parent().queue_free()

func _on_midright2d_exited(body):
	inMidRight = false
	
	body.get_parent().queue_free()

func _on_right2d_exited(body):
	
	if inRight:
		temp1 = missedNote.instantiate()
		add_child(temp1)
		temp1.get_child(0).pos = 4
	inRight = false
	body.get_parent().queue_free()

func _on_desync_timeout():
	$song.play()


func _on_midi_player_finished():
	print("done")


func _on_endiingztimer_timeout():
	print("done")
