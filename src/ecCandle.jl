function ec_candle_init()
    opt = ec_init_cartesian()
    opt["legend"]["data"] = [""]
    opt["tooltip"]["trigger"] = "axis"
    opt["toolbox"]["feature"]["dataZoom"] = true
    opt["yAxis"] = [
        Dict("splitArea" => Dict("show" => true),
         "scale" => true,
         "boundaryGap" => [0.03,0.03],
         "splitNumber" => 9,
         "precision" => 2)
        ]
    opt["xAxis"] = [
        Dict("boundaryGap" => true)
        ]
    opt["dataZoom"] = Dict("show" => true,
                       "realtime" => true,
                       "start" => 50,
                       "end" => 100)
    
    return opt
end

# data=[open close low high]
# colors = [up_bar_body; down_bar_body;
#            up_bar_shadow; down_bar_shadow;
#            up_bar_selected; down_bar_selected]

_color_candle_US = ["green", "white", "green", "red", "green", "white"]
_color_candle_CN = ["red", "green", "red", "green", "white", "black"]

function ec_candle{S<:String, C<:String}(data::Array, labels::Vector{S};
colors::Vector{C}=_color_candle_US)
    opt = ec_candle_init()
    
    merge!(opt["xAxis"][1], Dict("data" => labels))
    
    cl = length(colors)
    if cl == 2
        colors = [colors; colors]
    elseif cl == 4
        colors = [colors; colors[1:2]]
    elseif cl != 6
        error("colors should be defined correctly")
    end
    
    data_dict =
    Dict(
        "name" => "",
        "type" => "k",
        
        "itemStyle" =>
        Dict(
            "normal" =>
            Dict(
                "color" => colors[1],
                "color0" => colors[2],
                "lineStyle" =>
                Dict(
                    "width" => 2,
                    "color" => colors[3],
                    "color0" => colors[4]
                )
            ),
            "emphasis" =>
            Dict(
                "color" => colors[5],
                "color0" => colors[6]
            )
        ),
        
        "data" => data.'
    )
    
    push!(opt["series"], data_dict)
    
    return opt
end
