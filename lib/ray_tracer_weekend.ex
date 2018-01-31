defmodule RayTracerWeekend do
  @nx 200
  @ny 100

  def product([ir, ig, ib]) do
    "#{ir} #{ig} #{ib}\n"
  end

  def to_image(rgbs) do
     rgb_str = rgbs
      |> Enum.concat()
      |> Enum.map(fn(rgb) ->
        rgb |> product()
      end)
      |> Enum.join()
    "P3\n#{@nx} #{@ny}\n255\n" <> rgb_str
  end

  def main(_opts) do
    0..(@ny-1) |> Enum.map(fn(j) ->
      0..(@nx-1) |> Enum.map(fn(i) ->
        col = Vec3.new(i/@nx, (@ny-j-1)/@ny, 0.2)
        ir = round(255.99*(col.r))
        ig = round(255.99*(col.g))
        ib = round(255.99*(col.b))
        [ir, ig, ib]
      end)
    end)
    |> to_image
    |> IO.puts
  end
end
