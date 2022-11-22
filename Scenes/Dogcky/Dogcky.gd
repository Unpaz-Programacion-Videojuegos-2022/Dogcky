extends KinematicBody2D


var poop = preload("res://Scenes/objetos/poop.tscn")
const VALOR_DE_VELOCIDAD = 15
const VELOCIDAD_MAXIMA   = 150
const GRAVITY = 10
const MAX_JUMPS = 1
var velocity = Vector2(0,-1)
onready var sprite = $AnimatedSprite
var jumps = 0
signal rescatar
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _generate_poop():
	var instancia_poop = poop.instance()
	get_parent().add_child(instancia_poop)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_on_floor() and jumps == 1:
		jumps = 0
		velocity.y = 0
		sprite.play("quieto")

	else:
		velocity.y += GRAVITY
		
	if Input.is_action_just_pressed("ui_accept") and jumps < MAX_JUMPS:
		jumps += 1
		velocity.y = -25 * VALOR_DE_VELOCIDAD
		sprite.play("saltar")

	if Input.is_action_just_pressed("skill"):
		var instancia_poop = poop.instance()
		get_parent().add_child(instancia_poop)
#		instancia_poop.set_global_pos(Vector2(self.get_global_pos().x , self.get_global_pos().y ))

	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -VELOCIDAD_MAXIMA
		sprite.play("caminar")
		$AnimatedSprite.flip_h = false
		

	if Input.is_action_just_pressed("ui_right"):
		velocity.x = VELOCIDAD_MAXIMA
		sprite.play("caminar")
		$AnimatedSprite.flip_h = true

	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_down"):
		velocity.x = 0
		sprite.play("quieto")



	move_and_slide(velocity,Vector2.UP)
	
	var minimo = get_tree().get_nodes_in_group("min")[0].global_position
	var maximo = get_tree().get_nodes_in_group("max")[0].global_position
	
	if(global_position.x < minimo.x):
		global_position.x = minimo.x + 5
	elif(global_position.x > maximo.x):
		global_position.x = maximo.x - 5
		
	if(global_position.y > maximo.y):
		global_position.y = maximo.y + 5
	elif(global_position.y < minimo.y):
		global_position.y = minimo.y - 5


	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("enemigo")):
			get_tree().change_scene("res://Scenes/fin del juego por perder/game over.tscn")
	
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("puerta")):
			get_tree().change_scene("res://Scenes/Nivel prueba/prueba de movimiento.tscn")
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("puerta2")):
			get_tree().change_scene("res://Scenes/final/Final.tscn")
	
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("A")):
			get_tree().call_group("A","delete")
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("B")):
			get_tree().call_group("B","delete")
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("C")):
			get_tree().call_group("C","delete")
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("D")):
			get_tree().call_group("D","delete")
	if(get_slide_collision(get_slide_count()-1) != null):
		var colisionador = get_slide_collision(get_slide_count()-1).collider
		if(colisionador.is_in_group("E")):
			get_tree().call_group("E","delete")
