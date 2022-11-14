# Hide Node Child By Dialogic Variable
extends Node

var isHided = false;
export var childName = "";
export var variableName = "";
export var isInvert = false; # true -> Show By Variable (Not Hide)

func _ready():
	CheckHideIt();
	
func CheckHideIt(): # Check if we Hide or Show Node by Dialogic Variable
	var booleanTest = true;
	if (Dialogic.get_variable(variableName) == "0"):
		booleanTest = false; #Hide Node
	else:
		booleanTest = true; #Show Node
			
	if (isInvert): # Invert Hide/Show Node
		booleanTest = not booleanTest;
			
	if (not booleanTest):
		for child in get_children():
			if (child.name == childName):
				child.queue_free();
				#child.visible = booleanTest;
				#child.get_node("CollisionPolygon2D").disabled = not booleanTest;
