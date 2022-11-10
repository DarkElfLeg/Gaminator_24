extends AnimationPlayer

func PlayIt(anim):
	play(anim)
	
func DestroyIt():
	queue_free()
