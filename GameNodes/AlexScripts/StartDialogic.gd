extends Node

export var dialogueOnStart = "sStart"

func _ready():
	var new_dialog = Dialogic.start(dialogueOnStart)
	add_child(new_dialog)
	Singletone.Glob_pause = true
	yield(new_dialog,"tree_exited")
	Singletone.Glob_pause = false
