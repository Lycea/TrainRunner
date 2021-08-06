local tmp_function={}


function tmp_function.init(base_state)

    local tile = base_state:extend()



    function tile:new(x,y)
        self.x = x
        self.y = y
        
        self.w = globals.tile_size_x
        self.h = globals.tile_size_y
        
        print("inited tile class...")
        self.overrideable =false
        
        self.mid_x= self.x+self.w/2
        self.mid_y= self.y+self.h/2
    end


    function tile:update()
        
    end
    
    
    function tile:draw()
            love.graphics.setColor(0,255,0)
            love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
            love.graphics.setColor(255,255,255)
            love.graphics.rectangle("line",self.x,self.y,self.w,self.h)
            love.graphics.setColor(0,0,0)
    end



    return tile
end

return tmp_function