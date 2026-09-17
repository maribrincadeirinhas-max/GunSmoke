extends "res://scripts/boss.gd"

func atirar():
	pass

func _on_navigation_agent_3d_velocity_computed(safe_velocity: Vector3) -> void:
	velocity = velocity .move_toward(safe_velocity, 0.25)

#func drop():
	#var chance = randi(1)
