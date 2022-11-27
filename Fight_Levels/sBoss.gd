extends Node2D

export var next_level = "res://Scenes/sDungeon.tscn"

func _ready():
	$AnimationPlayer.play("Go_in")
	# Это боевой уровень, поэтому спавним щит!
	#var scene = load("res://GameNodes/Shield.tscn")
	#var loaded = scene.instance()
	Singletone._fight()
	#add_child(loaded)
	

func _out():
	$AnimationPlayer.play("Go_out")
	Singletone._calm()
	yield(get_tree().create_timer(5.0), "timeout")
	#$"/root/Singletone"._in(next_level)
	queue_free()
