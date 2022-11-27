extends Area2D

export var speed = 400
var move_to = 0
export var isDeleteByDead = true;
var isDead = false;

func _ready():
	move_to = rand_range(position.x - 900, position.x + 900);
	if move_to > position.x:
		scale = Vector2(-1,1)
	pass

func _process(delta):
	if not Singletone.pause_mode:
		position.y -= speed * delta
		if position.x < (move_to+100):
			position.x -= speed * delta
		if position.x > (move_to-100):
			position.x += speed * delta
		if position.y < -200:
			queue_free()
		pass


func _on_Spikes_body_entered(body):
	if body.name == "Alice":
		$"/root/Game/Alice"._hert();
		if (not isDeleteByDead):
			isDead = true;
			$Rat.visible = false;
			$Rat2.visible = true;
			$CollisionPolygon2D.disabled = true;
		else:
			queue_free();
