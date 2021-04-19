using CSV


FILE_CONSTRUCTORS = "./resources/f1_data_set/constructors.csv" 
FILE_DRIVERS = "./resources/f1_data_set/drivers.csv" 

function main()
    user_input = print_main()
    run_user_input(user_input)
end

function print_main()
    println("Let's race with the F1 data.")
    println("0: Display Constructors")
    println("1: Display Drivers")
    print("\nYour choice: ")
    user_choice = readline()

    return parse(Int64, user_choice)
end

function run_user_input(user_input::Int64)
    if user_input == 0
        display_constructors()
    elseif user_input == 1
        display_drivers()
    end
end

function display_constructors()
    obj_constructor = CSV.File(FILE_CONSTRUCTORS)
    for row in obj_constructor
        print(row)
    end
end

function display_drivers()
    obj_drivers = CSV.File(FILE_DRIVERS)
    for row in obj_drivers
        print(row)
    end
end


main()