extends Control

func _on_play_pressed():
	SignalManager.emit_signal("play_game")


func _on_quit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	OS.shell_open("https://github.com/godofgrunts/godot-game-clones/blob/master/flap-bird/credits.txt")
