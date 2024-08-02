extends Node

@export_range(3, 8)
var max_guesses: int = 3

var secret_number: int
var guesses_left: int

signal game_started(secret: int)

signal guessed_low
signal guessed_high
signal accept_guess(guess: int, secret: int)

signal game_won
signal game_lost

func _ready():
    generate_secret()

func generate_secret():
    guesses_left = max_guesses

    secret_number = randi_range(1, 100)

    print("The secret number is " + str(secret_number))

    game_started.emit(secret_number)

func submit_guess(guess: int):
    guesses_left -= 1

    accept_guess.emit(guess, secret_number)

    if guess == secret_number:
        print("You win!")
        game_won.emit()
        return

    if guesses_left <= 0:
        print("You lose!")
        game_lost.emit()
        return

    print("Try again.")

    if guess < secret_number:
        guessed_low.emit()
    else:
        guessed_high.emit()

func _on_answer_panel_submit_answer(guess: int):
    submit_guess(guess)

func _on_reveal_panel_game_restarted():
    generate_secret()
