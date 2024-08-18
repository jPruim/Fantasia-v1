extends Node

var score = 0;
@onready var score_label = $ScoreLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_point(amount: int = 1) -> void:
	score += amount
	score_label.text = "You collected " + str(score) + " coins"
	
