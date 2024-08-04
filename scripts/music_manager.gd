extends Node

@export
var main_audio: AudioStream

@export
var high_guess_audio: AudioStream

@export
var win_audio: AudioStream

@onready
var music_player: AudioStreamPlayer = %Music

func _ready():
    music_player.stream = main_audio
    music_player.play()

func set_main():
    music_player.stream = main_audio
    music_player.play()

func _on_game_manager_guessed_high():
    music_player.stream = high_guess_audio
    music_player.play()

    music_player.finished.connect(set_main)

func _on_game_manager_game_won():
    music_player.stream = win_audio
    music_player.play()

    if music_player.finished.is_connected(set_main):
        music_player.finished.disconnect(set_main)
