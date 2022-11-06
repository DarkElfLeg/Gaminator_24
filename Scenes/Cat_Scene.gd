extends Node2D

export var dialog_file = "timeline-1667759428.json"

func _ready():
	Singletone.Glob_pause = true
	var new_dialog = Dialogic.start(dialog_file)
	add_child(new_dialog)
	yield(new_dialog,"tree_exited")
	Singletone.Glob_pause = false

func _out():
	$AnimationPlayer.play("Go_out")
	yield(get_tree().create_timer(3.0), "timeout")
	queue_free()

func _intro_cat():
	$AnimationPlayer.play("Go_in")

