




function dw(obj)
   love.graphics.rectangle("fill",obj.x,obj.y,obj.w,obj.h)
end

function show_selected()
    
    love.graphics.setColor(255,0,0,150)
    love.graphics.rectangle("fill",globals._debug.min_x,globals._debug.min_y,globals._debug.max_x-globals._debug.min_x,globals._debug.max_y-globals._debug.min_y)

    
    
    --for the indexes,iterate them and get the closest one (for now from the middle
    love.graphics.setColor(0,255,0,150)
    for y=globals._debug.min_idx_y,globals._debug.max_idx_y do
       for x=globals._debug.min_idx_x,globals._debug.max_idx_x do
            dw(globals.map[y][x])
        end
    end
    love.graphics.setColor(0,0,0,255)
    
end






local function render_map()

    for y=1, globals.map_h+1 do
        for x=1,globals.map_w+1 do
            globals.map[y][x]:draw()
        end
    end
    
end





function render_all()
    render_map()
    --show_selected()
    --get_selected()
    if globals._debug.debug_select then
        show_selected()
    end
    love.graphics.setColor(0,0,255,150)
    
    dw(globals.map[globals._selected.y][globals._selected.x])
    
    love.graphics.setColor(0,0,0,255)
    
    
end
