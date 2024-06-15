Quries =  {}


Quries.ExecuteVehicle = function(xPlayer, vehicleProps, vehicleType)
    local data = MySQL.insert.await('INSERT INTO `owned_vehicles` (owner, plate, vehicle, stored, type, target) VALUES (?, ?, ?, ?, ?, ?)', {
        xPlayer.identifier, vehicleProps.plate, json.encode(vehicleProps), 1, vehicleType, 'main_garage'
    })

    return data
end

Quries.isPlateAvailable = function(plate)
    local isPass

    local data = MySQL.query.await('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
    if data[1] then
        isPass = false
    else
        isPass = true
    end

    while isPass == nil do
        Wait(0)
    end

    return isPass

end

Quries.DeleteVehicle = function(plate)
    MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    })

end