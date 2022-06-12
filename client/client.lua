Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local mainMenu = RageUI.CreateMenu("", "Ammunation", 0, 0, "commonmenu", "ammubanner")
local letale = RageUI.CreateSubMenu(mainMenu, "", "Armes Létale")
local blanche = RageUI.CreateSubMenu(mainMenu, "", "Armes Blanche")
local equipement = RageUI.CreateSubMenu(mainMenu, "", "Équipement")
local open,Index = false,1

mainMenu.Closed = function() open = false end

function Ammunation()
    if not open then open = true RageUI.Visible(mainMenu, true) 
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    if Config.Menu.Activer.Letale then
                        if ppa then
                            RageUI.Button("Armes Létale", nil, {RightLabel = "→"}, true, {}, letale)
                        else
                            RageUI.Button("Armes Létale", "~r~Vous devez avoir le PPA", {}, false, {})
                        end
                    end
                    if Config.Menu.Activer.Blanche then
                        RageUI.Button("Armes Blanche", nil, {RightLabel = "→"}, true, {}, blanche)
                    end
                    if Config.Menu.Activer.Equipement then
                        RageUI.Button("Équipement", nil, {RightLabel = "→"}, true, {}, equipement)
                    end
                    if not ppa then
                        RageUI.Button("Acheter le PPA", nil, {RightLabel = "~g~5000$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('ammunation:ppa', 5000)
                                RageUI.CloseAll()
                                open = false
                            end
                        })
                    else
                        RageUI.Button("Acheter le PPA", "~r~Vous avez déjà cette license", {}, false, {})
                    end
                end)
                RageUI.IsVisible(letale, function()
                    for k,v in pairs(Config.Menu.Letale) do
                        if not Config.Menu.Activer.PaiementBanque then
                            RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent('ammunation:achat_item', v.name, v.price, true)
                                end
                            })
                        else
                            RageUI.List(v.label.." - "..v.price.."$", {"~g~Liquide~s~", "~b~Banque~s~"}, Index, nil, {}, true, {
                                onListChange = function(list) Index = list end,
                                onSelected = function(list)
                                    if list == 1 then
                                        TriggerServerEvent('ammunation:achat_weapon', v.name, v.price, true)
                                    elseif list == 2 then
                                        TriggerServerEvent('ammunation:achat_weapon', v.name, v.price, false)
                                    end
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(blanche, function()
                    for k,v in pairs(Config.Menu.Blanche) do
                        if not Config.Menu.Activer.PaiementBanque then
                            RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent('ammunation:achat_weapon', v.name, v.price, true)
                                end
                            })
                        else
                            RageUI.List(v.label.." - "..v.price.."$", {"~g~Liquide~s~", "~b~Banque~s~"}, Index, nil, {}, true, {
                                onListChange = function(list) Index = list end,
                                onSelected = function(list)
                                    if list == 1 then
                                        TriggerServerEvent('ammunation:achat_weapon', v.name, v.price, true)
                                    elseif list == 2 then
                                        TriggerServerEvent('ammunation:achat_weapon', v.name, v.price, false)
                                    end
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(equipement, function()
                    for k,v in pairs(Config.Menu.Equipement) do
                        if not Config.Menu.Activer.PaiementBanque then
                            RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent('ammunation:achat_item', v.name, v.price, true)
                                end
                            })
                        else
                            RageUI.List(v.label.." - "..v.price.."$", {"~g~Liquide~s~", "~b~Banque~s~"}, Index, nil, {}, true, {
                                onListChange = function(list) Index = list end,
                                onSelected = function(list)
                                    if list == 1 then
                                        TriggerServerEvent('ammunation:achat_item', v.name, v.price, true)
                                    elseif list == 2 then
                                        TriggerServerEvent('ammunation:achat_item', v.name, v.price, false)
                                    end
                                end
                            })
                        end
                    end
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    for k,v in pairs(Config.Position) do
        if Config.Blips.Activer then
            local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blip, Config.Blips.Sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.Blips.Scale)
            SetBlipColour(blip, Config.Blips.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Blips.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(Config.Position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 2 then
                wait = 1
                DrawMarker(6, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, false, p19, false)
            end
            if dist <= 1.0 then
                wait = 1
                ESX.ShowHelpNotification("~INPUT_CONTEXT~ pour ouvrir l'~r~Ammunation")
                if IsControlJustPressed(1,51) then
                    checkLicense()
                    Ammunation()
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey(Config.Peds.Name)
    while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
    for k,v in pairs(Config.Peds.Position) do
        ped = CreatePed("PED_TYPE_CIVFEMALE", Config.Peds.Name, v.x, v.y, v.z, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
    end
end)

function checkLicense()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
        ppa = hasWeaponLicense
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), 'weapon')
end

RegisterNetEvent('ammunation:clip')
AddEventHandler('ammunation:clip', function()
    if IsPedArmed(GetPlayerPed(-1), 4) then
        if GetSelectedPedWeapon(GetPlayerPed(-1)) ~= nil then
            TriggerServerEvent('ammunation:removeclip')
            AddAmmoToPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), 30)
            ESX.ShowNotification("Vous avez utilisé un chargeur")
        else
            ESX.ShowNotification("~r~Vous ne pouvez pas utiliser de chargeur sur cette arme")
        end
    else
        ESX.ShowNotification("~r~Vous devez avoir une arme dans les mains")
    end
end)

RegisterNetEvent('ammunation:kevlar')
AddEventHandler('ammunation:kevlar', function()
    AddArmourToPed(GetPlayerPed(-1), 100)
    SetPedArmour(GetPlayerPed(-1), 100)
end)