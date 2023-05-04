module Main exposing (main)

import Array exposing (Array)
import Benchmark exposing (Benchmark)
import Benchmark.Runner as Runner

f1 : Int -> Int
f1 a =
    2 * a + 43

f2 : Int -> Int
f2 a =
    89 + a * a // 2

base : Array Int
base =
    Array.fromList (List.range 0 1000)

main =
    Runner.program suite

suite : Benchmark
suite =
    Benchmark.compare "array mapping"
        "single pass"
        (\_ -> Array.map (f1 >> f2) base)
        "separate passes"
        (\_ -> Array.map f1 base |> Array.map f2)
