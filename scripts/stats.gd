extends VBoxContainer

@onready var omamori_label: Label = $OmamoriLabel

func _on_game_omamori_changed(amount) -> void:
	omamori_label.text = str(amount) + " Omamori"
