using Genie, Genie.Router
using Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json

include("../src/data_base/database_loader.jl")
include("../src/data_base/database_operation.jl")


load_all_csv_to_table()

route("/") do
    respond("Hello F1!", :text)
end

route("/hello.txt") do
    respond(format_drivers_profile(get_drivers_profile()), :text)
end

route("/hello.json") do
    json("Hello World JSON")
end

function format_drivers_profile(table_drivers)
    # Table row example
    # (driverId = 1, driverRef = "hamilton", number = "44", code = "HAM", 
    # forename = "Lewis", surname = "Hamilton", dob = Dates.Date("1985-01-07"), 
    # nationality = "British", url = "http://en.wikipedia.org/wiki/Lewis_Hamilton")
    result = "Driver ID\tDriver Name\t\t Date of Birth\n"
    for row in table_drivers
        driver_id = rpad(string(row.driverId), 16, " ")
        surname = rpad(string(row.surname), 25, " ")
        date_of_birth = string(row.dob)

        result = result * driver_id * surname * date_of_birth * "\n"
    end
    return result
end

up(8001, async=false)   