extends PanelContainer

@export
var guess_info_scene: PackedScene

@onready
var guesses_container: VBoxContainer = %GuessesContainer

func _ready():
    clear_guesses()

func clear_guesses():
    for c in guesses_container.get_children():
        c.queue_free()

func _on_game_manager_accept_guess(guess: int, secret: int):
    var guess_info := create_guess_info(guess, secret)

    guesses_container.add_child(guess_info)

func create_guess_info(guess: int, secret: int) -> GuessInfo:
    var guess_info: GuessInfo = guess_info_scene.instantiate()

    guess_info.ready.connect(
        func():
            guess_info.set_guess(guess, secret)
    )

    return guess_info

func _on_reveal_panel_game_restarted():
    clear_guesses()
