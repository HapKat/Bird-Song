extends Control

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if score >= 1000:
		$"..".end_game()

func _ready() -> void:
	Signas.IncrementScore.connect(IncrementScore)

func IncrementScore(incr: int):
	score += incr
	$%ScoreLabel.text = str(score) + "pts" 
