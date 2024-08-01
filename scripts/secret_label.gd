class_name SecretLabel extends Label

@export_range(1, 100)
var secret_value: int = 1

func _ready():
	conceal()

func reveal():
	text = str(secret_value)

func conceal():
	text = "?"
