extends Node2D
export var Glob_pause = false
export var Max_Helth_Player = 5 # Очевидно...
export var Helth_Player = 1 # некое начальное значение...
export var sweets = 0 # местная валюта снов.

func check_helth():
	if Helth_Player > Max_Helth_Player:
		Helth_Player = Max_Helth_Player
	if Helth_Player < 0:
		Helth_Player = 0 # Пока так...
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

