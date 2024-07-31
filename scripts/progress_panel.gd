extends PanelContainer

@onready
var guesses_container: VBoxContainer = %GuessesContainer

func _ready():
    clear_guesses()

func clear_guesses():
    for c in guesses_container.get_children():
        c.queue_free()

func _on_game_manager_accept_guess(guess: int, secret: int):
    var label := create_label(guess, secret)

    guesses_container.add_child(label)

func create_label(guess: int, secret: int) -> Label:
    var label := Label.new()
    label.text = str(guess)

    if guess < secret:
        label.text += " (too low)"
    elif guess > secret:
        label.text += " (too high)"

    return label

func _on_reveal_panel_game_restarted():
    clear_guesses()
