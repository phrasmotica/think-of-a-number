extends Node

var secret_number: int

func _ready():
    secret_number = randi_range(1, 100)

    print("The secret number is " + str(secret_number))

func submit_answer(answer: int):
    if answer == secret_number:
        print("You win!")
    else:
        print("Try again.")

func _on_answer_panel_submit_answer(answer: int):
    submit_answer(answer)
