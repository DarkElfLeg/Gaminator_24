extends Node2D

export var next_level = "res://Scenes/sDungeon.tscn"

func _ready():
	$AnimationPlayer.play("Go_in")

func _out():
	$AnimationPlayer.play("Go_out")
	yield(get_tree().create_timer(5.0), "timeout")
	$"/root/Singletone"._in(next_level)
	queue_free()
