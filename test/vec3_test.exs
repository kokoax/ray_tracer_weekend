defmodule Vec3Test do
  use ExUnit.Case
  doctest Vec3

  test "vec3 equaly" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    assert v1 == v1
    assert v1 == Vec3.new(1.0,2.0,3.0)
    assert v1 != v2
  end

  test "a+b test" do
    v1  = Vec3.new(1.0,2.0,3.0)
    v2  = Vec3.new(4.0,5.0,6.0)
    ans = Vec3.new(5.0,7.0,9.0)
    assert Vec3.+(v1,v2) == ans
  end
  test "a-b test" do
    v1  = Vec3.new(1.0,2.0,3.0)
    v2  = Vec3.new(4.0,5.0,6.0)
    ans = Vec3.new(-3.0,-3.0,-3.0)
    assert Vec3.-(v1,v2) == ans
  end
  test "a*b test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    n  = 2.0
    ans1 = Vec3.new(4.0,10.0,18.0)
    ans2 = Vec3.new(2.0,4.0,6.0)
    ans3 = Vec3.new(8.0,10.0,12.0)
    assert Vec3.*(v1,v2) == ans1
    assert Vec3.*(v1,n) == ans2
    assert Vec3.*(n,v2) == ans3
  end
  test "a/b test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    n  = 2.0
    ans1 = Vec3.new(1.0/4,2.0/5,3.0/6)
    ans2 = Vec3.new(1.0/2,2.0/2,3.0/2)
    ans3 = Vec3.new(4.0/2,5.0/2,6.0/2)
    assert Vec3./(v1,v2) == ans1
    assert Vec3./(v1,n) == ans2
    assert Vec3./(v2,n) == ans3
  end
  test "+a test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    assert Vec3.+(v1) == v1
  end
  test "-a test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    m1 = Vec3.new(-1.0,-2.0,-3.0)
    assert Vec3.-(v1) == m1
  end
  test "dot test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    ans1 = 32.0
    assert Vec3.dot(v1,v2) == ans1
  end
  test "cross test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    ans1 = Vec3.new((v1.y*v2.z)-(v1.z*v2.y),(-(v1.x*v2.z))-(v1.z*v2.x),(v1.x*v2.y)-(v1.y*v2.x))
    assert Vec3.cross(v1,v2) == ans1
  end
end
