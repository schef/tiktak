extends Thing

func _ready():
	super._ready()

func toff():
	description = "A big red OFF button!"
	animation.play("off")

func tblink():
	description = "A big red BLINK button!"
	animation.play("blink")

func ton():
	description = "A big red ON button!"
	animation.play("on")
