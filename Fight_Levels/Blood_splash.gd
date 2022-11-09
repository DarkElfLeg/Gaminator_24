extends Node2D


func _ready():
	$CPUParticles2D.emitting = true;
	yield(get_tree().create_timer(6.0), "timeout")
	queue_free()
