extends Control

@onready var label: Label = $"../Game/Label"
@onready var label_2: Label = $"../Game/Label2"
@onready var Sword: Button = $"Sword Buy"
@onready var label_3: Label = $"../Game/Label3"


func _on_sword_buy_pressed() -> void:
	if Global.coins > 9:
		if Global.sword == 0:
			Global.coins -= 10
			Global.sword = 1
			label.text = str(Global.coins)
			label_2.text = str(Global.coins)
			label_3.text = str(Global.coins)
			print ("Sword Earned!!!")
