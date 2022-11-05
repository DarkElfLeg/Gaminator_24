extends KinematicBody2D


export var speed = 300
var direction_speed = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT;
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT;
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP;
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN;
	direction = direction.normalized()
	direction_speed = lerp(direction_speed,direction*speed,0.1)
	move_and_collide(direction_speed * delta)
