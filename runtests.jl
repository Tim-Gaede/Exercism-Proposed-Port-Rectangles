using Test

include("rectangles.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.1.0
println("\n"^2, "-"^60, "\n"^3)

@testset "no rows" begin
    @test rectangles([]) == 0
end
println()

@testset "no columns" begin
    @test rectangles([""]) == 0
end
println()

@testset "no rectangles" begin
    @test rectangles([" "]) == 0
end
println()

@testset "one rectangle" begin
    strings = ["+-+",
               "| |",
               "+-+"]
    @test rectangles(strings) == 1
end
println()

@testset "two rectangles without shared parts" begin
    strings = ["  +-+",
               "  | |",
               "+-+-+",
               "| |  ",
               "+-+  "]
    @test rectangles(strings) == 2
end
println()

@testset "five rectangles with shared parts" begin
    strings = ["  +-+",
               "  | |",
               "+-+-+",
               "| | |",
               "+-+-+"]
    @test rectangles(strings) == 5
end
println()

@testset "rectangle of height 1 is counted" begin
    strings = ["+--+",
               "+--+"]
    @test rectangles(strings) == 1
end
println()

@testset "rectangle of width 1 is counted" begin
    strings = ["++",
               "||",
               "++"]
    @test rectangles(strings) == 1
end
println()

@testset "1x1 square is counted" begin
    strings = ["++",
               "++"]
    @test rectangles(strings) == 1
end
println()

@testset "only complete rectangles are counted" begin
    strings = ["  +-+",
               "    |",
               "+-+-+",
               "| | -",
               "+-+-+"]
    @test rectangles(strings) == 1
end
println()

@testset "rectangles can be of different sizes" begin
    strings = ["+------+----+",
               "|      |    |",
               "+---+--+    |",
               "|   |       |",
               "+---+-------+"]
    @test rectangles(strings) == 3
end
println()

@testset "corner is required for a rectangle to be complete" begin
    strings = ["+------+----+",
               "|      |    |",
               "+------+    |",
               "|   |       |",
               "+---+-------+"]
    @test rectangles(strings) == 2
end
println()

@testset "large input with many rectangles" begin
    strings = ["+---+--+----+",
               "|   +--+----+",
               "+---+--+    |",
               "|   +--+----+",
               "+---+--+--+-+",
               "+---+--+--+-+",
               "+------+  | |",
               "          +-+"]
    @test rectangles(strings) == 60
end
println()
