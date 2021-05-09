using CSV
using Plots


FILE_CONSTRUCTORS = "./resources/f1_data_set/constructors.csv" 
FILE_DRIVERS = "./resources/f1_data_set/drivers.csv"
FILE_PIT_STOP_TIME = "./resources/f1_data_set/pit_stops.csv" 
FILE_DRIVER_STANDINGS = "./resources/f1_data_set/driver_standings.csv"

TARGET_FILE_DICT = Dict(
    1=>FILE_CONSTRUCTORS,
    2=>FILE_DRIVERS,
    3=>FILE_DRIVER_STANDINGS,
)

function main()
    user_input = print_main()
    obj_file = CSV.File(TARGET_FILE_DICT[user_input])
    print(obj_file)

    if user_input == 1 || user_input == 2
        display_data(obj_file)
    elseif user_input == 3
        display_driver_standings(obj_file)
    end
end

function print_main()
    println("Let's race with the F1 data.")
    println("1: Display Constructors")
    println("2: Display Drivers")
    println("3: Display Driver Standings")

    print("\nYour choice: ")
    user_choice = readline()

    return parse(Int64, user_choice)
end

function display_data(obj_file)
    for row in obj_file
        print(row)
    end
end

function display_driver_standings(obj_file)
    # FIXME: update below code
    for row in obj_file
        print(row)
    end
end

main()
