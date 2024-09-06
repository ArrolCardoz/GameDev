extends CharacterBody2D
#constant for movement
@export var SPEED :int = 600
@onready var animated_sprite = $AnimatedSprite2D
	#idel animation variables
	#i dont need to update it every second
var LastupButtonPressed:bool = false
var LastdownButtonPressed:bool = false
var LastleftButtonPressed:bool = false
var LastrightButtonPressed:bool = false

#movement
func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction* SPEED
	move_and_slide()
	
	
	#animation code
	#bool variables that take input of which button is pressed
	#I can use these veriables to calculate which animation should be played
	var upButtonPressed:bool = false
	var downButtonPressed:bool = false
	var leftButtonPressed:bool = false
	var rightButtonPressed:bool = false

	if Input.is_action_pressed("move_up"):
		upButtonPressed = true
	if Input.is_action_pressed("move_down"):
		downButtonPressed = true
	if Input.is_action_pressed("move_left"):
		leftButtonPressed = true
	if Input.is_action_pressed("move_right"):
		rightButtonPressed = true
	
	#walk animation
	#walk bottom
	if getBottom( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkDown")
		setBottom()
	#bottom left
	elif getBottomLeft( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkDown")
		setBottomLeft()
	#bottom right
	elif getBottomRight( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkDown")
		setBottomRight()
	#left
	elif getLeft( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkLeft")
		setLeft()
	#right
	elif getRight( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkRight")
		setRight()
	#top
	elif getTop( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkUp")
		setTop()
	#top left
	elif  getTopLeft( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkUp")
		setTopLeft()
	#top right
	elif  getTopRight( upButtonPressed, downButtonPressed,  leftButtonPressed, rightButtonPressed):
		animated_sprite.play("WalkUp")
		setTopRight()
	else:
		#idel animation
		if direction.x == 0 and direction.y ==0  :
			#rest (bottom)
			if  getBottom(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelRest")
			#bottom left
			elif  getBottomLeft(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelRest")
			#bottom right
			elif  getBottomRight(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelRest")
			#right
			elif getRight(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelRight")
			#left
			elif getLeft(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelLeft")
			#top
			elif getTop(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelBack")
			#top right
			elif getTopRight(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelBack")
			#top left
			elif getTopLeft(LastupButtonPressed, LastdownButtonPressed, LastleftButtonPressed, LastrightButtonPressed):
				animated_sprite.play("IdelBack")
			#default
			else:
				animated_sprite.play("IdelBack")#default animation


func getTop(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return top and not bottom and not left and not right

func getTopRight(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return top and not bottom and not left and not right

func getTopLeft(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return top and not bottom and not left and not right

func getBottom(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return not top and bottom and not left and not right

func getBottomRight(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return not top and bottom and not left and right

func getBottomLeft(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return not top and bottom and left and not right

func getLeft(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return not top and not bottom and left and not right

func getRight(top:bool,bottom:bool,left:bool,right:bool)->bool:
	return not top and not bottom and not left and right

func setTop()->void:
	LastupButtonPressed = true
	LastdownButtonPressed = false
	LastleftButtonPressed = false
	LastrightButtonPressed = false
	return


func setTopRight()->void:
	LastupButtonPressed = true
	LastdownButtonPressed = false
	LastleftButtonPressed = false
	LastrightButtonPressed = true
	return

func setTopLeft()->void:
	LastupButtonPressed = true
	LastdownButtonPressed = false
	LastleftButtonPressed = true
	LastrightButtonPressed = false
	return

func setBottom()->void:
	LastupButtonPressed = false
	LastdownButtonPressed = true
	LastleftButtonPressed = false
	LastrightButtonPressed = false
	return

func setBottomRight()->void:
	LastupButtonPressed = false
	LastdownButtonPressed = true
	LastleftButtonPressed = false
	LastrightButtonPressed = true
	return

func setBottomLeft()->void:
	LastupButtonPressed = false
	LastdownButtonPressed = true
	LastleftButtonPressed = true
	LastrightButtonPressed = false
	return

func setLeft()->void:
	LastupButtonPressed = false
	LastdownButtonPressed = false
	LastleftButtonPressed = true
	LastrightButtonPressed = false
	return

func setRight()->void:
	LastupButtonPressed = false
	LastdownButtonPressed = false
	LastleftButtonPressed = false
	LastrightButtonPressed = true
	return
