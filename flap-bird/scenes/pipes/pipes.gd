extends Node

@onready var top_pipe : PackedScene = preload("res://scenes/pipes/pipe_top.tscn")
@onready var bottom_pipe : PackedScene = preload("res://scenes/pipes/pipe_bottom.tscn")

# We only care about the y-cord
var bottom_opening_offset : int = -241
var screen_size : int = ProjectSettings.get_setting("display/window/size/viewport_width")

var pipe_seperation : int = 96
var distance_between_openings : int = 90
var x_cord_spawn : int = screen_size + pipe_seperation

func _ready():
	spawn_pipes()

func spawn_pipes():
	var pipe_count : int = 0
	var pipe_max : int = 10
	
	while(pipe_count != pipe_max):
		var rng = RandomNumberGenerator.new()
		var top_pipe_min : int = 18
		var top_pipe_max : int = 198
		var top_pipe_spawn_y : int = rng.randi_range(top_pipe_min, top_pipe_max)
		var bottom_pipe_spawn_y : int = top_pipe_spawn_y + distance_between_openings - bottom_opening_offset
	
		var tp = top_pipe.instantiate()
		tp.global_position = Vector2(x_cord_spawn + (pipe_count * pipe_seperation), top_pipe_spawn_y)
		var bp = bottom_pipe.instantiate()
		bp.global_position = Vector2(x_cord_spawn + (pipe_count * pipe_seperation), bottom_pipe_spawn_y)
		add_child(tp)
		add_child(bp)
		pipe_count += 1
