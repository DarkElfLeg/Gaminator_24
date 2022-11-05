extends Node2D

func _ready():
	OS.set_window_maximized(true)
	var scene = load("res://Scenes/sBackAlley.tscn")
	var Level = scene.instance()
	add_child(Level)

func _in(Level):
	#print(Level)
	var scene = load(Level)
	var loaded = scene.instance()
	yield(get_tree().create_timer(2.0), "timeout")
	add_child(loaded)

func _out():
	for child in get_children():
		if child.has_method("_out"):
			child._out()
