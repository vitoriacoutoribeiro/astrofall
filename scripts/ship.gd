extends Node2D

# Valores base
var base_speed := 120
var base_damage := 1

# Serão modificados pelos upgrades
var max_speed := 120
var damage := 1

# Controle de movimento
var velocity := Vector2.ZERO
var acceleration := 600.0
var friction := 800.0

var screen_size := Vector2.ZERO
var player_data := null


func _ready():
	# Aplica os upgrades comprados no lobby
	max_speed = base_speed
	damage = base_damage

	if has_node("/root/PlayerData"):
		player_data = get_node("/root/PlayerData")
		max_speed = base_speed + player_data.get_speed_bonus()
		damage = base_damage + player_data.get_damage_bonus()

	screen_size = get_viewport().size


func _process(delta):
	var input_dir := Vector2.ZERO
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_dir.length() > 0:
		input_dir = input_dir.normalized()
		velocity = velocity.move_toward(input_dir * max_speed, acceleration * delta)
	else:
		# desaceleração suave quando não há input
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	translate(velocity * delta)

	# Mantém a nave dentro da tela
	var pos := position
	pos.x = clamp(pos.x, 0, screen_size.x)
	pos.y = clamp(pos.y, 0, screen_size.y)
	position = pos

