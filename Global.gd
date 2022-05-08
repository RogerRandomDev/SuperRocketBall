extends Node

func playSound(soundName):
	var s=AudioStreamPlayer.new()
	s.stream=load("res://audio/%s.wav"%soundName)
	s.volume_db=-20
	add_child(s)
	s.play()
	s.connect("finished",endSound,[s])

func endSound(s):
	s.queue_free()
	s.disconnect("finished",endSound)
	
