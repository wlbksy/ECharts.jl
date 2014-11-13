function ec_chord_init()
    opt = ec_init()
    opt["tooltip"]["trigger"] = "item"
    opt["calculable"] = true

    return opt
end

function ec_chord{S<:String}(legendlist::Vector{S}, data::Array)
    opt = ec_chord_init()
    opt["legend"]["data"] = legendlist

    data_dict = Dict()

    data_dict["name"] = ""
    data_dict["type"] = "chord"
    data_dict["sort"] = "ascending"
    data_dict["sortSub"] = "descending"
    data_dict["showScale"] = true
    data_dict["showScaleText"] = true

    n = length(legendlist)
    data_dict["data"] = Array(Any, n)

    for i = 1:n
        data_dict["data"][i] = Dict("name" => legendlist[i])
    end

    data_dict["itemStyle"] = Dict(
        "normal" => Dict(
            "label" => Dict("show" => false)
            )
        )

    data_dict["matrix"] = data


    push!(opt["series"], data_dict)

    return opt
end
