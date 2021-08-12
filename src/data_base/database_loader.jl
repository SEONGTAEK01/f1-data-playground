using JuliaDB

include("database_constants.jl")


function load_all_csv_to_table()
    println("Start loading DB...")

    load_drivers_data()
    load_constructors_data()
    # load_results_data()
    # load_other_data()

    println("Loading DB completed.\n")
end

function load_drivers_data()
    println("> Start loading drivers data...")
    # global TABLE_DRIVER_STANDINGS = loadtable(FILE_DRIVER_STANDINGS, colparsers=Dict(:positionText=>String))
    global TABLE_DRIVERS = loadtable(FILE_DRIVERS)
    println("> Loading drivers data completed.\n")
end

function load_constructors_data()
    println("> Start loading constructors data...")
    global TABLE_CONSTRUCTORS = loadtable(FILE_CONSTRUCTORS)
    # global TABLE_CONSTRUCTOR_RESULTS = loadtable(FILE_CONSTRUCTOR_RESULTS)
    # global TABLE_CONSTRUCTOR_STANDINGS = loadtable(FILE_CONSTRUCTOR_STANDINGS, colparsers=Dict(:positionText=>String))
    println("> Loading constructors data completed.\n")
end

function load_results_data()
    println("> Start loading results data...")
    global TABLE_RESULTS = loadtable(FILE_RESULTS, colparsers=Dict(:number=>String))
    global TABLE_SEASONS = loadtable(FILE_SEASONS)
    global TABLE_QUALIFYING = loadtable(FILE_QUALIFYING)
    println("> Loading results data completed.\n")
end

function load_other_data()
    println("> Start loading other data...")
    global TABLE_CIRCUITS = loadtable(FILE_CIRCUITS)
    global TABLE_LAP_TIMES = loadtable(FILE_LAP_TIMES)
    global TABLE_PIT_STOPS = loadtable(FILE_PIT_STOPS, colparsers=Dict(:duration=>String))
    global TABLE_STATUS = loadtable(FILE_STATUS)
    println("> Loading other data completed.\n")
end
