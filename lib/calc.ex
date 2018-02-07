defmodule Calc do
  import Kernel, except: [+: 2, -: 2, +: 1, -: 1, *: 2, /: 2]

  def +vec when is_map(vec),        do: Vec3.+(vec)
  def -vec when is_map(vec),        do: Vec3.-(vec)
  def +value when is_number(value), do: :erlang.+(value)
  def -value when is_number(value), do: :erlang.-(value)

  def l + r when is_map(l) and is_map(r),   do: Vec3.+(l,r)
  def l - r when is_map(l) and is_map(r),   do: Vec3.-(l,r)
  def l * r when is_map(l) and is_map(r),   do: Vec3.*(l,r)
  def l / r when is_map(l) and is_map(r),   do: Vec3./(l,r)
  def l * r when is_float(l) and is_map(r), do: Vec3.*(l,r)
  def l / r when is_map(l) and is_float(r), do: Vec3./(l,r)
  def l * r when is_map(l) and is_float(r), do: Vec3.*(l,r)
  def l + r, do: :erlang.+(l,r)
  def l - r, do: :erlang.-(l,r)
  def l * r, do: :erlang.*(l,r)
  def l / r, do: :erlang./(l,r)
end
