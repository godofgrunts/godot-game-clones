extends Node2D

var menu_music := preload("res://assets/music/Cloud Dancer.mp3")
var level1_music := preload("res://assets/music/springtime-flight.wav")
var winner_music := preload("res://assets/music/winner.wav")
var loser_music := preload("res://assets/music/loser.wav")

var bird := preload("res://scenes/character/bird.tscn")
var pipes := preload("res://scenes/pipes/pipes.tscn")
var background := preload("res://scenes/spring_parallax_bg.tscn")

@onready var menu_screen := %MainMenu/MarginContainer/HBoxContainer/VBoxContainer/Menu
@onready var lose_screen := %MainMenu/MarginContainer/HBoxContainer/VBoxContainer/Lose
@onready var win_screen := %MainMenu/MarginContainer/HBoxContainer/VBoxContainer/Win
@onready var credit_screen := $Credits



func _ready():
	SignalManager.connect("play_game", load_game)
	SignalManager.connect("win", win)
	SignalManager.connect("lose", lose)
	%Music.stream = menu_music
	%Music.play()

func load_game():
	%MainMenu.visible = false
	%Music.stream = level1_music
	var b = bird.instantiate()
	var p = pipes.instantiate()
	var bg = background.instantiate()
	
	add_child(b)
	add_child(p)
	add_child(bg)
	%Music.play()

func win():
	_remove_children()
	menu_screen.visible = false
	lose_screen.visible = false
	win_screen.visible = true
	%MainMenu.visible = true
	%Music.stream = winner_music
	%Music.play()

func lose():
	_remove_children()
	menu_screen.visible = false
	lose_screen.visible = true
	win_screen.visible = false
	%MainMenu.visible = true
	%Music.stream = loser_music
	%Music.play()

func _remove_children():
	for child in get_children():
		if (child.name != "MainMenu") and (child.name != "Music"):
			remove_child(child)
