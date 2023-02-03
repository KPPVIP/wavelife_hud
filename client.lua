local thirst, hunger, voice, money, black_money, isTalking, muted, radio = 0,0,8,0,0,0,0,false,false,false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILoveGodCaparedObjILoveGodCapect', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    ESX.PlayerData = ESX.GetPlayerData()
    StartShowHudThread()
end)

function StartShowHudThread()
    Citizen.CreateThread(function()
        while(true) do
            inVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
                for k,v in ipairs(ESX.GetPlayerData().accounts) do
                    for k,v in ipairs(ESX.GetPlayerData().accounts) do
                        if v.name == "money" then
                            black_money = ESX.Math.GroupDigits(v.money)
                        end
                    end
                    radio = exports.saltychat:GetRadioChannel(true)
                    if v.name == "money" then
                        black_money = ESX.Math.GroupDigits(v.money)
                    end
                end
            money = ESX.Math.GroupDigits(ESX.GetPlayerData().money)

            Citizen.Wait(2000)
        end
    end)
end


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(200)
            if inVehicle then
                SendNUIMessage({
                    show = IsPauseMenuActive(),
					isTalking = isTalking,
                    thirst = thirst,
					muted = muted,
                    hunger = hunger,
                    voice = voice,
                    cash = money,
                    black_money = black_money,
                    radio = radio,
                })
            else
                SendNUIMessage({
                    show = IsPauseMenuActive(),
					isTalking = isTalking,
                    thirst = thirst,
					muted = muted,
                    hunger = hunger,
                    black_money = black_money,
                    cash = money,
                    voice = voice,
                    radio = radio,
                })
				
            end
        
    end
end)

AddEventHandler('SaltyChat_TalkStateChanged', function(talking)
	isTalking = talking
end)

AddEventHandler('SaltyChat_MicStateChanged', function(isMicrophoneMuted)
	muted = isMicrophoneMuted
end)

AddEventHandler("hud:range", function(range)
    voice = range
    if range == 3 then
        TriggerEvent('wavelifenew', "#008ada", "SALTYCHAT", "Sprachbereich: Gering")
    elseif range == 8 then
        TriggerEvent('wavelifenew', "#008ada", "SALTYCHAT", "Sprachbereich: Normal")
    elseif range == 16 then
        TriggerEvent('wavelifenew', "#008ada", "SALTYCHAT", "Sprachbereich: Schreien")
    end
end)