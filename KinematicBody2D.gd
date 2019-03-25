extends KinematicBody2D

const up = Vector2(0, -1)

var direction = 1

var motion = Vector2()
const gravity = 100
const jump_force = -300

var is_jump = false

onready var sprite = get_node('warrior_sprite')

func _physics_process(delta):

	basic_movement()

	if is_on_floor():
		basic_jump(delta)
		is_jump = true
	else:
		is_jump = false

	if is_jump:
		motion.y += 2
	else:
		motion.y += 20
		
	if direction == 1:
		sprite.play('right_walk')
	else:
		sprite.play('idle')

	move_and_slide(motion, up)

func basic_movement():
	
	if Input.is_key_pressed(KEY_A):
		motion.x = -250
		direction = -1
	elif Input.is_key_pressed(KEY_D):
		motion.x = 250
		direction = 1
	else:
		motion.x = 0

func basic_jump(delta):
	if Input.is_key_pressed(KEY_W):
		motion.y = (jump_force*gravity*delta)
		is_jump = true
		
func is_jumping():
	return not is_on_floor()
