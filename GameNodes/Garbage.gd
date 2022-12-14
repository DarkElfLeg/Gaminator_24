extends Area2D

export var dialog_file = "timeline-1667580737.json"
export var var_name = "None"


func _ready():
	check_var()
	var alice = get_tree().get_root().find_node("Alice",true,false)
	alice.connect("Interact",self, "_on_Interact")

func check_var():
	if not var_name == "None":
		if not Dialogic.get_variable(var_name) == "0":
			$Intrract.visible = false
			$CollisionPolygon2D.disabled = true
			$"../Sprite".visible = false
	pass

func _on_Garbage_body_entered(body):
	if body.name == "Alice":
		$Intrract.visible = true
	pass # Replace with function body.


func _on_Garbage_body_exited(body):
	if body.name == "Alice":
		$Intrract.visible = false
	pass # Replace with function body.

func _on_Interact():
	if $Intrract.visible:
		if not Singletone.Glob_pause:
			Singletone.Glob_pause = true
			$Intrract.visible = false
			var new_dialog = Dialogic.start(dialog_file)
			add_child(new_dialog)
			yield(new_dialog,"tree_exited")
			check_var()
			Singletone.Glob_pause = false


