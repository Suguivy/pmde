--- A Vector with two coordinates
-- @classmod Vector
local Vector = _C.Object:new()
Vector.__index = Vector

--- Creates a Vector.
-- @tparam number x the x component.
-- @tparam number y the y component.
-- @treturn Vector the new Vector object.
function Vector:new(x, y)
  return setmetatable({
    x = x,
    y = y
  }, self)
end

--- Returns the x coordinate of the Vector
-- @treturn number the x coordinate of the Vector
function Vector:get_x()
  return self.x
end

--- Changes the x coordinate of the Vector
-- @tparam number x the new x coordinate of the Vector
function Vector:set_x(x)
  self.x = x
end

--- Returns the y coordinate of the Vector
-- @treturn number the y coordinate of the Vector
function Vector:get_y()
  return self.y
end

--- Changes the y coordinate of the Vector
-- @tparam number y the new y coordinate of the Vector
function Vector:set_y(y)
  self.y = y
end

--- Allows to sum vectors with the + operator.
--
-- This metamethod sums the x and the y components of the Vectors and returns
-- a new Vector with the result.
-- @tparam Vector vector the Vector to add with.
-- @treturn Vector the new Vector object.
function Vector:__add(vector)
  return Vector:new(self.x + vector.x, self.y + vector.y)
end

--- Allows to substract vectors with the - operator.
--
-- This metamethod substracts the x and the y components of the Vectors and
-- returns a new Vector with the result.
-- @tparam Vector vector the Vector to substract with.
-- @treturn Vector the new Vector object.
function Vector:__sub(vector)
  return Vector:new(self.x - vector.x, self.y - vector.y)
end

--- Allows to multiply a Vector with a scalar with the * operator.
--
-- This metamethod returns a new Vector multiplying their coordinates with an
-- scalar.
-- @tparam number scalar the scalar to multiply with the Vector.
-- @treturn Vector the new Vector object.
function Vector:__mul(scalar)
  return Vector:new(self.x * scalar, self.y * scalar)
end

--- Allows to divide a Vector with a scalar with the / operator.
--
-- This metamethod returns a new Vector dividing their coordinates with an
-- scalar.
-- @tparam number scalar the scalar to divide with the Vector.
-- @treturn Vector the new Vector object.
function Vector:__div(scalar)
  return Vector:new(self.x / scalar, self.y / scalar)
end

--- Converts the object into a string with its information.
-- @treturn string a string with the object information.
function Vector:__tostring()
  return string.format("Vector = (%d, %d)", self.x, self.y)
end

--- Checks if the Vector is equal to other
-- @tparam Vector vector the other Vector to compare
-- @treturn boolean if the Vectors are equal
function Vector:__eq(vector)
  return self.x == vector.x and self.y == vector.y
end

return Vector
