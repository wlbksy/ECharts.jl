# Standard Scatter chart: scatter1.html

```julia
using ECharts

#### row data is [x-value y-value]
data_women= [161.2 51.6;
             167.5 59.0;
             159.5 49.2;
             157.0 63.0;
             155.8 53.6;
             170.0 59.0;
             159.1 47.6;
             166.0 69.8]
          
data_men = [174.0 65.6;
            175.3 71.8;
            193.5 80.7;
            186.5 72.6;
            187.2 78.8;
            181.5 74.8;
            184.0 86.4;
            184.5 78.4]

#### legend of data
legend=["women", "men"]

opt= ec_scatter(legend, data_women, data_men)

#### visible control of toolbox
# ec_set_visible_toolbox(opt, false)

render(opt)
```

# Large Scale Scatter chart: scatter3.html

Could be up to 350k points. scatter3.html is a demo with 1k points

```julia
using ECharts
function test{N<:Integer}(n::N)
     each = div(n,2)
     half = div(each,2)
     x = 10*rand(Float64,each)
     y = sin(x) - x .* [ones(half) -ones(half)].'[:] .* rand(each) *0.1
     z = cos(x) - x .* [ones(half) -ones(half)].'[:] .* rand(each) *0.1
     data1 = [x y]
     data2 = [x z]
     
     legend =["sin","cos"]
     
     #######
     # Large Scale Scatter chart SHOULD use `ec_scatter_large()`
     ###
     opt = ec_scatter_large(legend, data1, data2)
     
     opt["xAxis"][1]["power"]=1
     opt["yAxis"][1]["power"]=1
     opt["xAxis"][1]["precision"]=2
     opt["yAxis"][1]["precision"]=2
     
     render(opt; online=true)
end

test(int(1e3))
```