extends Node2D

signal game_finished

func end_game():
	emit_signal("game_finished")
