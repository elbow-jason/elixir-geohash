defmodule GeohashTest do
  use ExUnit.Case
  doctest Geohash

  test "Geohash.encode" do
    assert Geohash.encode(57.64911, 10.40744) == "u4pruydqqvj"
    assert Geohash.encode(50.958087, 6.9204459) == "u1hcvkxk65f"
    assert Geohash.encode(39.51, -76.24, 10) == "dr1bc0edrj"
    assert Geohash.encode(42.6, -5.6, 5) == "ezs42"
    assert Geohash.encode(0, 0) == "s0000000000"
    assert Geohash.encode(0, 0, 2) == "s0"
    assert Geohash.encode(57.648, 10.410, 6) == "u4pruy"
    assert Geohash.encode(-25.38262, -49.26561, 8) == "6gkzwgjz"
  end

  test "Geohash.decode_to_bits" do
    assert Geohash.decode_to_bits("ezs42") == <<0b0110111111110000010000010::25>>
  end

  test "Geohash.decode" do
    assert Geohash.decode("ww8p1r4t8") == {37.832386, 112.558386}
    assert Geohash.decode("ezs42") == {42.605, -5.603}
    assert Geohash.decode("u4pruy") == {57.648, 10.410}
    assert Geohash.decode('6gkzwgjz') == {-25.38262, -49.26561}
  end

  test "Geohash.encode matches elasticsearch geohash example" do
    assert Geohash.encode(51.501568, -0.141257, 1)  == "g"
    assert Geohash.encode(51.501568, -0.141257, 2)  == "gc"
    assert Geohash.encode(51.501568, -0.141257, 3)  == "gcp"
    assert Geohash.encode(51.501568, -0.141257, 4)  == "gcpu"
    assert Geohash.encode(51.501568, -0.141257, 5)  == "gcpuu"
    assert Geohash.encode(51.501568, -0.141257, 6)  == "gcpuuz"
    assert Geohash.encode(51.501568, -0.141257, 7)  == "gcpuuz9"
    assert Geohash.encode(51.501568, -0.141257, 8)  == "gcpuuz94"
    assert Geohash.encode(51.501568, -0.141257, 9)  == "gcpuuz94k"
    assert Geohash.encode(51.501568, -0.141257, 10) == "gcpuuz94kk"
    assert Geohash.encode(51.501568, -0.141257, 11) == "gcpuuz94kkp"
    assert Geohash.encode(51.501568, -0.141257, 12) == "gcpuuz94kkp5"
  end

end
