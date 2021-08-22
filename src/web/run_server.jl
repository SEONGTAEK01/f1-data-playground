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

    route("/circuits.txt") do
        respond(format_circuits(get_circuits_data()), :text)
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
    result = "Constructor ID\tName\t\tNationality\tWiki URL\n"
    for row in table_constructors
        id = rpad(string(row.constructorId), 16, " ")
        name = rpad(string(row.name), 16, " ")
        nationality = rpad(string(row.nationality), 16, " ")
        url = string(row.url)

        result = result * id * name * nationality * url * "\n"
    end
    return result
end

function format_circuits(table_circuits)
    # Table column example
    # circuitId,circuitRef,name,location,country,lat,lng,alt,url
    result = "ID\tCircuit Reference\tCircuit Name\t\t\t\tLocation\t\tCountry\t\tLatitude\tLongitude\tAltitude\tURL\n"
    for row in table_circuits
        id = rpad(string(row.circuitId), 8, " ")
        ref = rpad(string(row.circuitRef), 24, " ")
        name = rpad(string(row.name), 40, " ")
        location = rpad(string(row.location), 24, " ")
        country = rpad(string(row.country), 16, " ")
        latitude = rpad(string(row.lat), 16, " ")
        longitude = rpad(string(row.lng), 16, " ")
        altitude = rpad(string(row.alt), 16, " ")
        url = rpad(string(row.url), 16, " ")

        result = result * id * ref * name * location * country * latitude * longitude * altitude * url * "\n"
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