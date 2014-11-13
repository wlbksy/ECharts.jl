module ECharts

using Mustache
using JSON
# using DataFrames
# using Datetime
using Logging
Logging.configure(level=DEBUG)

js_local = Pkg.dir("ECharts", "js", "echarts-all.js")
js_online = "http://echarts.baidu.com/build/dist/echarts-all.js"

export
    ec_set_title,
    ec_set_color_auto, ec_set_color,

    # charts
    ec_bar_v, ec_bar_h,
#    ec_bar_piled, ec_bar_piled_h,
#    ec_waterfall,

#    ec_candle,

#    ec_chord,
    
#    ec_force,

#    ec_line, ec_line_piled, ec_line_h,
#    ec_area, ec_area_piled,

#    ec_map,
    
#    ec_pie, ec_ring, ec_rose_area, ec_rose_radius,

#    ec_radar,

#    ec_scatter, ec_scatter_large,
    
    # visible
   ec_set_visible_toolbox,
    
    # util
    open_url, render

#include("concepts.jl")
include("common.jl")
include("ecBar.jl")
#include("ecCandle.jl")
#include("ecChord.jl")
#include("ecForce.jl")
#include("ecLine.jl")
#include("ecMap.jl")
#include("ecPie.jl")
#include("ecRadar.jl")
#include("ecScatter.jl")
include("utils.jl")

end ## module
