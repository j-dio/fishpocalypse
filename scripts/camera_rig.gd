class_name CameraRig
extends Node3D

## Follows target's XZ position at a fixed isometric angle.
## Call set_target() from Player once the player is ready (Phase 2).
## Tune camera_offset in the Inspector: (7,13,7) = ~52° elevation, 45° diagonal (Hades/Gungeon style).

@export var lerp_speed: float = 8.0
@export var camera_offset: Vector3 = Vector3(7.0, 13.0, 7.0)

var target: Node3D = null

@onready var _camera: Camera3D = $Camera3D

func _ready() -> void:
	if _camera:
		_camera.position = camera_offset
		_camera.look_at(global_position, Vector3.UP)

func _physics_process(delta: float) -> void:
	if target == null:
		return
	var flat_pos := Vector3(target.global_position.x, 0.0, target.global_position.z)
	global_position = global_position.lerp(flat_pos, lerp_speed * delta)

func set_target(new_target: Node3D) -> void:
	target = new_target
