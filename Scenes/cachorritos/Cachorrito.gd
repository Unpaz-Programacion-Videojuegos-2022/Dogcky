extends KinematicBody2D

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()
func _ready():
	motion.x = MAX_SPEED
	pass 

func _next_to_left_Wall() -> bool:
	return $leftray.is_colliding()
	
func _next_to_right_Wall() -> bool:
	return $rightray.is_colliding()

func _floor_deteccion() -> bool:
	return $Sprite/floorDeteccion.is_colliding()
	
func _flip():
	if _next_to_left_Wall() or _next_to_right_Wall() or  !_floor_deteccion():
		motion.x *= -1
		$Sprite.scale.x *= -1
func _process(delta):
	motion.y += GRAVITY
	_flip()
	
	motion = move_and_slide(motion)
	pass
