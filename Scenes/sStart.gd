extends Node2D
func _ready():
	Singletone._calm();

func _clear():
	queue_free()
