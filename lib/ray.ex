defmodule Ray do
  defstruct [a: %Vec3{}, b: %Vec3{}]

  import Kernel, except: [+: 2, -: 2, +: 1, -: 1, *: 2, /: 2]
  import Vec3
  def new(v1, v2) do
    %Ray {
      a: v1,
      b: v2,
    }
  end
  def origin(v) do
    v.a
  end
  def direction(v) do
    v.b
  end
  def point_at_parameter(v, t) do
    (v.a + (t*v.b))
  end
end

