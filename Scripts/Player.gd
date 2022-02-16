extends KinematicBody2D

const Cima = Vector2(0,-1)
const gravidade = 40
const Max_vel_queda = 200
const max_vel = 150
const forca_pulo = 500
var movimento = Vector2()

func _physics_process(delta):
	movimento = move_and_slide(movimento,Cima)
	movimento.y += gravidade
	
	if movimento.y > Max_vel_queda:
		movimento.y = Max_vel_queda
	
	if Input.is_action_pressed("move_right"):
		movimento.x = max_vel
		if is_on_floor():
			get_node("Sprite_texture").animation = "andar"
			get_node("Sprite_texture").flip_h = false
		
	elif Input.is_action_pressed("move_left"):
		movimento.x = -max_vel
		if is_on_floor():
			get_node("Sprite_texture").animation = "andar"
			get_node("Sprite_texture").flip_h = true
	
	else:
		movimento.x = 0
		if is_on_floor():
			get_node("Sprite_texture").animation = "default"
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			movimento.y = -forca_pulo
			if movimento.y < 0:
				get_node("Sprite_texture").animation = "pular"
			if movimento.y > 0:
				get_node("Sprite_texture").animation = "Cair"
	

