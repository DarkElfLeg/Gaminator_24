extends Node2D

func _ready():
	var scene = load("res://Scenes/sBackAlley.tscn")
	var Level = scene.instance()
	add_child(Level)
	var exit = get_tree().get_root().find_node("Exit",true,false)
	exit.connect("get_in",self, "_in")

func _in(Level):
	print("Change LEVEL!")
	print(Level)
	var scene = load(Level)
	yield(get_tree().create_timer(3.0), "timeout") # Ждать конца анимации
	var loaded = scene.instance()
	add_child(loaded)
	yield(get_tree().create_timer(4.0), "timeout") # Ждать конца анимации
	var exit = get_tree().get_root().find_node("Exit",true,false)
	exit.connect("get_in",self, "_in")
	
