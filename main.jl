using CSV


FILE_CONSTRUCTORS = "./resources/f1_data_set/constructors.csv" 
FILE_DRIVERS = "./resources/f1_data_set/drivers.csv"
FILE_PIT_STOP_TIME = "./resources/f1_data_set/pit_stops.csv" 

TARGET_FILE_DICT = Dict(
    1=>FILE_CONSTRUCTORS,
    2=>FILE_DRIVERS,
    3=>FILE_PIT_STOP_TIME,
)

function main()
    user_input = print_main()
    display_data(TARGET_FILE_DICT[user_input])
end

function print_main()
    println("Let's race with the F1 data.")
    println("1: Display Constructors")
    println("2: Display Drivers")
    println("3: Display Pit Stop Times")

    print("\nYour choice: ")
    user_choice = readline()

    return parse(Int64, user_choice)
end

function display_data(file)
    obj_file = CSV.File(file)
    for row in obj_file
        print(row)
    end
end

main()