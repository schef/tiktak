extends Thing

func _ready():
	super._ready()

func closed():
	description = "A stranged closed door!"
	visible = false
	animation.play("closed")

func opening():
	description = "A stranged opening door!"
	visible = true
	animation.play("opening")

func opened():
	description = "A strange opened door!"
	visible = true
	animation.play("opened")

func is_opened():
	return animation.current_animation == "opened"
