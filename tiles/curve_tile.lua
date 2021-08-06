local tmp_function={}


function tmp_function.init(base_state)

    local tile = base_state:extend()



    function tile:new()
        print("inited tile class...")
    end


    function tile:update()
        
    end
    
    
    function tile:draw()
        
    end



    return tile
end

return tmp_function