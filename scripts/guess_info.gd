@tool
class_name GuessInfo extends HBoxContainer

enum GuessRelative { CORRECT, HIGH, LOW, }

@export
var guess_value: int = 70:
	set(value):
		guess_value = value

		if value_label:
			value_label.text = str(guess_value)

@export
var relative: GuessRelative = GuessRelative.HIGH:
	set(value):
		relative = value

		if relative_label:
			match relative:
				GuessRelative.CORRECT:
					relative_label.text = ""
					relative_label.hide()

				GuessRelative.HIGH:
					relative_label.text = ">"
					relative_label.show()

				GuessRelative.LOW:
					relative_label.text = "<"
					relative_label.show()

@onready
var value_label: Label = %Value

@onready
var relative_label: Label = %Relative

func set_guess(guess: int, secret: int):
	guess_value = guess

	if guess < secret:
		relative = GuessRelative.LOW
	elif guess > secret:
		relative = GuessRelative.HIGH
	else:
		relative = GuessRelative.CORRECT
