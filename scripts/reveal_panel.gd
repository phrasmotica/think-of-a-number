@tool
extends PanelContainer

@export
var enable_particles := true

@export
var up_arrow_particles: ArrowParticles

@export
var down_arrow_particles: ArrowParticles

@export
var tick_particles: GPUParticles2D

@onready
var secret_label: SecretLabel = %SecretLabel

@onready
var play_again_button: Button = %PlayAgainButton

@onready
var animation_player: AnimationPlayer = %AnimationPlayer

signal game_restarted

func _ready():
    secret_label.resized.connect(_on_secret_label_resized)

    if not Engine.is_editor_hint():
        start()

func start():
    secret_label.conceal()
    animation_player.play("label_wave")

    play_again_button.disabled = true

func finish():
    animation_player.play("label_wave_end")

func reveal():
    secret_label.reveal()
    animation_player.play("RESET")

    play_again_button.disabled = false

    if enable_particles:
        tick_particles.emitting = true

        get_tree().create_timer(0.1).timeout.connect(
            func():
                tick_particles.emitting = false
        )

func _on_game_manager_game_won():
    finish()

func _on_game_manager_game_lost():
    finish()

func _on_play_again_button_pressed():
    game_restarted.emit()

func _on_game_manager_game_started(secret: int):
    secret_label.secret_value = secret

    start()

func _on_secret_label_resized():
    print("Centering secret label pivot")

    secret_label.pivot_offset = secret_label.size / 2

func _on_game_manager_guessed_high():
    if enable_particles:
        down_arrow_particles.release()

func _on_game_manager_guessed_low():
    if enable_particles:
        up_arrow_particles.release()
