extends Node2D
var orientation = 1
var random = RandomNumberGenerator.new()
var lastOrientation
var x = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()
	
	lastOrientation = set_orientation()
	if orientation == 1:
		$fallingarrow.rotation_degrees = 90
		
	if orientation == 3:
		$fallingarrow.rotation_degrees = 180
		
	if orientation == 4:
		$fallingarrow.rotation_degrees = 270
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 5
func get_orientation():
	return orientation
func set_orientation():
	x = random.randi_range(1,4)
	
	if x != lastOrientation:
		orientation = x
		return orientation
	set_orientation()
	
	
