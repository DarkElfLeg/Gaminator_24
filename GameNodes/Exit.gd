extends Area2D

export var next_level = "res://Scenes/sDungeon.tscn"

func _ready():
	$CollisionShape2D.disabled = true
	var alice = get_tree().get_root().find_node("Alice",true,false)
	alice.connect("Interact",self, "_on_Interact")
	yield(get_tree().create_timer(4.0), "timeout") #Жду, когда анимации и привязци слотов к нодам отработают
	$CollisionShape2D.disabled = false

func _on_Exit_body_entered(body):
	if body.name == "Alice":
		$Intrract.visible = true


func _on_Exit_body_exited(body):
	if body.name == "Alice":
		$Intrract.visible = false


func _on_Interact():
	if $Intrract.visible:
		$CollisionShape2D.disabled = true
		$"/root/Singletone"._out()
		$"/root/Singletone"._in(next_level)

