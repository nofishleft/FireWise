extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#InitalSpeed
var speed = 100
#Acceleration
var accel = 10
#Max Camera Offset
var camera_y_offset = 100
var camera_x_offset = 100
var camera_y_offset_speed = 2
var camera_x_offset_speed = 2

var xdirection = 0
var ydirection = 0
var adjustCamera = false
var xmovement = 0
var ymovement = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	xdirection = 0
	ydirection = 0
	if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
        xdirection = -1
	if !Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
        xdirection = 1
	if Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
        ydirection = -1
	if !Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
        ydirection = 1
	check();



	#Linear speed, constant acceleration
	#Instantaneous turning
	var deltaposition = speed*delta
	speed += accel*delta
	self.position.x+=deltaposition*xmovement
	self.position.y+=deltaposition*ymovement

	var off = $Camera2D.getPosition()
	if xmovement != 0:
		off.x+=camera_x_offset_speed*xmovement
		if off.x>camera_x_offset:
			off.x=camera_x_offset
		elif off.x<-camera_x_offset:
			off.x=-camera_x_offset
	else:
		if off.x>0:
			off.x-=camera_x_offset_speed
		elif off.x<0:
			off.x+=camera_x_offset_speed
	if ymovement != 0:
		off.y+=camera_y_offset_speed*ymovement
		if off.y>camera_y_offset:
			off.y=camera_y_offset
		elif off.y<-camera_y_offset:
			off.y=-camera_y_offset
	else:
		if off.y>0:
			off.y-=camera_y_offset_speed
		elif off.y<0:
			off.y+=camera_y_offset_speed
	$Camera2D.setPosition(off)
	pass

func check():
	if ydirection==0 and xdirection!=0:
		ymovement = 0
		xmovement = xdirection
	elif ydirection!=0 and xdirection==0:
		ymovement = ydirection
		xmovement = 0
	elif ydirection!=0 and xdirection!=0:
		ymovement = ydirection
		xmovement = xdirection
	pass

#Returns a -1 (left), 0 (still) or 1 (right)
func getxMovement():
	return xmovement

#Returns a -1 (up), 0 (still) or 1 (down)
func getyMovement():
	return ymovement

func getxKey():
	return xdirection

func getyKey():
	return ydirection


#directions
# 812
# 703
# 654
func getMovement():
	pass

func code_tidbits():
	#Change scene
	get_tree().change_scene("res://path/to/scene.tscn")
