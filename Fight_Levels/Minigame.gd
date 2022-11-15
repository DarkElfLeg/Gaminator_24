extends Node2D

export var List_of_spawn_nodes = ["res://Fight_Levels/Junk/Candy.tscn"]
export var next_level = "";
export var time_for_win = 20
export var time_for_spawn_delay = 30.0/60.0
var timer = 0.0
var timer1 = 0.0


func spawn_junk():
	var rand_index:int = randi() % List_of_spawn_nodes.size()
	var junk = load(List_of_spawn_nodes[rand_index])
	var loaded = junk.instance()
	loaded.position.x = rand_range(100, 1000)
	loaded.position.y = rand_range(1180, 1280)
	add_child(loaded)
	# Спавнить в нужном месте...
	#print(List_of_spawn_nodes[rand_index])
	#print(timer)
	
	pass

func _process(delta):
	if(timer >= time_for_spawn_delay):
		timer -= time_for_spawn_delay
		spawn_junk()
	timer += delta
	if(timer1 >= time_for_win):
		Singletone._in(next_level)
		queue_free();
		pass #win!


