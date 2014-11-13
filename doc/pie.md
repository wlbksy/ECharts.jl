# Standard Pie chart: pie1.html

```julia
using ECharts

# data as vector
data = [315, 310, 234, 135, 1548]
       
legend=["one", "two", "three", "four", "five"]

opt = ec_pie(legend, data)

render(opt)
```

# Standard Ring chart: pie2.html

```julia
using ECharts

# data as vector
data = [315, 310, 234, 135, 1548]
       
legend=["one", "two", "three", "four", "five"]

opt = ec_ring(legend, data)

render(opt)
```

# Nightingale Rose chart: pie3.html

Rose area chart: each data with same radian but different area.

Rose radius chart: each data with both different radian and radius.

```julia
using ECharts

# data as vector
data = [315, 310, 234, 135, 1548]
       
legend=["one", "two", "three", "four", "five"]

# either area or radius
opt = ec_rose_area(legend, data)
# opt = ec_rose_radius(legend, data)

render(opt)
```