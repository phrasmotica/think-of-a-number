@tool
extends GPUParticles2D

enum ArrowDirection { DOWN, UP, }

@export
var direction := ArrowDirection.DOWN:
	set(value):
		direction = value

		if direction == ArrowDirection.DOWN:
			texture = down_texture
			(process_material as ParticleProcessMaterial).direction = Vector3.UP
		else:
			texture = up_texture
			(process_material as ParticleProcessMaterial).direction = Vector3.DOWN

@export
var down_texture: Texture2D

@export
var up_texture: Texture2D

var initial_velocity := 500

func release():
	emitting = true

	get_tree().create_timer(1).timeout.connect(
		func():
			emitting = false
	)

func _on_game_manager_guessed_high():
	release()

func _on_game_manager_guessed_low():
	release()
