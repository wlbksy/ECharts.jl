# Standart Candle chart: candle1.html

```julia
using ECharts

#### each row for [open close low high]
data = [2320.26 2302.6 2287.3 2362.94;
        2300 2291.3 2288.26 2308.38;
        2295.35 2346.5 2295.35 2346.92;
        2347.22 2358.98 2337.35 2363.8;
        2360.75 2382.48 2347.89 2383.76]
       

label = ["2013/1/24", "2013/1/25", "2013/1/28", "2013/1/29", "2013/1/30"]

opt = ec_candle(data, label)

### Chinese color theme (red for up, green for down)
#opt = ec_ec_candle(data, label; colors=ECharts._color_candle_CN)

render(opt)
```