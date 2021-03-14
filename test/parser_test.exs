defmodule GenReport.ParserTest do
  use ExUnit.Case

  alias HrReport.Parser

  describe "parse_file/1" do
    test "parses the file" do
      file_name = "hr_test.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        [:daniele, 7, "29", :abril, :"2018"],
        [:mayk, 4, "9", :dezembro, :"2019"],
        [:daniele, 5, "27", :dezembro, :"2016"],
        [:mayk, 1, "2", :dezembro, :"2017"],
        [:giuliano, 3, "13", :fevereiro, :"2017"],
        [:cleiton, 1, "22", :junho, :"2020"],
        [:giuliano, 6, "18", :fevereiro, :"2019"],
        [:jakeliny, 8, "18", :julho, :"2017"],
        [:joseph, 3, "17", :março, :"2017"],
        [:jakeliny, 6, "23", :março, :"2019"],
        [:cleiton, 3, "20", :junho, :"2016"],
        [:daniele, 5, "1", :maio, :"2016"],
        [:giuliano, 1, "2", :abril, :"2020"],
        [:daniele, 3, "5", :maio, :"2017"],
        [:daniele, 1, "26", :junho, :"2020"],
        [:diego, 3, "11", :setembro, :"2016"],
        [:mayk, 7, "28", :julho, :"2017"],
        [:mayk, 7, "3", :setembro, :"2016"],
        [:danilo, 6, "28", :fevereiro, :"2019"],
        [:diego, 4, "15", :agosto, :"2017"],
        [:cleiton, 8, "3", :outubro, :"2020"],
        [:giuliano, 4, "24", :maio, :"2020"],
        [:rafael, 7, "1", :julho, :"2017"],
        [:danilo, 1, "7", :abril, :"2018"],
        [:diego, 1, "10", :dezembro, :"2019"],
        [:joseph, 5, "3", :novembro, :"2020"],
        [:diego, 4, "2", :abril, :"2017"],
        [:joseph, 3, "10", :setembro, :"2019"],
        [:jakeliny, 8, "15", :março, :"2016"],
        [:joseph, 2, "27", :dezembro, :"2020"]
      ]

      assert response == expected_response
    end
  end
end
