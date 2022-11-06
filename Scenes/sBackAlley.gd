extends Node2D

func _ready():
	$AnimationPlayer.play("Go_in")

func _out():
	$AnimationPlayer.play("Go_out")
	yield(get_tree().create_timer(3.0), "timeout")
	queue_free()
