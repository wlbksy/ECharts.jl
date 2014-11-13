# ECharts

A julia package for [ECharts](https://github.com/ecomfe/echarts)

## Install

    Pkg.clone("https://github.com/wlbksy/ECharts.jl")

## Usage

Please read examples in `doc/`.

Each time you call `render(opt)`, you're using the local javascript. If you call `render(opt; online = true)`, you're using javascript online. The latter is not in the control of this repo.

[Windows] Generated webpage lies in current directory  You should open it by yourself. 

[Unix] Generated webpage should be opened by itself. 