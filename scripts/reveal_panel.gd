extends PanelContainer

signal game_restarted

func _ready():
    hide()

func _on_game_manager_game_won():
    show()

func _on_play_again_button_pressed():
    hide()

    game_restarted.emit()
