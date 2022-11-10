extends Node2D

export var first_level = "res://Scenes/Cat_Scene.tscn"

func _ready():
	OS.set_window_maximized(true)
	#OS.set_window_maximized(false)
	#OS.set_window_size(Vector2(800,450))# Потом просто удалю. 
	#Для работы и отладки это удобнее!
	OS.set_window_title("Mouse Trap") 
	var scene = load(first_level)
	var Level = scene.instance()
	add_child(Level)

func _in(Level):
	#print(Level)
	var scene = load(Level)
	var loaded = scene.instance()
	yield(get_tree().create_timer(2.0), "timeout")
	print("instance")
	print(Level)
	if Level=="res://Scenes/sHome.tscn":
		var n = $"/root/Game/Level".get_child_count()
		if n>1:
			var n1=0;
			for child in $"/root/Game/Level".get_children():
				if n1>0:
					child.queue_free()
				n1+=n1
	add_child(loaded)

func _out():
	for child in get_children():
		if child.has_method("_out"):
			child._out()
