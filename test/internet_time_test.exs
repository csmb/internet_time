defmodule InternetTimeTest do
  use ExUnit.Case
  doctest InternetTime

  test "beat_time_at midnight CET" do
    datetime = %DateTime{calendar: Calendar.ISO, day: 1, hour: 0, microsecond: {0, 6},
                         minute: 0, month: 1, second: 0, std_offset: 0, time_zone: "Europe/Stockholm",
                         utc_offset: 3600, year: 2016, zone_abbr: "CET"}
    assert InternetTime.beat_time_at(datetime) == 0.0
  end

  test "beat_time_at twelve noon CET" do
    datetime = %DateTime{calendar: Calendar.ISO, day: 1, hour: 12, microsecond: {0, 6},
                         minute: 0, month: 1, second: 0, std_offset: 0, time_zone: "Europe/Stockholm",
                         utc_offset: 3600, year: 2016, zone_abbr: "CET"}
    assert InternetTime.beat_time_at(datetime) == 500.0
  end

  test "beat_time_at 11:59pm CET" do
    datetime = %DateTime{calendar: Calendar.ISO, day: 1, hour: 23, microsecond: {0, 6},
                         minute: 59, month: 1, second: 59, std_offset: 0, time_zone: "Europe/Stockholm",
                         utc_offset: 3600, year: 2016, zone_abbr: "CET"}
    assert InternetTime.beat_time_at(datetime) == 1000.0
  end

  test "rounds the beat to the max precision" do
    datetime = %DateTime{calendar: Calendar.ISO, day: 1, hour: 11, microsecond: {0, 6},
                         minute: 43, month: 1, second: 30, std_offset: 0, time_zone: "Europe/Stockholm",
                         utc_offset: 3600, year: 2016, zone_abbr: "CET"}
    assert InternetTime.beat_time_at(datetime, 6) == 488.541667
  end
end
