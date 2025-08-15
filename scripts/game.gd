extends Control

var amount_per_click = 1

signal omamori_changed
signal omamori_clicked

func _ready() -> void:
	#load_data()
	pass


func _on_click_button_button_down() -> void:
	GameManager.addOmamori(amount_per_click)
	emit_signal("omamori_clicked", amount_per_click)
	#save_data()
