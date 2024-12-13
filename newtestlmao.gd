extends Node


# Called when the node enters the scene tree for the first time.

func _ready():
	$MidiPlayer.note.connect(_on_midi_player_note)
	$MidiPlayer.play()
	






func _on_midi_player_note(event,track):
		if (event['subtype'] == MIDI_MESSAGE_NOTE_ON): # note on
			print("hi")

			


func _on_midi_player_finixshed():
	print("done")
