using Genie
using Genie.Router
using Genie.Renderer


include("../data_base/database_loader.jl")
include("../data_base/database_operation.jl")


function set_routers()
    route("/") do
        respond("Hello :)", :text)
        
    end

    route("/drivers_profile.txt") do
        respond(format_drivers_profile(get_drivers_profile()), :text)
    end

    route("/constructors.txt") do
        respond(format_constructors(get_constructors_profile()), :text)
    end
end

function format_drivers_profile(table_drivers)
    # Table row example
    # (driverId = 1, driverRef = "hamilton", number = "44", code = "HAM", 
    # forename = "Lewis", surname = "Hamilton", dob = Dates.Date("1985-01-07"), 
    # nationality = "British", url = "http://en.wikipedia.org/wiki/Lewis_Hamilton")
    result = "Driver ID\tDriver Name\t\t Date of Birth\tNationality\tURL\n"
    for row in table_drivers
        driver_id = rpad(string(row.driverId), 16, " ")
        surname = rpad(string(row.surname), 25, " ")
        date_of_birth = rpad(string(row.dob), 15, " ")
        nationality = rpad(string(row.nationality), 16, " ")
        url = string(row.url)

        result = result * driver_id * surname * date_of_birth * nationality * url * "\n"
    end
    return result
end

function format_constructors(table_constructors)
    # Table column example
    # constructorId, constructorRef, name, nationality,url
    result = "Name\t\tNationality\tWiki URL\n"
    for row in table_constructors
        name = rpad(string(row.name), 16, " ")
        nationality = rpad(string(row.nationality), 16, " ")
        url = string(row.url)

        result = result * name * nationality * url * "\n"
    end
    return result
end

function run_server()
    up(8001, async=false)
end

function main()
    load_all_csv_to_table()
    set_routers()
    run_server()
end


main()