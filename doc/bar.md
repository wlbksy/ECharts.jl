# Standard Bar chart: bar1.html

```julia
using ECharts

#### each column is a set of data
data=rand(1:1000, 5, 2)

#### legend of data
legend=["a", "b"]

#### label of data
labels = ["one", "two", "three", "four", "five"]

opt= ec_bar_v(legend, data, labels)
#### labels could be omitted
# opt= ec_bar_v(legend, data)

#### visible control of toolbox
# ec_set_visible_toolbox(opt, false)

render(opt)
```

# Piled Bar chart: bar2.html

```julia
using ECharts

#### each column is a set of data
data=rand(1:1000, 5, 2)

#### legend of data
legend=["a", "b"]

#### label of data
labels = ["one", "two", "three", "four", "five"]

opt= ec_bar_piled(legend, data, labels)

render(opt)
```

# Standard Horizontal Bar chart: bar3.html

```julia
using ECharts

#### each column is a set of data
data=rand(1:1000, 5, 2)

#### legend of data
legend=["a", "b"]

#### label of data
labels = ["one", "two", "three", "four", "five"]

opt= ec_bar_h(legend, data, labels)

render(opt)
```

# Piled Horizontal Bar chart: bar4.html

```julia
using ECharts

#### each column is a set of data
data = rand(1:100, 9, 2)

#### legend of data
legend=["a", "b"]

#### label of data
labels = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

opt= ec_bar_piled_h(legend, data, labels)

render(opt)
```

# Waterfall chart: bar6.html

```julia
using ECharts

#### each column is a set of data
data = [900, 345, 393, -108, -154, 135, 178, 286, -119, -361, -203]

#### legend of data
legend=["income", "outcome"]

#### label of data
labels = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven"]

opt= ec_waterfall(legend, data, labels)

render(opt)
```