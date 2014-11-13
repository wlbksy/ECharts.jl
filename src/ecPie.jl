function ec_pie_init()
    opt = ec_init()
    opt["tooltip"]["trigger"] = "item"
    opt["calculable"] = true

    return opt
end

function ec_pie{S<:String}(legendlist::Vector{S}, data::Vector; radius="55%", center = ["50%", "55%"])
    opt = ec_pie_init()
    opt["legend"]["data"] = legendlist

    m = length(data)
    data_dict = Dict(
    	"name" => "",
    	"type" => "pie",
    	"radius" => radius,
    	"center" => center,
		"data" => Array(Any, m)
		)

    for i = 1:m
        data_dict["data"][i] = Dict(
            "name" => legendlist[i],
            "value" => data[i]
            )
    end

    push!(opt["series"], data_dict)

    return opt
end

function ec_ring{S<:String}(legendlist::Vector{S}, data::Vector; radius=["50%", "70%"], center = ["50%", "55%"])
    ec_pie(legendlist, data; radius = radius, center = center)
end

function ec_rose_base{S<:String}(legendlist::Vector{S}, data::Vector; radius=["20%", "100%"], center = ["50%", "55%"])
	opt = ec_pie_init()
    opt["legend"]["data"] = legendlist

    m = length(data)
    data_dict = Dict(
    	"name" => "",
    	"type" => "pie",
    	"radius" => radius,
    	"center" => center,
		"data" => Array(Any, m)
		)

    for i = 1:m
        data_dict["data"][i] = Dict(
            "name" => legendlist[i],
            "value" => data[i]
            )
    end

    push!(opt["series"], data_dict)

    return opt
end

function ec_rose_area{S<:String}(legendlist::Vector{S}, data::Vector; radius=["20%", "70%"], center = ["50%", "55%"])
	opt = ec_rose_base(legendlist, data; radius = radius, center = center)
	opt["series"][1]["roseType"] = "area"

	return opt
end

function ec_rose_radius{S<:String}(legendlist::Vector{S}, data::Vector; radius=["20%", "70%"], center = ["50%", "55%"])
	opt = ec_rose_base(legendlist, data; radius = radius, center = center)
	opt["series"][1]["roseType"] = "radius"

	return opt
end