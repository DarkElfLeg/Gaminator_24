extends Area2D

export var speed = 300
var stars = preload("res://Sprites/AlexParticles/StarsFX.tscn")

func _ready():
	pass

func _process(delta):
	if not Singletone.pause_mode:
		position.y -=  speed * delta
		if position.y < -200:
			queue_free()
		pass


func _on_Candy_body_entered(body):
	if body.name == "Alice":
		Singletone._collect_sweets()
		var loaded = stars.instance()
		loaded.position = position
		$"/root/Game/HUD".add_child(loaded)
		queue_free()
	pass # Replace with function body.
