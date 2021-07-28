include("src/data_base/database_loader.jl")
include("src/data_base/database_operation.jl")


function main()
    load_all_csv_to_table()
end

main()

