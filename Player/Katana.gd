extends Area2D


@export var damage : int = 10

func _ready():
	monitoring = false

func _on_body_entered(body):
	for child in body.get_Children():
		if child is Damageable:
			child.hit(damage)
			

