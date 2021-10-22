include("../data_base/database_operation.jl")

using StatsPlots
using DataFrames


function create_figure(table_in)
    @df table_in scatter(:raceId, :time)
    savefig("public/img/result.png")
end

# load_other_data()
# create_figure(TABLE_PIT_STOPS)