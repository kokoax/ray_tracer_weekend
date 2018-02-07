defmodule RayTest do
  use ExUnit.Case
  doctest Ray

  test "test equaly" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    r1 = Ray.new(v1,v2)
    r2 = Ray.new(v2,v1)
    assert r1 == Ray.new(v1,v2)
    assert r1 == r1
    assert r1 != r2
  end
  test "test origin" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    r1 = Ray.new(v1,v2)
    assert Ray.origin(r1) == v1
  end
  test "test direction" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    r1 = Ray.new(v1,v2)
    assert Ray.direction(r1) == v2
  end
  test "test point_at_parameter" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    t = 2.0
    r1 = Ray.new(v1,v2)
    assert Ray.point_at_parameter(r1,t) == Vec3.+(v1, Vec3.*(t,v2))
  end
end
