# Hide Node Child By Dialogic Variable
extends Node

var isHided = false;
export var childName = "";
export var variableName = "";
var oldVariableTest = "-";
export var isInvert = false; # true -> Show By Variable (Not Hide)

func _ready():
	pass

func _process(delta):
	pass
	
func CheckHide(): # Check if we Hide or Show Node by Dialogic Variable
	var booleanTest = true;
	if (oldVariableTest != Dialogic.get_variable(variableName)): #Check Update of Variable
		oldVariableTest = Dialogic.get_variable(variableName); #set new Old Variable Number
		
		if (oldVariableTest == "0"):
			booleanTest = false; #Hide Node
		else:
			booleanTest = true; #Show Node
			
		if (isInvert): # Invert Hide/Show Node
			booleanTest = not booleanTest;
			
		for child in get_children():
			print (child.name);
			if (child.name == childName):
				child.visible = booleanTest;
				child.get_node("CollisionPolygon2D").disabled = booleanTest;
