extends Area2D

export var dialog_file = "timeline-1667580737.json"

func _ready():
	var alice = get_tree().get_root().find_node("Alice",true,false)
	alice.connect("Interact",self, "_on_Interact")

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
		$Intrract.visible = false
		var new_dialog = Dialogic.start(dialog_file)
		add_child(new_dialog)
		yield(new_dialog,"tree_exited")

