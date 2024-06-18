Discord = {}

Discord.Webhook = true

Discord.GiveCar = function(xPlayer, plate, xTarget, model)
    local text = ('ผู้เล่น %s ได้เสกรถ %s ป้ายทะเบียน %s ให้ผู้เล่น %s'):format(xPlayer.getName(),model,plate,xTarget.getName())
    pcall(function()
        exports['azael_dc-serverlogs']:insertData({
            event = 'GiveCarKeys',
            content = text,
            source = xPlayer.source,
            color = 1
        })
    end)
end

Discord.Delcar = function(xPlayer, plate, xTarget)
    local text = ('ผู้เล่น %s ได้ลบรถ ป้ายทะเบียน %s ของผู้เล่น %s'):format(xPlayer.getName(),plate,xTarget.getName())
    pcall(function()
        exports['azael_dc-serverlogs']:insertData({
            event = 'DelCarKeys',
            content = text,
            source = xPlayer.source,
            color = 1
        })
    end)
end
