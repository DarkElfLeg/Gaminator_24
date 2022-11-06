extends Area2D

export var dialog_file = "timeline-1667580737.json"
export var visited = false

func _ready():
	var alice = get_tree().get_root().find_node("Alice",true,false)
	alice.connect("Interact",self, "_on_Interact")

func _on_Interact():
	if $Intrract.visible:
		if not visited:
			if not Singletone.Glob_pause:
				Singletone.Glob_pause = true
				$Intrract.visible = false
				var new_dialog = Dialogic.start(dialog_file)
				add_child(new_dialog)
				yield(new_dialog,"tree_exited")
				Singletone.Glob_pause = false
				visited = true



func _on_Activity_body_entered(body):
	if body.name == "Alice":
		if not visited:
			$Intrract.visible = true


func _on_Activity_body_exited(body):
	if body.name == "Alice":
		$Intrract.visible = false
