function ec_bar_init()
    opt = ec_init_cartesian()
    opt["tooltip"]["trigger"] = "axis"
    opt["toolbox"]["feature"]["magicType"] = 
        Dict{ASCIIString,Any}(
            "show" => true,
            "type" => ["line", "bar"]
         )
    opt["calculable"] = true
    opt["yAxis"] = [
            Dict{ASCIIString,Any}(
                "splitArea" => Dict{ASCIIString,Bool}("show" => true),
                "type" => "value"
            )
        ]
    opt["xAxis"] = [
            Dict{ASCIIString,Any}("type" => "category")
        ]

    return opt
end


function ec_bar_v{S<:String, N<:Real}(legendlist::Vector{S}, data::Array{N}, labels=[1:size(data, 1)]; smooth::Bool = true)
    opt = ec_bar_init()
    opt["legend"]["data"] = legendlist
    
    n = size(data, 2)
    resize!(opt["series"], n)
    
    for i = 1:n
        opt["series"][i] = Dict(
            "name" => legendlist[i],
            "type" => "bar",
            "smooth" => smooth,
            "data" => data[:, i]
            )
    end
    opt["xAxis"][1]["data"] = labels
    
    return opt
end


function ec_bar_h{S<:String, N<:Real}(legendlist::Vector{S}, data::Array{N}, labels=[1:size(data, 1)]; smooth::Bool=true)
    opt = ec_bar_v(legendlist, data, labels; smooth=smooth)
    
    tmp = opt["xAxis"]
    opt["xAxis"] = opt["yAxis"]
    opt["yAxis"] = tmp

    return opt
end

function ec_bar_piled{S<:String, N<:Real}(legendlist::Vector{S}, data::Array{N}, labels=[1:size(data, 1)]; smooth::Bool=true)
    opt = ec_bar(legendlist, data, labels; smooth=smooth)
    
    for i = 1:length(opt["series"])
        opt["series"][i]["stack"] = "total"
    end

    return opt
end

function ec_bar_piled_h{S<:String, N<:Real}(legendlist::Vector{S}, data::Array{N}, labels=[1:size(data, 1)]; smooth::Bool=true)
    opt = ec_bar_h(legendlist, data, labels; smooth=smooth)
    
    for i = 1:length(opt["series"])
        opt["series"][i]["stack"] = "total"
    end

    return opt
end

function ec_waterfall{S<:String, N<:Real}(legendlist::Vector{S}, data::Vector{N}, labels=[1:size(data, 1)]; smooth::Bool=false)
    opt = ec_init_cartesian()
    opt["tooltip"]["axisPointer"] = Dict("type" => "shadow")
    opt["tooltip"]["trigger"] = "axis"
    opt["yAxis"] = [
        Dict("splitArea" => Dict("show" => true),
        "type" => "value")
        ]
    opt["xAxis"] = [
        Dict("type" => "category")
        ]

    opt["legend"]["data"] = legendlist
    
    len = length(data)

    lastsum_data = zeros(N, len)
    pos_data = Array(String, len)
    neg_data = Array(String, len)

    for i = 1:len
        if sign(data[i]) >= 0
            pos_data[i] = string(data[i])
            neg_data[i] = "-"
        else
            pos_data[i] = "-"
            neg_data[i] = string(-data[i])
        end
    end

    for i = 2:len
        if data[i-1] >=0
            lastsum_data[i] = lastsum_data[i-1] + data[i-1]
        else
            lastsum_data[i] = lastsum_data[i-1]
        end

        if data[i]< 0
            lastsum_data[i] = lastsum_data[i] + data[i]
        end
    end

    resize!(opt["series"], 3)
    
    opt["series"][1] = Dict(
        "name" => "",
        "type" => "bar",
        "smooth" => smooth,
        "stack" => "total",
        "data" => lastsum_data[1:end],
        "itemStyle" => Dict("normal" => Dict("borderColor"=>"rgba(0,0,0,0)","color"=>"rgba(0,0,0,0)"),
                        "emphasis" => Dict("borderColor"=>"rgba(0,0,0,0)","color"=>"rgba(0,0,0,0)"))
        )

    opt["series"][2] = Dict(
        "name" => legendlist[1],
        "type" => "bar",
        "smooth" => smooth,
        "stack" => "total",
        "data" => pos_data,
        "itemStyle" => Dict("normal" => Dict("label" => Dict("show" => true, "position" => "inside")))
        )

    opt["series"][3] = Dict(
        "name" => legendlist[2],
        "type" => "bar",
        "smooth" => smooth,
        "stack" => "total",
        "data" => neg_data,
        "itemStyle" => Dict("normal" => Dict("label" => Dict("show" => true, "position" => "inside")))
        )
    
    merge!(opt["xAxis"][1],Dict("data" => labels))
    
    return opt
end