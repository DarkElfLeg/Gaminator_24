extends KinematicBody2D

var go_position
var from_position
var time = 0
var go_spawn = false

export var Candy_chance = 0.8
export var moveDuration = 3
var timeDirection = 1

export var life = 2
var Maxlife = 2

func _hert():
	life -= 1
	$Sprite.modulate = Color(1.0,0.5,0.5);
	if life < 1:
		var r = rand_range(0.0,1.0)
		if r > Candy_chance:
			var candy = load("res://Fight_Levels/Junk/Candy.tscn")
			var loaded = candy.instance()
			loaded.position = position
			$"/root/Game/Level".add_child(loaded)
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
		$".".set_collision_layer_bit(3,true);
		$".".set_collision_layer_bit(0,false);
		$".".set_collision_mask_bit(3,true);
		$".".set_collision_mask_bit(0,false);
		$CollisionPolygon2D.disabled = false;
		# Flip the direction of how time gets added
		# This ensures it moves back to its initial position
		if (time > moveDuration):
			go_spawn = false
			$".".set_collision_layer_bit(0,true);
			$".".set_collision_layer_bit(3,false);
			$".".set_collision_mask_bit(0,true);
			$".".set_collision_mask_bit(3,false);
			pass

		# delta is how long it takes to complete a frame.
		time += delta * timeDirection
		var t = time / moveDuration

		position = lerp(from_position,go_position, t)
