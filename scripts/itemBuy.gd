@tool
extends Control

@onready var itemLabel : Label = $ItemLabel
@onready var priceTag : Label = $PriceTag
@onready var itemIcon : Sprite2D = $ItemIcon

@export var itemName: String:
	set(value):
		itemName = value
		if  is_inside_tree():
			$ItemLabel.text = itemName
			
@export var price: int:
	set(value):
		price = value
		if  is_inside_tree():
			$PriceTag.text = str(value)
			
@export var itemTexture: Texture2D:
	set(value):
		itemTexture = value
		if is_inside_tree():
			$ItemIcon.texture = itemTexture



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemLabel.text = itemName
	priceTag.text = str(price) + " 
	omamori"
	itemIcon.texture = itemTexture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_buy_pressed() -> void:
	if GameManager.omamori >= price:
		# comprable
		GameManager.minusOmamori(price)
		Audiomanager.buyItem.play()
