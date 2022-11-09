extends KinematicBody2D

var sharps = preload("res://Fight_Levels/Sharps.tscn")

export var speed = 600;
export var aim_time = 1;
var pos = Vector2.ZERO
export var acceleration = 1.5
export var aim_speed = 0.05;
var aiming = true;

func _ready():
	# Поведение меча - полет вперед с наведением на алису и потом полет по прямой.
	rotate(rand_range(0.0,PI*2))
	yield(get_tree().create_timer(aim_time), "timeout")
	aiming = false
	yield(get_tree().create_timer(15), "timeout")
	queue_free()

func set_aim_position():
	pos = $"/root/Game/Alice".position

func aim(delta):
	pass

func _physics_process(delta):
	if not Singletone.pause_mode:
		if aiming:
			set_aim_position()
			var targetDir = get_angle_to(pos - position.normalized());
			rotate(targetDir * aim_speed)
		var velocity = Vector2(1,0).rotated(rotation)
		var collision = move_and_collide(velocity * delta * speed)
		if collision:
			if collision.collider.has_method("_hert"):
				collision.collider._hert();
			else:
				var loaded = sharps.instance()
				loaded.position = position
				$"/root/Game/HUD".add_child(loaded)
			queue_free()
		#position += velocity * delta * speed

