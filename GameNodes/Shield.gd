extends KinematicBody2D

export var radius = 200
export var speed = 0.07
export var rotate_speed = 0.15
var direction_speed = Vector2.ZERO
var direct = Vector2.ZERO
var pdir = Vector2.ZERO
var dir_n = 0;


func _ready():
	var move_to = $"/root/Game/Alice".position
	position = move_to;
	#$Sprite.visible = false;
	#$CollisionShape2D.disabled = true;
	pass

func _physics_process(delta):
	var move_to = $"/root/Game/Alice".position
	if not($"/root/Game/Alice".direction == Vector2.ZERO):
		pdir = $"/root/Game/Alice".direction
		var targetDir = get_angle_to(position - pdir.normalized())
		rotate((targetDir)*rotate_speed)
		direct = (move_to + Vector2(-radius,0).rotated(rotation))
	position = lerp(position,direct,speed)
