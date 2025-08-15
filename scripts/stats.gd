extends VBoxContainer

@onready var omamori_label: Label = $OmamoriLabel

func _ready() -> void:
	# Sacar valor de GameManager al iniciar este objeto
	_on_omamori_updated(GameManager.omamori)
	# Suscribirse a futuros cambios de cantidad de omamori
	GameManager.omamori_updated.connect(_on_omamori_updated)

func _on_omamori_updated(amount: int) -> void:
	omamori_label.text = str(amount) + " omamori"
