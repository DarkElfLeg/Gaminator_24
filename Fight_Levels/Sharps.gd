extends Node2D

func _ready():
	
	$CPUParticles2D.rotation = -rotation
	$CPUParticles2D2.rotation = -rotation
	$CPUParticles2D3.rotation = -rotation
	$CPUParticles2D4.rotation = -rotation
	
	$CPUParticles2D.emitting = true;
	$CPUParticles2D2.emitting = true;
	$CPUParticles2D3.emitting = true;
	$CPUParticles2D4.emitting = true;
	yield(get_tree().create_timer(10.0), "timeout")
	queue_free()
