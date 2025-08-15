extends Control

@export var itemName : String
@export var price : int
@export var itemTexture : Texture2D

@onready var itemLabel : Label = $ItemLabel
@onready var priceTag : Label = $PriceTag
@onready var itemIcon : Sprite2D = $ItemIcon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemLabel.text = itemName
	priceTag.text = str(price) + " dolale"
	itemIcon.texture = itemTexture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_buy_pressed() -> void:
	if GameManager.omamori >= price:
		# comprable
		GameManager.minusOmamori(price)
