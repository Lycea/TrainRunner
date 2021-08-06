
local empty_tile= base_class:extend()





function empty_tile:new(x,y)
    
    self.x = x
    self.y = y
    
    self.w = globals.tile_size_x
    self.h = globals.tile_size_y
    
    self.overrideable = true
    
    self.mid_x= self.x+self.w/2
    self.mid_y= self.y+self.h/2
end


function empty_tile:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("line",self.x,self.y,self.w,self.h)
    love.graphics.setColor(0,0,0)
end

function empty_tile:update()
    
end



function empty_tile:can_override()
    return self.overrideable
end

return empty_tile
