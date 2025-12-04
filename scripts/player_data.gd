extends Node

# Dados persistentes do jogador (usados no lobby e no jogo)

var coins:int = 100
var speed_level:int = 0
var damage_level:int = 0

const SPEED_PRICE:int = 50
const DAMAGE_PRICE:int = 75

const SPEED_PER_LEVEL:int = 20
const DAMAGE_PER_LEVEL:int = 1

func get_speed_bonus() -> int:
	return speed_level * SPEED_PER_LEVEL


func get_damage_bonus() -> int:
	return damage_level * DAMAGE_PER_LEVEL


func buy_speed() -> bool:
	if coins >= SPEED_PRICE:
		coins -= SPEED_PRICE
		speed_level += 1
		return true
	return false


func buy_damage() -> bool:
	if coins >= DAMAGE_PRICE:
		coins -= DAMAGE_PRICE
		damage_level += 1
		return true
	return false


