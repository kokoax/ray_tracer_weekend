defmodule RayTracerWeekend do
  @nx 200
  @ny 100

  import Kernel, except: [+: 2, -: 2, +: 1, -: 1, *: 2, /: 2]
  import Calc

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

  def color(ray) do
    unit_direction = Vec3.unit_vector(Ray.direction(ray))
    t = 0.5*(unit_direction.y+1.0)
    (1.0-t) * Vec3.new(1.0,1.0,1.0) + t*Vec3.new(0.5,0.7,1.0)
  end

  def main(_opts) do
    lower_left_corner = Vec3.new(-2.0,-1.0,-1.0)
    horizontal        = Vec3.new(4.0,0.0,0.0)
    vertivcal         = Vec3.new(0.0,2.0,0.0)
    origin            = Vec3.new(0.0,0.0,0.0)
    0..(@ny-1) |> Enum.map(fn(j) ->
      0..(@nx-1) |> Enum.map(fn(i) ->
        u = i/@nx
        v = (@ny-j-1)/@ny
        r = Ray.new(origin, u*horizontal + v*vertivcal + lower_left_corner)
        col = color(r)
        ir = trunc(255.99*col.r)
        ig = trunc(255.99*col.g)
        ib = trunc(255.99*col.b)
        [ir, ig, ib]
      end)
    end)
    |> to_image
    |> IO.puts
  end
end
