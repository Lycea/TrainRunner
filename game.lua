--require("helpers.classic")
base_class = require("helpers.classic"):extend()
tiles=require("tiles.tiles")
require("init")
require("renderer")

game={}


globals ={}


local function get_selected()
    local half_x =globals.tile_size_x/2
    local half_y =globals.tile_size_y/2
    
    --calculate boundaries for search
    local min_x = globals.mx - half_x
    local max_x = globals.mx + half_x
    
    local min_y = globals.my - half_y
    local max_y = globals.my + half_y
    
    
    if globals._debug.debug_select then
        
        globals._debug.min_x = min_x
        globals._debug.max_x = max_x
        globals._debug.min_y = min_y
        globals._debug.max_y = max_y
    end
    
    --calculate indexes from these boundaries
    local min_idx_x =  math.max(1,math.floor( min_x/globals.tile_size_x +0.5))
    local max_idx_x =  math.min(globals.map_w, math.floor( max_x/globals.tile_size_x +0.5))
    
    local min_idx_y =  math.max(1,math.floor( min_y/globals.tile_size_y +0.5))
    local max_idx_y =  math.min(globals.map_h,math.floor( max_y/globals.tile_size_y +0.5))
    
    if globals._debug.debug_select then
        globals._debug.min_idx_x = min_idx_x
        globals._debug.max_idx_x = max_idx_x
        globals._debug.min_idx_y = min_idx_y
        globals._debug.max_idx_y = max_idx_y
    end
    
    local min_dist = 99999
    local x_idx=0
    local y_idx=0
    
    --for the indexes,iterate them and get the closest one (for now from the middle
    for y=min_idx_y,max_idx_y do
       for x=min_idx_x,max_idx_x do
            local distance = math.dist(globals.map[y][x].mid_x,globals.map[y][x].mid_y,globals.mx,globals.my)
            if  distance< min_dist then
                min_dist = distance
                y_idx = y
                x_idx = x
            end
        end
    end
    
    globals._selected.x = x_idx
    globals._selected.y = y_idx
end



function game.load(conf)
    
    globals.scr_width, globals.scr_height=love.graphics.getDimensions()
    
    globals.tile_size_x = globals.scr_width/15
    globals.tile_size_y = globals.scr_height/10
    
    globals.map_w = 20
    globals.map_h = 10
    
    globals.map = init_map()
    
    globals.mx =0
    globals.my =0
    
    globals._debug ={}
    globals._debug.debug_select =false
    
    globals._selected={x=1,y=1}
    
    globals.clicked = false
    
end



function game.update()
    get_selected()
    
    if globals.clicked == true then
        globals.clicked = false
        if globals.map[globals._selected.y][globals._selected.x]:can_override() then
           globals.map[globals._selected.y][globals._selected.x] = tiles["starter_tile"](globals._selected.x*globals.tile_size_x,globals._selected.y*globals.tile_size_y)
        else
            print("can not override, is  forbiden")
        end
    end
    
end


function game.draw()
    
    render_all()
end


function game.mousemoved(x,y)
    globals.mx = x
    globals.my = y
end

function game.mousepressed()
    globals.clicked  = true
end
