extends PanelContainer

@onready
var secret_label: SecretLabel = %SecretLabel

@onready
var play_again_button: Button = %PlayAgainButton

signal game_restarted

func _ready():
    secret_label.conceal()

    play_again_button.disabled = true

func _on_game_manager_game_won():
    secret_label.reveal()

    play_again_button.disabled = false
    play_again_button.grab_focus()

func _on_game_manager_game_lost():
    secret_label.reveal()

    play_again_button.disabled = false
    play_again_button.grab_focus()

func _on_play_again_button_pressed():
    game_restarted.emit()

func _on_game_manager_game_started(secret: int):
    secret_label.secret_value = secret

    secret_label.conceal()

    play_again_button.disabled = true
    play_again_button.release_focus()
