extends Area2D

onready var anim = $AnimatedSprite
 
func _on_coletavel_body_entered(body) -> void:
	if body.is_in_group("player"):
		anim.play("coletado")

func _on_AnimatedSprite_animation_finished() -> void:
	if anim.get_animation() == "coletado":
		queue_free()
