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
    print_logo()
    user_input = print_main()
    file_to_read = TARGET_FILE_DICT[user_input]
    if user_input == 1 || user_input == 2
        display_data(file_to_read)
    elseif user_input == 3
        display_race_results(file_to_read)
    end
end

function print_logo()
    println("
                                                                                                                                      
                                                                                                                                  
                                 ``.--::///////////////////////////////////////////-`./////////////-                    
                              .:+syyyhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhys:-+yhhhhhhhhhhyo-`                    
                           `:oyhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhys:-+yhhhhhhhhhhyo-                       
                         `:syhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhys:.+yhhhhhhhhhhys-`                        
                       `:syhhhhhhhhhyyyssssooooooooooooooooooooooooooooooooo:.+yhhhhhhhhhhyo:                           
                     `:syhhhhhhhhyyo:-::::///////////////////////////////:`.+yhhhhhhhhhhys-                             
                   `:syhhhhhhhhys/.:oyyhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhys:./yhhhhhhhhhhys:`                              
                 `:shhhhhhhhhyy/.:shhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhys:.+yhhhhhhhhhhys:                                 
                :syhhhhhhhhys/`:syhhhhhhhhhhhhyyyyyyyyyyyyyyyyyyyyyy:./yhhhhhhhhhhys:`                                  
             `:shhhhhhhhhyy:`:shhhhhhhhyyo////////////////////////:./yhhhhhhhhhhys:                                     
            :syhhhhhhhhyy/`-syhhhhhhhhy/`                        `/yhhhhhhhhhhys:`                                      
          -osssssssssss:`.ossssssssss/`                         :sssssssssssss:                                                                                                                                                             
                                                                                                                                 
                                                                                                                                
          ``````````                                                 ``                ````                             
         -mmyyyyyyy:                                                 +m:               syydm:                           
         -Ny ``````  .oyyyyyy+`  -syyys`-hhyyyyyhyyyyyo. `yy     -h: +M/ -yyyyyys/      ``/Mo                           
         -Nd:::::::..dm-````-md -Ny...` :My....sM+...-md``mN     /M+ +M/ `...:smmN+       /Mo                           
         -Nmooooooo-:Ny      hM.-Mo     :Ms    oM:    hN.`mN     /M+ +M/  `/hdo-:Ns       /Mo                           
          -Ny        :Ny      hM`-Mo     :Ms    oM:    hN.`mN     /M+ +M/ +my:`  -Ns       /Mo                           
         -Ny        `yN+::::+ms -Mo     :Ms    oM:    hN. sNs++++yM+ +M/`hNo++++sMs   `/++yMy///`...`                   
         `/:         `-/ooo+/-  `/-     `/-    -/.    :/`  -///////. -/. `:///////-   `/+++++///```.`                   
                                                                                                                                  
    

    ")
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
        race_name = get_data_from_dict(DICT_RACES, row.raceId)
        date_held = get_data_from_dict(DICT_DATE, row.raceId)
        time_held = get_data_from_dict(DICT_TIME, row.raceId)
        driver_name = get_data_from_dict(DICT_DRIVERS, row.driverId)
        constructor_name = get_data_from_dict(DICT_CONSTRUCTORS, row.constructorId)
        println("$(race_name), $(date_held), $(time_held), $(driver_name), $(constructor_name), Position: $(row.position), Points: $(row.points), Wins: $(row.time)")
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
    global DICT_DATE = CSV.File(FILE_RACES, select=[:raceId, :date]) |> Dict
    global DICT_TIME = CSV.File(FILE_RACES, select=[:raceId, :time]) |> Dict
end

function get_data_from_dict(target_dict, key)
    return get(target_dict, key, "None")
end


main()

