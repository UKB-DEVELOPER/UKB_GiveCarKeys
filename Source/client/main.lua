ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Base.Client, function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('UKB_GiveCarKeys:spawnVehiclePlate')
AddEventHandler('UKB_GiveCarKeys:spawnVehiclePlate', function(playerID, model, plate, vehicleType)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle)	
		if DoesEntityExist(vehicle) then
			SetEntityVisible(vehicle, false, false)
			SetEntityCollision(vehicle, false)	
	
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			vehicleProps.plate = plate
			TriggerServerEvent('UKB_GiveCarKeys:excuteVehicle', vehicleProps, playerID, vehicleType, model)
			ESX.Game.DeleteVehicle(vehicle)
		end
	end)	
end)