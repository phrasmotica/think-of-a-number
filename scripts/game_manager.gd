extends Node

var secret_number: int

signal game_started(secret: int)
signal accept_guess(guess: int)
signal game_won

func _ready():
    generate_secret()

func generate_secret():
    secret_number = randi_range(1, 100)

    print("The secret number is " + str(secret_number))

    game_started.emit(secret_number)

func submit_guess(guess: int):
    if guess == secret_number:
        print("You win!")

        game_won.emit()
    else:
        print("Try again.")

    accept_guess.emit(guess)

func _on_answer_panel_submit_answer(guess: int):
    submit_guess(guess)

func _on_reveal_panel_game_restarted():
    generate_secret()
