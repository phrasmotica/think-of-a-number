extends Node

@export_range(3, 8)
var max_guesses: int = 3

var secret_number: int
var guesses_left: int

signal game_started(secret: int)
signal accept_guess(guess: int, secret: int)

signal game_won
signal game_lost

func _ready():
    guesses_left = max_guesses

    generate_secret()

func generate_secret():
    secret_number = randi_range(1, 100)

    print("The secret number is " + str(secret_number))

    game_started.emit(secret_number)

func submit_guess(guess: int):
    guesses_left -= 1

    if guess == secret_number:
        print("You win!")

        game_won.emit()
    elif guesses_left > 0:
        print("Try again.")
    else:
        print("You lose!")

        game_lost.emit()

    accept_guess.emit(guess, secret_number)

func _on_answer_panel_submit_answer(guess: int):
    submit_guess(guess)

func _on_reveal_panel_game_restarted():
    generate_secret()
