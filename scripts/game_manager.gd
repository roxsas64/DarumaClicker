extends Node

const save_path = "user://userdata.save"

var omamori = 0

signal omamori_updated(amount: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_data()

func updateOmamori(newValue: int):
	omamori = newValue
	emit_signal("omamori_updated", omamori)

func addOmamori(addThisMany: int):
	omamori += addThisMany
	emit_signal("omamori_updated", omamori)
	save_data()

func minusOmamori(substractThisMany : int):
	omamori -= substractThisMany
	emit_signal("omamori_updated", omamori)
	save_data()

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
			updateOmamori(data.get("omamori", 0))
	else:
		save_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
