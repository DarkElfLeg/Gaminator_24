extends Node2D
export var Glob_pause = false
export var Max_Helth_Player = 5 # Очевидно...
export var Helth_Player = 5 # некое начальное значение...
export var sweets = 0 # местная валюта снов.

func pause_on():
	Glob_pause = true;
	
func pause_off():
	Glob_pause = false;

func check_helth():
	if Helth_Player > Max_Helth_Player:
		Helth_Player = Max_Helth_Player
	if Helth_Player < 0:
		pause_on()
		$"../Game/HUD/AnimationPlayer".play("fade_out")
		yield(get_tree().create_timer(1.0), "timeout")
		$"../Game/HUD/AnimationPlayer".play("fade_in")
		for child in $"../Game/Level".get_children():
			child.queue_free();
		$"../Game/Level"._in("res://Scenes/sHome.tscn")
		print("Death! Go to home.")
		$"../Game/Alice".position = Vector2(900,850)
		yield(get_tree().create_timer(4.0), "timeout")
		pause_off()
		Helth_Player = Max_Helth_Player
	if Helth_Player < 1:
		$"../Game/HUD/L1".visible = false
	else:
		$"../Game/HUD/L1".visible = true
	if Helth_Player < 2:
		$"../Game//HUD/L2".visible = false
	else:
		$"../Game/HUD/L2".visible = true
	if Helth_Player < 3:
		$"../Game//HUD/L3".visible = false
	else:
		$"../Game/HUD/L3".visible = true
	if Helth_Player < 4:
		$"../Game//HUD/L4".visible = false
	else:
		$"../Game/HUD/L4".visible = true
	if Helth_Player < 5:
		$"../Game//HUD/L5".visible = false
	else:
		$"../Game/HUD/L5".visible = true
	if Helth_Player < 6:
		$"../Game//HUD/L6".visible = false
	else:
		$"../Game/HUD/L6".visible = true
	print(Helth_Player)
		# анимация, спавн в кроватке.

func _set_helth(helth):
	Helth_Player = helth
	check_helth()

func _set_max_helth(helth):
	Max_Helth_Player = helth
	check_helth()

func _heal(heal):
	Helth_Player += heal
	check_helth()
	# Почему это отдельно он damage? Чтобы запускать анимацию в ноде Alice!

func _damage(damage):
	Helth_Player -= damage
	check_helth()

func _collect_sweets():
	pass


func _out():
	$"../Game/Level"._out()

func _in(level):
	$"../Game/Level"._in(level)
