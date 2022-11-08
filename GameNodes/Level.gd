extends Node2D

func _ready():
	OS.set_window_maximized(false)
	OS.set_window_size(Vector2(800,450))# Потом просто удалю. 
	#Для работы и отладки это удобнее!
	OS.set_window_title("Mouse Trap") 
	var scene = load("res://Scenes/Cat_Scene.tscn")
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
