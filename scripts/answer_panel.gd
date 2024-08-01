extends PanelContainer

@onready
var answer_input: LineEdit = %AnswerInput

@onready
var submit_button: Button = %SubmitButton

signal submit_answer(answer: int)

func _ready():
	answer_input.text_changed.connect(
		func(new_text: String):
			if new_text.is_empty():
				submit_button.disabled = true
				return

			if new_text.is_valid_int():
				submit_button.disabled = false
			else:
				submit_button.disabled = true
				print("Input text is not a valid integer!")
	)

	gain_input()

	# because answer input is empty by default
	submit_button.disabled = true

func submit_from_text(text: String):
	if not text.is_valid_int():
		print("Answer is not a valid integer!")
		return

	var answer := int(text)
	submit_answer.emit(answer)

func prevent_input():
	answer_input.mouse_filter = Control.MOUSE_FILTER_IGNORE
	answer_input.release_focus()

	submit_button.disabled = true

func gain_input():
	answer_input.mouse_filter = Control.MOUSE_FILTER_STOP
	answer_input.grab_focus()

	submit_button.disabled = false

func _on_answer_input_text_submitted(new_text: String):
	submit_from_text(new_text)

func _on_submit_button_pressed():
	submit_from_text(answer_input.text)

func _on_game_manager_accept_guess(_guess: int, _secret: int):
	answer_input.text = ""

func _on_game_manager_game_started(_secret: int):
	answer_input.grab_focus()

func _on_game_manager_game_won():
	prevent_input()

func _on_game_manager_game_lost():
	prevent_input()
