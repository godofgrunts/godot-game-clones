extends Control

func _ready():
	set_score()
	GameState.connect("goal", update_score)

func update_score(n):
	match n:
		"P1Goal":
			GameState.p2_score += 1
			if GameState.p2_score >= 10:
				reset_score()
			else:
				set_score()
		"P2Goal":
			GameState.p1_score += 1
			if GameState.p1_score >= 10:
				reset_score()
			else:
				set_score()

func set_score():
	%P1Score.text = "Score: %s" % GameState.p1_score
	%P2Score.text = "Score: %s" % GameState.p2_score

func reset_score():
	GameState.p1_score = 0
	GameState.p2_score = 0
	set_score()
