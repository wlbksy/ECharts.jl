# Standard Chord chart: chord1.html

```julia
using ECharts

# each column is a set of data
data = [11975 1951  8010  1013;
        5871  10048 16145 990;
        8916  2060  8090  940;
        2868  6171  8045  6907]

legend = ["group1", "group2", "group3", "group4"]

opt = ec_chord(legend, data)

render(opt)
```