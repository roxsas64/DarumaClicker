extends VBoxContainer

@onready var omamori_label: Label = $OmamoriLabel

func _ready() -> void:
	# Sacar valor de GameManager al iniciar este objeto
	updateOmamoriLabel(GameManager.omamori)
	# Suscribirse a futuros cambios de cantidad de omamori
	GameManager.omamori_updated.connect(updateOmamoriLabel)

func updateOmamoriLabel(amount: int) -> void:
	omamori_label.text = str(amount) + " omamori"
