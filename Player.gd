extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	
	
	if Input.is_key_pressed('KEY_A'):
		motion.x = 100
	elif Input.is_key_pressed('KEY_S'):
		motion.x -

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
