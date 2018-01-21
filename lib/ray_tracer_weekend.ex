defmodule RayTracerWeekend do
  @nx 200
  @ny 100

  def main(_opts) do
    "P3\n#{@nx} #{@ny}\n255" |> IO.puts
    0..(@ny-1) |> Enum.map(fn(j) ->
      0..(@nx-1) |> Enum.map(fn(i) ->
        r = i / @nx
        g = (@ny-j-1) / @ny
        b = 0.2
        ir = round(255.99*r)
        ig = round(255.99*g)
        ib = round(255.99*b)
        "#{ir} #{ig} #{ib}"
      end)
    end)
    |> Enum.map(fn(items) ->
      items |> Enum.map(fn(rgb) ->
        rgb |> IO.puts
      end)
    end)
  end
end
