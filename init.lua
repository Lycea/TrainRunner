function init_map()
    local tmp_map ={}

    for y=1, globals.map_h+1 do
        tmp_map[y]={}
        for x=1,globals.map_w+1 do
            tmp_map[y][x]=tiles.empty_tile(x*globals.tile_size_x,y*globals.tile_size_y)
        end
    end

    return tmp_map
end
