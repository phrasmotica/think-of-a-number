extends Node

var secret_number: int

signal accept_guess(guess: int)
signal game_won

func _ready():
    secret_number = randi_range(1, 100)

    print("The secret number is " + str(secret_number))

func submit_guess(guess: int):
    if guess == secret_number:
        print("You win!")

        game_won.emit()
    else:
        print("Try again.")

    accept_guess.emit(guess)

func _on_answer_panel_submit_answer(guess: int):
    submit_guess(guess)
