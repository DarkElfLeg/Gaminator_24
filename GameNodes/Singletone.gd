extends Node2D
export var Glob_pause = false

func _out():
	$"../Game/Level"._out()

func _in(level):
	$"../Game/Level"._in(level)

