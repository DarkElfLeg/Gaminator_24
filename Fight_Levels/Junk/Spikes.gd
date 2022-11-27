extends Area2D

export var isDeleteByDead = true;
export var speed = 400;


func _ready():
	pass


func _process(delta):
	if not Singletone.pause_mode:
		position.y -= speed * delta
		if position.y < -200:
			queue_free()
		pass


func _on_Spikes_body_entered(body):
	if body.name == "Alice":
		$"/root/Game/Alice"._hert();
		if (not isDeleteByDead):
			$Sprite.visible = false;
			$Sprite2.visible = true;
			$CollisionPolygon2D.disabled = true;
		else:
			queue_free();
