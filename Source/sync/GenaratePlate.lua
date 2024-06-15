local numset = {} -- [0-9]
local charset = {} -- [A-Z]
for c = 48, 57  do table.insert(numset, string.char(c)) end
for c = 65, 90  do table.insert(charset, string.char(c)) end

function randomNumber(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.time())
    return randomNumber(length - 1) .. numset[math.random(1, #numset)]
end

function randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.time())
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

function GenaratePlate()
    local plate = randomString(3) .. ' ' .. randomNumber(3)

    while not Quries.isPlateAvailable(plate) do
        plate = randomString(3) .. ' ' .. randomNumber(3)
    end

    return string.upper(plate)
end

exports('GenaratePlate', GenaratePlate)