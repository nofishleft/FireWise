extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func getPosition():
	#print(str(offset.x) + " " + str(offset.y))
	return offset
	pass
	
func setPosition(offset2):
	offset = offset2
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
