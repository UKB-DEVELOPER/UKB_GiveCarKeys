Sync = {}

-- @conment ฟังก์ชันนี้ใช้หลังจากให้รถแล้ว
Sync.AfterGiveVehicle = function(xTarget, props, plate)
    pcall(function()
        -- Function นี้ใช้สำหรับเพิ่มยานพาหนะเข้าการาจ (ควรใช้หลังจากเพิ่มข้อมูลยานพาหนะเข้า Database แล้ว)
        exports.nc_garage:AddVehicle(plate)
        exports.nc_garage:UpdateProperties(plate, props, true)
    end)

    pcall(function()
        -- เปลี่ยนแปลงเจ้าของยานพาหนะในระบบของ NC Vehicle Storage
        exports.nc_vehiclestorage:ChangeVehicleOwner(plate, xTarget.identifier)
    end)

    pcall(function()
        exports.nc_garage:SetVehicleStored(plate, 'main_garage')
    end)

    pcall(function()
        -- คำสั่งโหลดข้อมูล Owner ของยานพาหนะใหม่ (Server)
        exports.nc_vehiclekey:ReloadVehicleKey(plate)
    end)

    pcall(function()
        -- ตั้งค่าให้กุญแจอัพเดทในกระเป๋า
        exports.nc_inventory:AddItem(xTarget.source, {
            name = plate,
            type = 'vehicle_key'
        })
    end)

end


-- @conment ฟังก์ชันนี้ใช้หลังจากลบยานพาหนะแล้ว
Sync.AfterDelVehicle = function(xTarget,plate)
    pcall(function()
       -- Function นี้ใช้สำหรับลบยานพาหนะออกจากการาจ (ควรใช้หลังจากลบข้อมูลยานพาหนะออกจาก Database แล้ว)
        exports.nc_garage:RemoveVehicle(plate)
    end)

    pcall(function()
        exports.nc_garage:ReloadVehicleOwner(plate)
    end)

    pcall(function()
        -- คำสั่งโหลดข้อมูล Owner ของยานพาหนะใหม่ (Server)
        exports.nc_vehiclekey:ReloadVehicleKey(plate)
    end)

    pcall(function()
        -- ตั้งค่าให้กุญแจอัพเดทในกระเป๋า
        exports.nc_inventory:RemoveItem(xTarget.source, {
            name = plate,
            type = 'vehicle_key'
        })
    end)
    
end
