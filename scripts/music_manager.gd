extends Node

@export
var main_audio: AudioStream

@onready
var music_player: AudioStreamPlayer = %Music

func _ready():
    music_player.stream = main_audio
    music_player.play()
