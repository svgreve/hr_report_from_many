defmodule HrReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "hr_test.csv"

      response = HrReport.build(file_name)

      expected_response = %{
        all_hours: %{
          cleiton: 12,
          daniele: 21,
          danilo: 7,
          diego: 12,
          giuliano: 14,
          jakeliny: 22,
          joseph: 13,
          mayk: 19,
          rafael: 7
        },
        hours_per_month: %{
          cleiton: %{junho: 4, outubro: 8},
          daniele: %{abril: 7, dezembro: 5, junho: 1, maio: 8},
          danilo: %{abril: 1, fevereiro: 6},
          diego: %{abril: 4, agosto: 4, dezembro: 1, setembro: 3},
          giuliano: %{abril: 1, fevereiro: 9, maio: 4},
          jakeliny: %{julho: 8, março: 14},
          joseph: %{dezembro: 2, março: 3, novembro: 5, setembro: 3},
          mayk: %{dezembro: 5, julho: 7, setembro: 7},
          rafael: %{julho: 7}
        },
        hours_per_year: %{
          cleiton: %{"2016": 3, "2020": 9},
          daniele: %{"2016": 10, "2017": 3, "2018": 7, "2020": 1},
          danilo: %{"2018": 1, "2019": 6},
          diego: %{"2016": 3, "2017": 8, "2019": 1},
          giuliano: %{"2017": 3, "2019": 6, "2020": 5},
          jakeliny: %{"2016": 8, "2017": 8, "2019": 6},
          joseph: %{"2017": 3, "2019": 3, "2020": 7},
          mayk: %{"2016": 7, "2017": 8, "2019": 4},
          rafael: %{"2017": 7}
        }
      }

      assert response == expected_response
    end
  end

  describe "build_from_many/1" do
    test "when a list of file names is provided build the report" do
      file_names = ["hr_test.csv", "hr_test.csv"]
      response = HrReport.build_from_many(file_names)

      expected_response =
        {:ok,
         %{
           all_hours: %{
             cleiton: 24,
             daniele: 42,
             danilo: 14,
             diego: 24,
             giuliano: 28,
             jakeliny: 44,
             joseph: 26,
             mayk: 38,
             rafael: 14
           },
           hours_per_month: %{
             cleiton: %{junho: 8, outubro: 16},
             daniele: %{abril: 14, dezembro: 10, junho: 2, maio: 16},
             danilo: %{abril: 2, fevereiro: 12},
             diego: %{abril: 8, agosto: 8, dezembro: 2, setembro: 6},
             giuliano: %{abril: 2, fevereiro: 18, maio: 8},
             jakeliny: %{julho: 16, março: 28},
             joseph: %{dezembro: 4, março: 6, novembro: 10, setembro: 6},
             mayk: %{dezembro: 10, julho: 14, setembro: 14},
             rafael: %{julho: 14}
           },
           hours_per_year: %{
             cleiton: %{"2016": 6, "2020": 18},
             daniele: %{"2016": 20, "2017": 6, "2018": 14, "2020": 2},
             danilo: %{"2018": 2, "2019": 12},
             diego: %{"2016": 6, "2017": 16, "2019": 2},
             giuliano: %{"2017": 6, "2019": 12, "2020": 10},
             jakeliny: %{"2016": 16, "2017": 16, "2019": 12},
             joseph: %{"2017": 6, "2019": 6, "2020": 14},
             mayk: %{"2016": 14, "2017": 16, "2019": 8},
             rafael: %{"2017": 14}
           }
         }}

      assert response == expected_response
    end

    test "when a list of file names is not provided, return error" do
      response = HrReport.build_from_many(nil)
      expected_response = {:error, "Please provide a list of file names."}

      assert response == expected_response
    end
  end
end
