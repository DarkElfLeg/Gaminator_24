extends Area2D

export var speed = 400
var move_to = 0

func _ready():
	move_to = rand_range(100, 1820);
	if move_to < position.x:
		scale = Vector2(-1,1)
	pass

func _process(delta):
	if not Singletone.pause_mode:
		position.y -= speed * delta
		if position.x < (move_to-100):
			position.x -= speed * delta
		if position.x > (move_to+100):
			position.x += speed * delta
		if position.y < -200:
			queue_free()
		pass


func _on_Spikes_body_entered(body):
	if body.name == "Alice":
		$"/root/Game/Alice"._hert()
		queue_free()
	pass # Replace with function body.
