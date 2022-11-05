extends Node2D

func _ready():
	$AnimationPlayer.play("Go_in")
	yield(get_tree().create_timer(4.0), "timeout")
	var exit = get_tree().get_root().find_node("Exit",true,false)
	exit.connectw("get_out",self, "_out")

func _out():
	print("Go out!")
	$AnimationPlayer.play("Go_out")
	yield(get_tree().create_timer(3.0), "timeout")
	var exit = get_tree().get_root().find_node("Level",true,false)
	queue_free()
