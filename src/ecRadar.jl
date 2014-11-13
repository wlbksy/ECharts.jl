function ec_radar_init()
    opt = ec_init()
    opt["tooltip"]["trigger"] = "axis"
    opt["calculable"] = true
    opt["polar"] = Array(Any,0)

    return opt
end

function ec_radar{S<:String, T<:String, N<:Real}(legendlist::Vector{S}, data::Array{N}, labels::Vector{T}, bounds::Vector{N})
    opt = ec_radar_init()
    opt["legend"]["data"] = legendlist
    
    m, n = size(data)
    circle_label = Dict("indicator" => Array(Any, m))

    for i = 1:m
        circle_label["indicator"][i] = Dict("text" => labels[i], "max" => bounds[i])
    end
    
    push!(opt["polar"], circle_label)
    
    data_dict = Dict(
        "name" => "",
        "type" => "radar")

    data_dict["data"] = Array(Any, n)
    
    for i = 1:n
        data_dict["data"][i] = Dict(
                                "name" => legendlist[i],
                                "value" => data[:,i]
                                )
    end

    push!(opt["series"], data_dict)

    return opt
end
