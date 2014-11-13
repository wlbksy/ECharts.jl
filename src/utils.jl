## This wrapper for json allows us to override certain types
ec_json(x::Any) = json(x)

#function ec_json(x::DateTime) =  "new Date($(year(x)), $(month(x)), $(day(x)), $(hour(x)), $(minute(x)), $(second(x)), 0)"
#    ## Date(year, month, day, hours, minutes, seconds, milliseconds)

## Open a url using our heuristic
function open_url(url::String) 
    @osx_only     run(`open $url`)
    @linux_only   run(`xdg-open $url`)
#    @windows_only run(`start $url`)
end

# <div id="{{:id}}" style="width:{{:width}}px; height:{{:height}}px;"></div>
echarts_tpl = """
<meta charset="utf-8">
<script src="{{:js_url}}"></script>
<div id="{{:id}}" style="height:500px;border:1px solid #ccc;padding:10px;"/>
<script>
    var EChart_{{:id}} = echarts.init(document.getElementById('{{:id}}'));
    var option_{{:id}} = {{{:chart_options}}};
    EChart_{{:id}}.setOption(option_{{:id}});
</script>
"""

## Render charts
## io -- render to io stream
## fname -- render to file
## none -- create html file, show in browser

function render(io::IO, opt::Dict; online::Bool = false)

    js_url = online ? js_online : js_local

    d = Dict(
        :id => ECharts.set_id(),
        :chart_options => json(opt),
        :js_url => js_url
        )

    out = Mustache.render(ECharts.echarts_tpl, d)
    
    print(io, out)
end

function render(fname::String, opt::Dict; online::Bool = false)
    io = open(fname, "w")
    render(io, opt; online = online)
    close(io)
    open_url(fname)
end

function render(opt::Dict; online::Bool = false) 
    @windows_only   fname = "EC_" * randstring(10) * ".html"
    @unix_only      fname = tempname() * ".html"
    render(fname, opt; online = online)
end