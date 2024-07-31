extends PanelContainer

@onready
var secret_label: Label = %SecretLabel

signal game_restarted

func _ready():
    hide()

func _on_game_manager_game_won():
    show()

func _on_play_again_button_pressed():
    hide()

    game_restarted.emit()

func _on_game_manager_game_started(secret: int):
    secret_label.text = str(secret)
