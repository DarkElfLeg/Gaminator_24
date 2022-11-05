extends Area2D

func _ready():
	var alice = get_tree().get_root().find_node("Alice",true,false)
	alice.connect("Interact",self, "_on_Interact")

func _on_Tree_body_entered(body):
	if body.name == "Alice":
		$Intrract.visible = true



func _on_Tree_body_exited(body):
	if body.name == "Alice":
		$Intrract.visible = false


func _on_Interact():
	if $Intrract.visible:
		Singletone.Glob_pause = true
		$Intrract.visible = false
		var new_dialog = Dialogic.start("timeline-1667587178.json")
		#dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
		yield(new_dialog,"tree_exited")
		Singletone.Glob_pause = false

