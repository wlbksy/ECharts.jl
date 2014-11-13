# Simple Force chart: force1.html

This is infect undirected graph.
```julia
using ECharts

lengendLabel = ["core", "family", "friends"]

nodesLabel = ["one", "two", "three", "four", "five", "six", "seven",
    "eight", "nine", "ten", "eleven"]

srcNodes = [1,2,3,4,5,6,7,8,9,10,3,6,6,6,6,7,7,9]
tgtNodes = [0,0,0,0,0,0,0,0,0,0,2,2,3,4,5,6,3,6]

nodesCategories = [0,1,1,1,1,2,2,2,2,2,2]
nodesWeight = [10,2,3,3,7,5,8,9,4,4,1]
edgesWeight = [1,2,1,2,3,6,6,1,1,1,1,1,1,1,1,6,1,1]

opt = ec_force(nodesLabel, srcNodes, tgtNodes; legendlist = lengendLabel,
    nodesCategories = nodesCategories, nodesWeight = nodesWeight,
    edgesWeight = edgesWeight)

render(opt)
```