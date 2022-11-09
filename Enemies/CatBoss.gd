extends KinematicBody2D
var life = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")
	yield(get_tree().create_timer(3.0), "timeout")
	for child in $"../3".get_children():# Почему 3? А просто хочу 3 жизни...
		if child.has_method("_go_spawn"):
			yield(get_tree().create_timer(0.1), "timeout")
			child._go_spawn(position)

func _idle():
	$AnimationPlayer.play("idle")

func fire_sword():
	if not Singletone.pause_mode:
		var scene = load("res://Fight_Levels/Sword1.tscn")
		var Level = scene.instance()
		Level.position = position
		$"..".add_child(Level)

func clear():
	if life == 3:
		for child in $"../3".get_children():# Почему 3? А просто хочу 3 жизни...
			if child.has_method("_clear"):
				#yield(get_tree().create_timer(0.3), "timeout")
				child._clear()
	if life == 2:
		for child in $"../2".get_children():# Почему 3? А просто хочу 3 жизни...
			if child.has_method("_clear"):
				#yield(get_tree().create_timer(0.3), "timeout")
				child._clear()
	if life == 1:
		for child in $"../1".get_children():# Почему 3? А просто хочу 3 жизни...
			if child.has_method("_clear"):
				#yield(get_tree().create_timer(0.3), "timeout")
				child._clear()
	pass

func spawn():
	if life == 2:
		for child in $"../2".get_children():# Почему 3? А просто хочу 3 жизни...
			if child.has_method("_go_spawn"):
				yield(get_tree().create_timer(0.1), "timeout")
				child._go_spawn(position)
	if life == 1:
		for child in $"../1".get_children():# Почему 3? А просто хочу 3 жизни...
			if child.has_method("_go_spawn"):
				yield(get_tree().create_timer(0.1), "timeout")
				child._go_spawn(position)

func _hert():
	Singletone.pause_mode = true
	$AnimationPlayer.play("hert")
	# Момент очистки!
	clear()
	life = life - 1;
	# Момент спавна!
	spawn()
	if life <= 0:
		$AnimationPlayer.play("Defeat")
		yield(get_tree().create_timer(0.3), "timeout")
		$"/root/Singletone"._out()
		yield(get_tree().create_timer(5.0), "timeout")
		$"/root/Singletone"._in($"../".next_level)
	Singletone.pause_mode = false
