extends Camera2D

@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var worldSizeInPxl = tilemap.get_used_rect().size * tilemap.rendering_quadrant_size
	limit_right = worldSizeInPxl.x
	limit_bottom = worldSizeInPxl.y
