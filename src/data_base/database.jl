using JuliaDB

include("database_constants.jl")


function load_all_csv_to_table()
    # FIXME: CSV File loading error occurred!
    println("Start loading DB...")
    global TABLE_CIRCUITS = loadtable(FILE_CIRCUITS)
    global TABLE_CONSTRUCTOR_RESULTS = loadtable(FILE_CONSTRUCTOR_RESULTS)
    # global TABLE_CONSTRUCTOR_STANDINGS = loadtable(FILE_CONSTRUCTOR_STANDINGS)
    # global TABLE_DRIVER_STANDINGS = loadtable(FILE_DRIVER_STANDINGS)
    global TABLE_DRIVERS = loadtable(FILE_DRIVERS)
    global TABLE_LAP_TIMES = loadtable(FILE_LAP_TIMES)
    # global TABLE_PIT_STOPS = loadtable(FILE_PIT_STOPS)
    global TABLE_QUALIFYING = loadtable(FILE_QUALIFYING)
    global TABLE_RACES = loadtable(FILE_RACES)
    # global TABLE_RESULTS = loadtable(FILE_RESULTS)
    global TABLE_SEASONS = loadtable(FILE_SEASONS)
    global TABLE_STATUS = loadtable(FILE_STATUS)
    println("Loading DB completed.")
end
