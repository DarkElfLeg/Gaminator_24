extends KinematicBody2D

export var speed = Vector2(800,800)
export var acceleration_from_Shield = 1.05

var go_position
var from_position
var time = 0
var go_spawn = false
var game_on = false

export var moveDuration = 3
var timeDirection = 1

func _ready():
	$Sprite.visible = false
	$CollisionShape2D.disabled = true;

func _clear():
	queue_free();

func _go_spawn(tposition):
	from_position = tposition
	go_position = position
	position = tposition
	go_spawn =true;

func _process(delta):
	if not Singletone.Glob_pause:
		if go_spawn:
			$Sprite.visible = true
			# Flip the direction of how time gets added
			# This ensures it moves back to its initial position
			if (time > moveDuration):
				$CollisionShape2D.disabled = false;
				go_spawn = false
				game_on = true
				pass

			# delta is how long it takes to complete a frame.
			time += delta * timeDirection
			var t = time / moveDuration

			position = lerp(from_position,go_position, t)
		if not Singletone.pause_mode:
			if game_on:
				var collision = move_and_collide(speed*delta)
				if collision:
					speed = speed.bounce(collision.normal)
					if collision.collider.has_method("_hert"):
						collision.collider._hert();
					if collision.collider.name in ["Alice","Shield","Ball","Ball1","Ball2"]:
						move_and_slide(speed*100*delta)
					#print(collision.collider.name)
