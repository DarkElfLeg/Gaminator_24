extends Node

export var isOnceOnProcess = false
export var dialogueOnStart = "sStart"

func _ready():
	if isOnceOnProcess == false:
		DialogueRun()
	
func _process(delta): # Для задержки стартового диалога при паузе
	if isOnceOnProcess == true:
		if Singletone.Glob_pause == false:
			isOnceOnProcess = false
			DialogueRun()
			
			
func DialogueRun():
		var new_dialog = Dialogic.start(dialogueOnStart)
		add_child(new_dialog)
		Singletone.Glob_pause = true
		yield(new_dialog,"tree_exited")
		Singletone.Glob_pause = false
