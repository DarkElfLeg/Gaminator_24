extends KinematicBody2D

var go_position
var from_position
var time = 0
var go_spawn = false

export var moveDuration = 3
var timeDirection = 1

export var life = 2
var Maxlife = 2

func _hert():
	life -= 1
	$Sprite.modulate = Color(1,(0.5),(0.5))
	if life < 1:
		_clear()

func _clear():
	queue_free();

func _ready():
	Maxlife = life
	$Sprite.visible = false
	$CollisionPolygon2D.disabled = true;

func _go_spawn(tposition):
	from_position = tposition
	go_position = position
	position = tposition
	go_spawn =true;

func _process(delta):
	if go_spawn:
		$Sprite.visible = true
		$CollisionPolygon2D.disabled = false;
		# Flip the direction of how time gets added
		# This ensures it moves back to its initial position
		if (time > moveDuration):
			go_spawn = false
			pass

		# delta is how long it takes to complete a frame.
		time += delta * timeDirection
		var t = time / moveDuration

		position = lerp(from_position,go_position, t)
