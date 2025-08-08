extends Control

const save_path = "user://userdata.save"

var omamori = 0
var amount_per_click = 1


signal omamori_changed
signal omamori_clicked


func _ready() -> void:
	load_data()
	emit_signal("omamori_changed", omamori)

func save_data():
	var data = {
		"omamori": omamori,
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(data)
	file.close()
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			omamori = data.get("omamori", 0)
	else	:
		save_data()

func _on_click_button_button_down() -> void:
	omamori += amount_per_click
	print(omamori)
	emit_signal("omamori_changed", omamori)
	emit_signal("omamori_clicked", amount_per_click)
	save_data()
