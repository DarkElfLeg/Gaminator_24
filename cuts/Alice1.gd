extends KinematicBody2D

signal Interact

export var speed = 300
var direction_speed = Vector2.ZERO
var is_flipped = 0
var direction = Vector2.RIGHT


func _physics_process(delta):
	if Singletone.Glob_pause == false:
		direction = Vector2.ZERO
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
		
		if direction_speed.x<0:
			if is_flipped == 0:
				$".".scale = Vector2(-1,1)
				is_flipped = 1;
		else:
			if is_flipped:
				$".".scale = Vector2(-1,-1)
			is_flipped = 0;
			
		if Input.is_action_pressed("ui_accept"):
			emit_signal("Interact")
				
		move_and_slide(direction_speed * 100 * delta)

func _hert():
	Singletone._damage(1)
	var scene = load("res://Fight_Levels/Blood_splash.tscn")
	var loaded = scene.instance()
	add_child(loaded)
	pass

func _throw_shield():
	pass

func _set_fight_mode():
	# spawn shield
	pass

func _set_peace_mode():
	# despawn shield
	pass
