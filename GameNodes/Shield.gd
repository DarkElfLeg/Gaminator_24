extends KinematicBody2D

export var radius = 150
export var speed = 0.07
var direction_speed = Vector2.ZERO
var direct = Vector2.ZERO
var pdir = Vector2.ZERO

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
	direct = (move_to + pdir * radius)
	position = lerp(position,direct,speed)
