--- @class Dungeon a Dungeon that contains floors and Pok�mon
local Dungeon = _C.Object:new()
Dungeon.__index = Dungeon

--- Creates a new Dungeon
--- @param name string the name of the Dungeon.
--- @param total_floors number the number of floors.
--- @param width number the width of each floor in the Dungeon, in Cells.
--- @param height number the height of each floor in the Dungeon, in Cells.
--- @param tileset_id string the name of the tileset.
--- @return Dungeon the new Dungeon.
function Dungeon:new(name, total_floors, width, height, tileset_id)
    local floors = {}
    for i = 1, total_floors do
        floors[i] = _C.Floor:new(width, height)
    end

    local tileset = love.graphics.newImage("res/tilesets/" .. tileset_id .. ".png")
    return setmetatable(
        {
            name = name,
            floors = floors,
            tileset = tileset,
            view = _C.MapView:new(_C.Vector:new(0, 0), floors[1], tileset)
        },
        self
    )
end

--- Draws a floor of the Dungeon.
--- @param floor number the number of the floor to draw (absolute value).
function Dungeon:get_floor(floor)
    assert(floor, "The floor doesn't exists")
    return self.floors[floor]
end

--- Returns the reference to the tileset that is using the Dungeon.
--- @return Image the tileset that the Dungeon is using.
function Dungeon:get_tileset()
    return self.tileset
end

--- Gets the MapView of the Dungeon
--- @return MapView the MapView of the Dungeon
function Dungeon:get_view()
    return self.view
end

--- Converts the object into a string with its information.
--- @return string a string with the object information.
function Dungeon:__tostring()
    return string.format("Dungeon = {name = %s, total_floors = %s}", self.name, self.total_floors)
end

return Dungeon
