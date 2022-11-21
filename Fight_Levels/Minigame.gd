extends Node2D

export var List_of_spawn_nodes = ["res://Fight_Levels/Junk/Candy.tscn"]
export var next_level = "";
export var time_for_win = 20
export var time_for_spawn_delay = 30.0/60.0
var timer = 0.0
var timer1 = 0.0

func _ready():
	Singletone._clear_sweets()
	Singletone.is_in_minigame = true
	# В начале проверяем, что не получим лишних конфет...

func spawn_junk():
	if not Singletone.pause_mode:
		var rand_index:int = randi() % List_of_spawn_nodes.size()
		var junk = load(List_of_spawn_nodes[rand_index])
		var loaded = junk.instance()
		loaded.position.x = rand_range(100, 1820)
		loaded.position.y = rand_range(1180, 1280)
		$"/root/Game/Level".add_child(loaded)
	# Спавнить в нужном месте...
	#print(List_of_spawn_nodes[rand_index])
	#print(timer)
	
	pass

func _process(delta):
	if not Singletone.pause_mode:
		if(timer >= time_for_spawn_delay):
			timer -= time_for_spawn_delay
			spawn_junk()
		timer += delta
		timer1 += delta
		if(timer1 >= time_for_win):
			Singletone._in(next_level)
			Singletone.is_in_minigame = false
			Singletone._save_sweets()
			queue_free();
			pass #win!


