function ec_force_init()
    opt = ec_init()
    opt["tooltip"]["trigger"] = "item"
    opt["tooltip"]["formatter"] = "{b}"
    opt["toolbox"] = Dict()

    return opt
end

function ec_force{S<:String, I<:Integer, NW<:Real, EW<:Real}(nodesLabel::Vector, srcNodes::Vector{I}, tgtNodes::Vector{I}; legendlist::Vector{S}=[""], nodesCategories::Vector{I}=ones(length(nodesLabel)), nodesWeight::Vector{NW}=ones(length(nodesLabel)), edgesWeight::Vector{EW}=zeros(length(srcNodes)))
    opt = ec_force_init()
    opt["legend"]["data"] = legendlist

    data_dict = Dict()

    data_dict["name"] = ""
    data_dict["type"] = "force"

    cn = length(legendlist)
    data_dict["categories"] = Array(Any, cn)

    for i = 1:cn
        data_dict["categories"][i] = Dict("name" => legendlist[i])
    end

    data_dict["itemStyle"] = Dict(
        "normal" => Dict(
            "label" => Dict("show" => true,
                "textStyle" => Dict("color" => "#800080")
                ),
            "emphasis" => Dict("nodeStyle" => Dict("r" => 30),
                )
            )
        )

    data_dict["density"] = 0.05
    data_dict["attractiveness"] = 1.2

    nn = length(nodesLabel)
    data_dict["nodes"] = Array(Any, nn)

    for i =1:nn
        data_dict["nodes"][i] = Dict(
            "category" => nodesCategories[i],
            "name" => nodesLabel[i],
            "value" => nodesWeight[i]
            )
    end

    en = length(srcNodes)
    data_dict["links"] = Array(Any, en)

    for i =1:en
        data_dict["links"][i] = Dict(
            "source" => srcNodes[i],
            "target" => tgtNodes[i],
            "weight" => edgesWeight[i]
            )
    end


    push!(opt["series"], data_dict)

    return opt
end
