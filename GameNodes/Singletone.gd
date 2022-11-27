extends Node2D
export var Glob_pause = false
export var Max_Helth_Player = 2 # Очевидно...
export var Helth_Player = 2 # некое начальное значение...
export var sweets = 0 # местная валюта снов.
var temp_sweets = 0;
var back_pause = false
var is_in_minigame = false

func pause_on():
	Glob_pause = true

func pause_off():
	Glob_pause = false;

func _process(delta):
	if not Glob_pause == back_pause:
		back_pause = Glob_pause
		if Glob_pause:
			$"/root/Game/HUD/AnimationPlayer".play("Get_dark")
		else:
			$"/root/Game/HUD/AnimationPlayer".play("Dark_out")

func _calm():
	$"../Game/Singletone/fight_music".stop()
	$"../Game/Singletone/calm_music".play()
	pass
	
func _fight():
	$"/root/Game/Singletone/fight_music".play()
	$"/root/Game/Singletone/calm_music".stop()
	pass

func check_helth():
	if Helth_Player > Max_Helth_Player:
		Helth_Player = Max_Helth_Player
	if Helth_Player < 0:
		pause_on()
		temp_sweets = 0;
		Singletone.is_in_minigame = false
		$"../Game/HUD/Candy2/CandyCountUI".text = str(sweets)
		$"../Game/HUD/AnimationPlayer".play("fade_out")
		yield(get_tree().create_timer(1.0), "timeout")
		_calm();
		$"../Game/HUD/AnimationPlayer".play("fade_in")
		for child in $"../Game/Level".get_children():
			child.queue_free();
		$"../Game/Level"._in("res://Scenes/sHome.tscn")
		print("Death! Go to home.")
		$"../Game/Alice".position = Vector2(900,850)
		yield(get_tree().create_timer(4.0), "timeout")
		pause_off()#?! TODO!
		Helth_Player = Max_Helth_Player
	match Max_Helth_Player:
		2:
			$"../Game/HUD/BackL3".visible = false
			$"../Game/HUD/BackL4".visible = false
			$"../Game/HUD/BackL5".visible = false
			$"../Game/HUD/BackL6".visible = false
		3:
			$"../Game/HUD/BackL3".visible = true
			$"../Game/HUD/BackL4".visible = false
			$"../Game/HUD/BackL5".visible = false
			$"../Game/HUD/BackL6".visible = false
		4:
			$"../Game/HUD/BackL3".visible = true
			$"../Game/HUD/BackL4".visible = true
			$"../Game/HUD/BackL5".visible = false
			$"../Game/HUD/BackL6".visible = false
		5:
			$"../Game/HUD/BackL3".visible = true
			$"../Game/HUD/BackL4".visible = true
			$"../Game/HUD/BackL5".visible = true
			$"../Game/HUD/BackL6".visible = false
		6:
			$"../Game/HUD/BackL3".visible = true
			$"../Game/HUD/BackL4".visible = true
			$"../Game/HUD/BackL5".visible = true
			$"../Game/HUD/BackL6".visible = true
	match Helth_Player:
		0:
			$"../Game/HUD/L1".visible = false
			$"../Game/HUD/L2".visible = false
			$"../Game/HUD/L3".visible = false
			$"../Game/HUD/L4".visible = false
			$"../Game/HUD/L5".visible = false
			$"../Game/HUD/L6".visible = false
		1:
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L2".visible = false
			$"../Game/HUD/L3".visible = false
			$"../Game/HUD/L4".visible = false
			$"../Game/HUD/L5".visible = false
			$"../Game/HUD/L6".visible = false
		2: 
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L2".visible = true
			$"../Game/HUD/L3".visible = false
			$"../Game/HUD/L4".visible = false
			$"../Game/HUD/L5".visible = false
			$"../Game/HUD/L6".visible = false
		3:
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L2".visible = true
			$"../Game/HUD/L3".visible = true
			$"../Game/HUD/L4".visible = false
			$"../Game/HUD/L5".visible = false
			$"../Game/HUD/L6".visible = false
		4:
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L2".visible = true
			$"../Game/HUD/L3".visible = true
			$"../Game/HUD/L4".visible = true
			$"../Game/HUD/L5".visible = false
			$"../Game/HUD/L6".visible = false
		5:
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L2".visible = true
			$"../Game/HUD/L3".visible = true
			$"../Game/HUD/L4".visible = true
			$"../Game/HUD/L5".visible = true
			$"../Game/HUD/L6".visible = false
		6:
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L1".visible = true
			$"../Game/HUD/L1".visible = true
	print(Helth_Player)
		# анимация, спавн в кроватке.

func _set_helth(helth):
	Helth_Player = int(helth)
	check_helth()

func _set_max_helth(helth):
	Max_Helth_Player += int(helth)
	check_helth()

func _heal(heal):
	Helth_Player += int(heal)
	$"/root/Game/Singletone/PUp".play()
	check_helth()
	# Почему это отдельно он damage? Чтобы запускать анимацию в ноде Alice!

func _damage(damage):
	Helth_Player -= int(damage)
	$"/root/Game/Singletone/Hert".play()
	check_helth()

func _clear_sweets():
	temp_sweets = 0;

func _spare_sweets(amount):
	sweets -= int(amount)
	Dialogic.set_variable("CandyCount",sweets)
	$"../Game/HUD/Candy2/CandyCountUI".text = str(sweets)

func _collect_sweets():
	if is_in_minigame:
		temp_sweets += 1
		Dialogic.set_variable("CandyCount",sweets)
		$"../Game/HUD/Candy2/CandyCountUI".text = str(temp_sweets)
		$"/root/Game/Singletone/PUp".play()
	else:
		sweets += 1
		Dialogic.set_variable("CandyCount",sweets)
		$"../Game/HUD/Candy2/CandyCountUI".text = str(sweets)
		$"/root/Game/Singletone/PUp".play()
	pass

func _save_sweets():
	sweets += temp_sweets
	Dialogic.set_variable("CandyCount",sweets)
	$"../Game/HUD/Candy2/CandyCountUI".text = str(sweets)

func _get_crowned():
	$"../Game/Alice/Body/Head/Crown".visible = true


func _out():
	$"../Game/Level"._out()

func _in(level):
	$"../Game/Level"._in(level)

func _dialog(timeline):
	var new_dialog = Dialogic.start(timeline)
	add_child(new_dialog)
