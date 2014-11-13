function ec_scatter_init()
    opt = ec_init_cartesian()
    opt["tooltip"]["trigger"] = "item"
    opt["toolbox"]["feature"]["dataZoom"] = true
    opt["yAxis"] = [
        Dict("type" => "value",
        "splitArea" => Dict("show" => true),
         "scale" => true)
        ]
    opt["xAxis"] = [
        Dict("type" => "value",
        "scale" => true)
        ]

    return opt
end

function ec_scatter{S<:String}(legendlist::Vector{S}, datas::Array...)
    opt = ec_scatter_init()
    opt["legend"]["data"] = legendlist
    
    m = length(datas)
    resize!(opt["series"], m)
    
    for i = 1:m
        opt["series"][i] = Dict(
            "name" => legendlist[i],
            "type" => "scatter",
            "data" => datas[i].'
            )
    end
    
    return opt
end

function ec_scatter_large{S<:String}(legendlist::Vector{S}, datas::Array...)
    opt = ec_scatter(legendlist, datas...)

    for i = 1:length(opt["series"])
    	opt["series"][i]["large"] = true
    end
    
    return opt
end