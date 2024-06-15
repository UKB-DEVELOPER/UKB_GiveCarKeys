Notify = {}

Notify.NotifyClient = function(type, message)
    pcall(function()
        exports.nc_notify:PushNotification({
            title = 'ระบบ',
            description = message,
            icon = 'default',
            type = type,
            duration = 4000
        })
    end)
end

Notify.NotifyServer = function(playerId, type, message)
    pcall(function()
        exports.nc_notify:PushNotification(playerId, {
            title = 'ระบบ',
            description = message,
            icon = 'default',
            type = type,
            duration = 4000
        })
    end)
end

Notify.TargetVehicle = function(xTarget, plate)
    local text = ('คุณได้รับรถ ป้ายทะเบียน %s จากระบบแล้ว'):format(plate)

    pcall(function()
        exports.nc_notify:PushNotification(xTarget.source, {
            title = 'ระบบ',
            description = text,
            icon = 'default',
            type = 'success',
            duration = 4000
        })
    end)
end

Notify.MyVehicle = function(xPlayer, plate, xTarget, model)

    local text = ('คุณได้เสกรถ %s ป้ายทะเบียน %s ให้ผู้เล่น %s'):format(model,plate,xTarget.getName())

    pcall(function()
        exports.nc_notify:PushNotification(xPlayer.source, {
            title = 'ระบบ',
            description = text,
            icon = 'default',
            type = 'success',
            duration = 4000
        })
    end)
end
