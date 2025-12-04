extends Control

onready var coin_label = $MarginContainer/VBox/CoinLabel
onready var message_label = $MarginContainer/VBox/MessageLabel

var player_data := null


func _ready():
	if has_node("/root/PlayerData"):
		player_data = get_node("/root/PlayerData")
	update_ui()


func update_ui():
	if coin_label and player_data:
		coin_label.text = "Moedas: %d" % player_data.coins


func show_message(text:String):
	if message_label:
		message_label.text = text


func _on_SpeedButton_pressed():
	if not player_data:
		show_message("Erro: PlayerData não encontrado.")
		return

	if player_data.buy_speed():
		update_ui()
		show_message("Velocidade melhorada!")
	else:
		show_message("Moedas insuficientes para velocidade.")


func _on_DamageButton_pressed():
	if not player_data:
		show_message("Erro: PlayerData não encontrado.")
		return

	if player_data.buy_damage():
		update_ui()
		show_message("Dano melhorado!")
	else:
		show_message("Moedas insuficientes para dano.")


func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/game.tscn")


