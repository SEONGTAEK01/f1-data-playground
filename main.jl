using CSV


PATH_CSV_FILE = "/Users/seong-taekhong/dev/f1-data-playground/resources/f1_data_set/constructors.csv" 

function main()
    user_input = print_main()
    run_user_input(user_input)
end

function print_main()
    println("Let's race with the F1 data.")
    println("0: Display Constructors\n")
    print("Your choice: ")
    user_choice = readline()

    return parse(Int64, user_choice)
end

function run_user_input(user_input::Int64)
    if user_input == 0
        obj_constructor = CSV.File(PATH_CSV_FILE)
        for row in obj_constructor
            print(row)
        end
    end
end


main()