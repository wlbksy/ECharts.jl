# Standard Line chart: line1.html

```julia
using ECharts

#### each column is a set of data
data=rand(1:1000, 5, 2)

#### legend of data
legend=["a", "b"]

#### label of data
labels = ["one", "two", "three", "four", "five"]

opt= ec_line(legend, data, labels)
#### labels could be omitted
# opt= ec_line(legend, data)
#### disable smooth plot
# opt= ec_line(legend, data, labels; smooth = false)

#### visible control of toolbox
# ec_set_visible_toolbox(opt, false)

render(opt)
```

# Piled Line chart: line2.html

```julia
using ECharts

#### each column is a set of data
data=rand(1:1000, 5, 2)

#### legend of data
legend=["a", "b"]

#### label of data
labels = ["one", "two", "three", "four", "five"]

opt= ec_line_piled(legend, data, labels)

render(opt)
```

# Standard Area chart: line3.html

```julia
using ECharts

#### each column is a set of data
data = rand(1:1000, 7, 3)

#### legend of data
legend=["a", "b", "c"]

#### label of data
labels = ["one", "two", "three", "four", "five", "six", "seven"]

opt= ec_area(legend, data, labels)

render(opt)
```

# Piled Area chart: line4.html

```julia
using ECharts

#### each column is a set of data
data = rand(1:1000, 7, 3)

#### legend of data
legend=["a", "b", "c"]

#### label of data
labels = ["one", "two", "three", "four", "five", "six", "seven"]

opt= ec_area_piled(legend, data, labels)

render(opt)
```

# Standard Horizontal Line chart: line5.html

```julia
using ECharts

#### each column is a set of data
data = [15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5]

#### legend of data
legend=["a"]

#### label of data
labels = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

opt= ec_line_h(legend, data, labels)

render(opt)
```