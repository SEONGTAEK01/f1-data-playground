include("database_loader.jl")


function get_drivers_profile()
    return TABLE_DRIVERS
end

function get_drivers_standings()
    return TABLE_DRIVER_STANDINGS
end

function get_constructors_profile()
    return TABLE_CONSTRUCTORS
end

function get_constructor_result()
    return TABLE_CONSTRUCTOR_RESULTS
end

function get_constructor_standings()
    return TABLE_CONSTRUCTOR_STANDINGS
end

function get_results_data()
    return TABLE_RESULTS
end

function get_seasons_data()
    return TABLE_SEASONS
end

function get_qualifying_data()
    return TABLE_QUALIFYING
end

