function ec_map_init()
    opt = ec_init()
    opt["tooltip"]["trigger"] = "item"
    opt["toolbox"]["feature"]["mark"] = false
    opt["dataRange"] = Dict(
        "calculable" => true,
        "text" => ["High", "Low"],
        "color" => ["orangered","yellow","lightskyblue"]
    )

    return opt
end

function ec_map{N<:Real,S<:String,T<:String}(legendlist::Vector{S}, data::Array{N}, maptype::String, labels::Vector{T})
    opt = ec_map_init()
    opt["legend"]["data"] = legendlist

    data_cumsum = cumsum(data, 2)[:, end]
    opt["dataRange"]["min"] = int(0.95 * minimum(data_cumsum))
    opt["dataRange"]["max"] = int(1.05 * maximum(data_cumsum))
    
    m, n = size(data)
    resize!(opt["series"], n)
    for i = 1:n
        coldata = Dict(
            "name" => legendlist[i],
            "type" => "map",
            "mapType" => maptype,
            "data" => Array(Any, m)
            )
            
        for j = 1:m
            coldata["data"][j] = Dict("name" => labels[j], "value" => data[j, i])
        end
            
        opt["series"][i] = coldata
    end

    return opt
end
