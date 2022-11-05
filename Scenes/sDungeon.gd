extends Node2D

func _ready():
	$AnimationPlayer.play("Go_in")
	yield(get_tree().create_timer(4.0), "timeout")

func _out():
	#print("Go out!")
	$AnimationPlayer.play("Go_out")
	yield(get_tree().create_timer(3.0), "timeout")
	queue_free()
