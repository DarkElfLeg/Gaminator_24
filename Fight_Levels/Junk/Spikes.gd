extends Area2D

export var isDeleteByDead = true;
var isDead = false;
export var isRotateSpeed = 0;
export var speed = 400;


func _ready():
	pass


func _process(delta):
	if not Singletone.pause_mode:
		if (isDead && isRotateSpeed!=0):
			$Sprite2.rotate(isRotateSpeed*delta);
		position.y -= speed * delta
		if position.y < -200:
			queue_free()
		pass


func _on_Spikes_body_entered(body):
	if body.name == "Alice":
		$"/root/Game/Alice"._hert();
		if (not isDeleteByDead):
			isDead = true;
			if (isRotateSpeed!=0):
				if (rand_range(0,100) > 50): #Random Rotate Direction
					isRotateSpeed = -isRotateSpeed; #Random Rotate Speed
				isRotateSpeed *= rand_range(.9,1.1);
			$Sprite.visible = false;
			$Sprite2.visible = true;
			$CollisionPolygon2D.disabled = true;
		else:
			queue_free();
