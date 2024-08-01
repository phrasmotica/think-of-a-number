@tool
extends HBoxContainer

enum GuessRelative { CORRECT, HIGH, LOW, }

@export
var guess_value: int = 1:
	set(value):
		guess_value = value

		value_label.text = str(guess_value)

@export
var relative: GuessRelative = GuessRelative.HIGH:
	set(value):
		relative = value

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
