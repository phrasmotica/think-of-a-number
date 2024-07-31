extends PanelContainer

@onready
var answer_input: LineEdit = %AnswerInput

func _ready():
	answer_input.grab_focus()
