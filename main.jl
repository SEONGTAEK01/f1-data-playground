using CSV
using Plots


FILE_CONSTRUCTORS = "./resources/f1_data_set/constructors.csv" 
FILE_DRIVERS = "./resources/f1_data_set/drivers.csv"
FILE_PIT_STOP_TIME = "./resources/f1_data_set/pit_stops.csv" 
FILE_RACE_RESULTS = "./resources/f1_data_set/results.csv"
FILE_RACES = "./resources/f1_data_set/races.csv"

TARGET_FILE_DICT = Dict(
    1=>FILE_CONSTRUCTORS,
    2=>FILE_DRIVERS,
    3=>FILE_RACE_RESULTS,
)

function main()
    user_input = print_main()
    file_to_read = TARGET_FILE_DICT[user_input]
    if user_input == 1 || user_input == 2
        display_data(file_to_read)
    elseif user_input == 3
        display_race_results(file_to_read)
    end
end

function print_main()
    println("Let's race with the F1 data.")
    println("1: Display Constructors")
    println("2: Display Drivers")
    println("3: Display Race Results\n")

    print("Your choice: ")
    user_choice = readline()

    return parse(Int64, user_choice)
end

function display_data(file_to_read)
    obj_file = CSV.File(file_to_read)
    for row in obj_file
        print(row)
    end
end

function display_race_results(file_to_read)
    println("Displaying driver standings...")

    save_constructor_id_as_dict()
    save_driver_id_and_name_as_dict()
    save_race_id_as_dict()

    obj_file = CSV.File(file_to_read)
    for row in obj_file
        race_name = get(DICT_RACES, row.raceId, "None")
        driver_name = get(DICT_DRIVERS, row.driverId, "None")
        constructor_name = get(DICT_CONSTRUCTORS, row.constructorId, "None")
        println("$(race_name), $(driver_name), $(constructor_name), Position: $(row.position), Points: $(row.points), Wins: $(row.time)")
    end
end

function save_driver_id_and_name_as_dict()
    println("Saving driver id and name in memory...")
    global DICT_DRIVERS = CSV.File(FILE_DRIVERS, select=[:driverId, :surname]) |> Dict
end

function save_constructor_id_as_dict()
    println("Saving constructor id in memory...")
    global DICT_CONSTRUCTORS = CSV.File(FILE_CONSTRUCTORS, select=[:constructorId, :name]) |> Dict
end


function save_race_id_as_dict()
    println("Saving race id in memory...")
    global DICT_RACES = CSV.File(FILE_RACES, select=[:raceId, :name]) |> Dict
end

main()

