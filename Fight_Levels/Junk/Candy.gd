extends Area2D

export var speed = 300

func _ready():
	pass

func _process(delta):
	position.y -=  speed * delta
	if position.y < -200:
		queue_free()
	pass


func _on_Candy_body_entered(body):
	if body.name == "Alice":
		Singletone._collect_sweets()
		queue_free()
	pass # Replace with function body.
