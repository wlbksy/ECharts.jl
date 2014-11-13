# China map: map_China.html

```julia
using ECharts

data = rand(1:1300, 3, 2)
       
legend=["女", "男"]

labels = ["新疆", "四川", "山东"]

opt = ec_map(legend, data, "china", labels)
render(opt)
```

# World map: map_world.html

```julia
using ECharts

data = rand(1:1300, 7, 2)
       
legend=["women", "men"]

labels = ["United States of America", "China", "Russia", "Brazil", "Australia", "Germany", "Chad"]

opt = ec_map(legend, data, "world", labels)
render(opt)
```