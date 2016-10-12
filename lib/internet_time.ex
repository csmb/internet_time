defmodule InternetTime do

  @moduledoc """
  This is the InternetTime module. It provides methods for presenting current beat time
  as well as providing the beat time, given a DateTime in Central European Time.
  """

  @doc """
  Returns the current Swatch Interent Time beat time.

  Returns `:ok`.

  ## Examples

      iex(1)> InternetTime.current_beat_time(6)
      180.123456

  """
  def current_beat_time(max_precision \\ 1) do
    beats = (DateTime.utc_now.second + (DateTime.utc_now.minute * 60) + ((DateTime.utc_now.hour * 3600))) / 86.4
    Float.round(beats, max_precision)
  end

  @doc """
  Returns the beat time given a DateTime object in Central European Time (+01:00 CET).

  Returns `:ok`.

  ## Examples

      iex(1)> datetime = %DateTime{calendar: Calendar.ISO, year: 1985, month: 6, day: 14, hour: 4, minute: 20, second: 0, \
                                   std_offset: 0, utc_offset: 3600, time_zone: "Europe/Stockholm", zone_abbr: "CET"}
      iex(2)> InternetTime.beat_time_at(datetime)
      180.6

  """
  def beat_time_at(datetime, max_precision \\ 1) do
    beats = (datetime.second + (datetime.minute * 60) + ((datetime.hour * 3600))) / 86.4
    Float.round(beats, max_precision)
  end
end
