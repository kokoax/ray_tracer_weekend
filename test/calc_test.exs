defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  import Kernel, except: [+: 2, -: 2, +: 1, -: 1, *: 2, /: 2]
  import Calc

  test "Vec3 a+b test" do
    v1  = Vec3.new(1.0,2.0,3.0)
    v2  = Vec3.new(4.0,5.0,6.0)
    ans = Vec3.new(5.0,7.0,9.0)
    assert (v1+v2) == ans
  end
  test "Vec3 a-b test" do
    v1  = Vec3.new(1.0,2.0,3.0)
    v2  = Vec3.new(4.0,5.0,6.0)
    ans = Vec3.new(-3.0,-3.0,-3.0)
    assert (v1-v2) == ans
  end
  test "Vec3 a*b test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    n  = 2.0
    ans1 = Vec3.new(4.0,10.0,18.0)
    ans2 = Vec3.new(2.0,4.0,6.0)
    ans3 = Vec3.new(8.0,10.0,12.0)
    assert v1*v2 == ans1
    assert v1*n  == ans2
    assert n*v2  == ans3
  end
  test "Vec3 a/b test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    v2 = Vec3.new(4.0,5.0,6.0)
    n  = 2.0
    ans1 = Vec3.new(1.0/4,2.0/5,3.0/6)
    ans2 = Vec3.new(1.0/2,2.0/2,3.0/2)
    ans3 = Vec3.new(4.0/2,5.0/2,6.0/2)
    assert v1/v2 == ans1
    assert v1/n  == ans2
    assert v2/n  == ans3
  end
  test "Vec3 +a test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    assert +v1 == v1
  end
  test "Vec3 -a test" do
    v1 = Vec3.new(1.0,2.0,3.0)
    m1 = Vec3.new(-1.0,-2.0,-3.0)
    assert (-v1) == m1
  end
  test "Float a+b test" do
    assert (1.0+2.0) == 3.0
  end
  test "Float a-b" do
    assert (1.0-2.0) == -1.0
  end
  test "Float a*b" do
    assert 1.0*2.0 == 2.0
  end
  test "Float a/b test" do
    assert 1.0/2.0 == 0.5
  end
  test "Float -a test" do
    assert -1.0 == -1.0
  end
  test "Float +a test" do
    assert +1.0 == +1.0
  end
end
