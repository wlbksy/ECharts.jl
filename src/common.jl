set_id() = "ID_" * randstring(10)

#function deal_with_NA(data)
#    res = Array{Any,0}
#    for i = 1:nrow(data)
#        tmp = isna(data[i,1])? '-' : data[i,1]
#        push!(res,tmp)
#    end
#    return res
#end

function ec_init()
    opt = Dict(
        "title" => Dict{ASCIIString,Any}(),
        "legend" => Dict{ASCIIString,Any}(),
        "toolbox" => 
            Dict{ASCIIString,Any}(
                "show" => true,
                "feature" =>
                    Dict{ASCIIString,Any}(
                        "mark" => Dict{ASCIIString,Bool}("show"=>true),
                        "dataView" => Dict{ASCIIString,Bool}("show"=>true,"readOnly" => false),
                        "restore" =>  Dict{ASCIIString,Bool}("show"=>true),
                        "saveAsImage" => Dict{ASCIIString,Bool}("show"=>true)
                    )
            ),
        "tooltip" => Dict{ASCIIString,ASCIIString}(),
        "dataZoom" => Dict{ASCIIString,Any}(),
        "series" => Array(Dict{ASCIIString,Any}, 0)
        )
        
    return opt
end

function ec_init_cartesian()
    opt = ec_init()
    opt["xAxis"] = Array(Dict{ASCIIString,Any}, 0)
    opt["yAxis"] = Array(Dict{ASCIIString,Any}, 0)
        
    return opt
end

function ec_set_visible_toolbox(opt::Dict, visible::Bool)
    opt["toolbox"]["show"] = visible
end

function ec_set_color(opt::Dict, colorlist::Vector{ASCIIString})
    opt["color"] = colorlist
end

function ec_set_title{S<:String}(opt::Dict, title::S)
    opt["title"]["text"] = title
end
