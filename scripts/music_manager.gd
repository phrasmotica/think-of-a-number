extends Node

@export
var main_audio: AudioStream

@export
var high_guess_audio: AudioStream

@onready
var music_player: AudioStreamPlayer = %Music

func _ready():
    music_player.stream = main_audio
    music_player.play()

func _on_game_manager_guessed_high():
    music_player.stream = high_guess_audio
    music_player.play()

    music_player.finished.connect(
        func():
            music_player.stream = main_audio
            music_player.play()
    )
