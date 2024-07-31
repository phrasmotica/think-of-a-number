extends PanelContainer

@onready
var guesses_container: VBoxContainer = %GuessesContainer

func _ready():
    clear_guesses()

func clear_guesses():
    for c in guesses_container.get_children():
        c.queue_free()

func _on_game_manager_accept_guess(guess: int):
    var label = Label.new()
    label.text = str(guess)

    guesses_container.add_child(label)

func _on_reveal_panel_game_restarted():
    clear_guesses()
