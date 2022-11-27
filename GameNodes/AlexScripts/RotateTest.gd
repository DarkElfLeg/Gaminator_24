extends Node2D

export var isInitRandomAngle = false;
export var isInitRandomDirection = false;
export var RotateSpeed = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	if (isInitRandomAngle):
		rotate(rand_range(-180,180));
	if (isInitRandomDirection):
		if (rand_range(0,100) > 50):
			RotateSpeed *= -1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(RotateSpeed*delta);
