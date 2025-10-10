extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gamecontrolller.coin_collected.connect(coin_collected)
	$Coins.text = str(Gamecontrolller.coins_collected)
	pass # Replace with function body.

func coin_collected():
	$Coins.text = str(Gamecontrolller.coins_collected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
