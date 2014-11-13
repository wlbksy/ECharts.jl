function bar2line(opt::Dict)
    for i = 1:length(opt["series"])
        opt["series"][i]["type"] = "line"
    end

    opt["series"][1]["boundaryGap"] = false

    return opt
end

function ec_line{S<:String}(legendlist::Vector{S}, data::Array, labels=[1:size(data, 1)]; smooth::Bool = true)
    opt = ec_bar(legendlist, data, labels; smooth = smooth)
    bar2line(opt)
end

function ec_line_piled{S<:String}(legendlist::Vector{S}, data::Array, labels=[1:size(data, 1)]; smooth::Bool = true)
    opt = ec_bar_piled(legendlist, data, labels; smooth = smooth)
    bar2line(opt)
end

function ec_line_h{S<:String}(legendlist::Vector{S}, data::Array, labels=[1:size(data, 1)]; smooth::Bool = true)
    opt = ec_bar_h(legendlist, data, labels; smooth = smooth)
    bar2line(opt)
end

function ec_area{S<:String}(legendlist::Vector{S}, data::Array, labels=[1:size(data, 1)]; smooth::Bool = true)
    opt = ec_line(legendlist, data, labels; smooth = smooth)

    for i = 1:length(opt["series"])
        opt["series"][i]["itemStyle"] = Dict(
                "normal" => Dict("areaStyle" => Dict("type" => "default"))
            )
    end

    return opt
end

function ec_area_piled{S<:String}(legendlist::Vector{S}, data::Array, labels=[1:size(data, 1)]; smooth::Bool = true)
    opt = ec_area(legendlist, data, labels; smooth = smooth)

    for i = 1:length(opt["series"])
        opt["series"][i]["stack"] = "total"
    end

    return opt
end