extends KinematicBody2D


const VALOR_DE_VELOCIDAD = 10
const VELOCIDAD_MAXIMA   = 200
const GRAVITY = 10
const MAX_JUMPS = 1
var velocity = Vector2(0,-1)

var jumps = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_on_floor() and jumps >= 1:
		jumps = 0
		velocity.y = 0

	else:
		velocity.y += GRAVITY
		
	if Input.is_action_just_pressed("ui_up") and jumps < MAX_JUMPS:
		jumps += 1

		velocity.y = -20 * VALOR_DE_VELOCIDAD

	

	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -VELOCIDAD_MAXIMA

	if Input.is_action_just_pressed("ui_right"):
		velocity.x = VELOCIDAD_MAXIMA

	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_down"):
		velocity.x = 0

	move_and_slide(velocity,Vector2.UP)
