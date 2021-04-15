function chat(_message)
    TriggerEvent('chat:addMessage', {
        color = { 255, 255, 255},
        multiline = true,
        args = {"[Stat Test]", _message}
      })
end


function statSet(cash, bank)
    StatSetInt('MP0_WALLET_BALANCE', cash, true) --setting cash value. Floats usually break it.
    StatSetInt('BANK_BALANCE', bank, true) --setting bank value. Floats usually break it.
    Wait(100)
    statGet()
end

function statGet()
    local ret1, val1 = StatGetInt('MP0_WALLET_BALANCE', -1) --getting cash value
    local ret2, val2 = StatGetInt('BANK_BALANCE', -1) --getting bank value

    chat("cash: "..val1.." | bank: "..val2.."")
end

RegisterCommand('statset', function(source, args)
    if args[2] ~= nil then
        statSet(tonumber(args[1]), tonumber(args[2]))
    else
        statSet(500, 200)
    end
end, false)

RegisterCommand('showstat', function()
    ShowHudComponentThisFrame(3) -- player CASH
	ShowHudComponentThisFrame(4) -- player BANK amount
end, false)

--+set sv_enforceGameBuild 2189