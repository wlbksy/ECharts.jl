# Standard Radar chart: radar1.html

```julia
using ECharts

# each column is a set of data
data = [4300 5000;
       10000 14000;
       28000 28000;
       35000 31000;
       50000 42000;
       19000 21000]

legend = ["Tom", "Jerry"]

labels = ["one", "two", "three", "four", "five", "six"]

bounds = [6000, 16000, 30000, 38000, 52000, 25000]

opt = ec_radar(legend, data, labels, bounds)

render(opt)
```