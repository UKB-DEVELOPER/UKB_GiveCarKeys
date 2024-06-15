ESX = nil
TriggerEvent(Base.Server, function(obj) ESX = obj end)

RegisterCommand(Cmd.Command.customPlate, function(source, args)
	givevehicleCustomPlate(source, args)
end)

RegisterCommand(Cmd.Command.randomPlate, function(source, args)
	givevehicleRandomPlate(source, args)
end)

function givevehicleCustomPlate(_source, _args)
	if havePermission(_source) then
		if _args[1] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่ ID ของผู้เล่น')
		elseif _args[2] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่โมเดลรถ')
		elseif _args[3] == nil or _args[4] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่ป้ายทะเบียน')
		elseif _args[5] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่ประเภทรถ')
		else
			local plate = _args[3]..' '.._args[4]
			plate = string.upper(plate)
			if not Quries.isPlateAvailable(plate) then
				Notify.NotifyServer(_source, 'error', 'ป้ายทะเบียนนี้ถูกใช้แล้ว')
				return
			end
			TriggerClientEvent('UKB_GiveCarKeys:spawnVehiclePlate', _source, _args[1], _args[2], plate, _args[5])
		end
	else
		Notify.NotifyServer(_source, 'error', 'คุณไม่มีสิทธิ์ใช้คำสั่งนี้')
	end
end

function givevehicleRandomPlate(_source, _args)
	if havePermission(_source) then
		if _args[1] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่ ID ของผู้เล่น')
		elseif _args[2] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่โมเดลรถ')
		elseif _args[3] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่ประเภทรถ')
		else
			local plate = GenaratePlate()
			plate = string.upper(plate)
			TriggerClientEvent('UKB_GiveCarKeys:spawnVehiclePlate', _source, _args[1], _args[2], plate, _args[3])
		end
	else
		Notify.NotifyServer(_source, 'error', 'คุณไม่มีสิทธิ์ใช้คำสั่งนี้')
	end
	
end

RegisterCommand(Cmd.Command.delcar, function(source, args)
	if havePermission(source) then
		if args[1] == nil then
			Notify.NotifyServer(_source, 'error', 'กรุณาใส่ ID ของผู้เล่น')
		elseif args[2] == nil or args[3] == nil then
			Notify.NotifyServer(source, 'error', 'กรุณาใส่ป้ายทะเบียนที่จะลบ')
		else
			local target = args[1]
			local xTarget = ESX.GetPlayerFromId(target)
			if not xTarget then 
				Notify.NotifyServer(source, 'error', 'ผู้เล่นนั้นไม่ได้อยู่ในเกม')
				return
			end
			local plate = args[2]..' '..args[3]
			plate = string.upper(plate)
			Quries.DeleteVehicle(plate)
			Sync.AfterDelVehicle(xTarget,plate)
			Notify.NotifyServer(source, 'success', 'ลบรถที่มีป้ายทะเบียน '..plate..' แล้ว')
		end
	else
		Notify.NotifyServer(source, 'error', 'คุณไม่มีสิทธิ์ใช้คำสั่งนี้')
	end		
end)

RegisterServerEvent('UKB_GiveCarKeys:excuteVehicle')
AddEventHandler('UKB_GiveCarKeys:excuteVehicle', function(vehicleProps, playerID, vehicleType, model)
	local source = source
	local target = playerID
	local xTarget = ESX.GetPlayerFromId(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xTarget then
		Quries.ExecuteVehicle(xTarget, vehicleProps, vehicleType)

		Sync.AfterGiveVehicle(xTarget, vehicleProps, vehicleProps.plate)

		Notify.MyVehicle(xPlayer, vehicleProps.plate, xTarget, model)

		Notify.TargetVehicle(xTarget, vehicleProps.plate)

		if Discord.Enable then
			Discord.Webhook(xPlayer, vehicleProps.plate, xTarget, model)
		end
	else
		Notify.NotifyServer(source,'error','ผู้เล่นนั้้นไม่ได้อยุ่ในเกม')
	end
end)

function havePermission(_source)
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playeridentifier = xPlayer.identifier
	for k, v in pairs(Secret.allowIdentifiersToUseCommand) do
		if k == playeridentifier and v then
			return true
		end
	end
	return false
end
