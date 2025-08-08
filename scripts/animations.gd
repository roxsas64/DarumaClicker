extends MarginContainer

@onready var template: Label = $"../Indicators/Template"
@onready var click_button: TextureButton = $CenterContainer/ClickButton
@onready var indicators: Control = $"../Indicators"
@onready var boredTimer: Timer = $CenterContainer/ClickButton/BoredTimer
@onready var darumaAnimation: AnimationPlayer = $CenterContainer/ClickButton/Daruma/Sprite2D/AnimationPlayer

func _ready() -> void:
	click_button.pivot_offset = click_button.size / 2

func _on_click_button_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(click_button, "scale", Vector2(.9, .9), .1)
	darumaAnimation.play("neutral")

func _on_click_button_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(click_button, "scale", Vector2(1, 1), .1)
	boredTimer.start()

func _on_game_omamori_clicked(amount) -> void:
	var indicator = template.duplicate()
	indicator.text = "+" + str(amount)
	indicator.position = get_global_mouse_position()
	indicator.visible = true
	indicators.add_child(indicator)
	indicator.get_child(0).start()

func _on_bored_timer_timeout() -> void:
	darumaAnimation.play("bored")
