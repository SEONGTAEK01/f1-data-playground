using Genie
using Genie.Router
using Genie.Renderer
# using Genie.Renderer.Html

include("../data_base/database_loader.jl")
include("../data_base/database_operation.jl")


function set_routers()
    route("/") do
        "F1 World! Main!"
    end

    route("/hello") do
        "F1 World! Hello!"
    end

    route("/drivers_profile") do 
        # html(get_drivers_profile())
        drivers_profile = get_drivers_profile()
        string(drivers_profile[1]) * "\n" * string(drivers_profile[2]) * "\n" * string(drivers_profile[3])
        # string(drivers_profile[2])
        # string(drivers_profile[3])
        # string(drivers_profile[4])
        # string(drivers_profile[5])
    end
end

function run_server()
    up()
end

function main()
    load_all_csv_to_table()

    set_routers()
    run_server()
end


main()