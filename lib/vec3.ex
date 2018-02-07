defmodule Vec3 do
  defstruct [e: [], x: 0.0, y: 0.0, z: 0.0, r: 0.0, g: 0.0, b: 0.0]

  import Kernel, except: [+: 2, -: 2, +: 1, -: 1, *: 2, /: 2]
  @e :erlang
  def new(e0, e1, e2) do
    %Vec3 {
      e: [e0,e1,e2],

      x: e0,
      y: e1,
      z: e2,

      r: e0,
      g: e1,
      b: e2,
    }
  end

  def +vec, do: new(vec.x, vec.y, vec.z)
  def -vec, do: new(@e.-(vec.x), @e.-(vec.y), @e.-(vec.z))

  def l + r when is_map(l) and is_map(r), do: new(@e.+(l.x,r.x), @e.+(l.y,r.y), @e.+(l.z,r.z))
  def l - r when is_map(l) and is_map(r), do: new(@e.-(l.x,r.x), @e.-(l.y,r.y), @e.-(l.z,r.z))
  def l * r when is_map(l) and is_map(r), do: new(@e.*(l.x,r.x), @e.*(l.y,r.y), @e.*(l.z,r.z))
  def l / r when is_map(l) and is_map(r), do: new(@e./(l.x,r.x), @e./(l.y,r.y), @e./(l.z,r.z))
  def l * r when is_float(l) and is_map(r), do: new(@e.*(l,r.x), @e.*(l,r.y), @e.*(l,r.z))
  def l / r when is_map(l) and is_float(r), do: new(@e./(l.x,r), @e./(l.y,r), @e./(l.z,r))
  def l * r when is_map(l) and is_float(r), do: new(@e.*(l.x,r), @e.*(l.y,r), @e.*(l.z,r))

  def dot(l, r) do
    Enum.zip(l.e, r.e)
    |> Enum.map(fn({x,y}) ->
      @e.*(x,y)
    end)
    |> Enum.reduce(fn(x,acc) ->
      @e.+(x,acc)
    end)
  end

  def cross(l, r) do
    Vec3.new(
      @e.-(    (@e.*(l.y,r.z)),(@e.*(l.z,r.y))),
      @e.-(@e.-(@e.*(l.x,r.z)),(@e.*(l.z,r.x))),
      @e.-(    (@e.*(l.x,r.y)),(@e.*(l.y,r.x)))
    )
  end

  def at(vec, num), do: vec.e |> Enum.at(num)

  def make_unit_vector(v) do
    k = @e./(1.0, Vec3.length(v))
    Vec3.new(@e.*(v.x,k),@e.*(v.y,k),@e./(v.z,k))
  end

  def unit_vector(v) do
    v / Vec3.length(v)
  end

  def length(vec), do: vec |> squared_length |> :math.sqrt
  def squared_length(%Vec3{e: [e0,e1,e2]}), do: @e.+(@e.+(@e.*(e0,e0), @e.*(e1,e1)), @e.*(e2,e2))

  def dump(%Vec3{e: [e0,e1,e2]}) do
    IO.puts "#{e0} #{e1} #{e2}"
  end
end
