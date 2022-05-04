    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

local mainMenu = RageUI.CreateMenu("", "Ammunation",0,0,"w_ammu", "ammubanner")
local armesl = RageUI.CreateSubMenu(mainMenu, "", "Armes Létale")
local armesb = RageUI.CreateSubMenu(mainMenu, "", "Armes Blanche")
local access = RageUI.CreateSubMenu(mainMenu, "", "Accessoires")
local paiement = RageUI.CreateSubMenu(mainMenu, "", "Méthode de Paiement")
local open = false

mainMenu.Display.Glare,armesl.Display.Glare,armesb.Display.Glare,access.Display.Glare,paiement.Display.Glare = false,false,false,false,false

mainMenu.Closed = function() open = false end 

function Ammunation()
    if not open then open = true RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(mainMenu, function()
                    checkLicense()
                    if Config.Ammunation.ActiverLetale then 
                        if ppa then 
                            RageUI.Button("Armes Létale", nil, {RightLabel = "→"}, true, {}, armesl) 
                        else
                            RageUI.Button("Armes Létale", "~r~Vous n'avez pas le PPA", {}, false, {})
                        end
                    end
                    if Config.Ammunation.ActiverBlanche then RageUI.Button("Armes Blanche", nil, {RightLabel = "→"}, true, {}, armesb) end
                    if Config.Ammunation.ActiverAccess then RageUI.Button("Accessoires", nil, {RightLabel = "→"}, true, {}, access) end
                    if Config.Ammunation.PPA.Activer then
                        if not ppa then
                            RageUI.Button("Acheter le PPA", nil, {RightLabel = "~g~"..Config.Ammunation.PPA.Price.."$"}, true, {
                                onSelected = function()
                                    priceppa = Config.Ammunation.PPA.Price
                                    TriggerServerEvent('w_ammu:ppa', priceppa)
                                end
                            })
                        else
                            RageUI.Button("Acheter le PPA", "~r~Vous avez déjà le PPA", {}, false, {})
                        end
                    end
                    RageUI.Separator("discord.gg/VpYP58ZjmD")
                end)
                RageUI.IsVisible(armesl, function()
                    for _,v in pairs(Config.Ammunation.List.Letale) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                            onSelected = function()
                                nameweapon = v.name
                                priceweapon = v.price
                                item = false
                                ESX.TriggerServerCallback('w_ammu:checkcarte', function(confirmation)
                                    if not confirmation then joueuraunecarte = false else joueuraunecarte = true end
                                end)
                            end
                        }, paiement)
                    end
                end)
                RageUI.IsVisible(armesb, function()
                    for _,v in pairs(Config.Ammunation.List.Blanche) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                            onSelected = function()
                                nameitem = v.name
                                priceitem = v.price
                                item = false
                                ESX.TriggerServerCallback('w_ammu:checkcarte', function(confirmation)
                                    if not confirmation then joueuraunecarte = false else joueuraunecarte = true end
                                end)
                            end
                        }, paiement)
                    end
                end)
                RageUI.IsVisible(access, function()
                    for _,v in pairs(Config.Ammunation.List.Access) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                            onSelected = function()
                                nameitem = v.name
                                priceitem = v.price
                                item = true
                                ESX.TriggerServerCallback('w_ammu:checkcarte', function(confirmation)
                                    if not confirmation then joueuraunecarte = false else joueuraunecarte = true end
                                end)
                            end
                        }, paiement)
                    end
                end)
                RageUI.IsVisible(paiement, function()
                    RageUI.Button("Payer en ~g~Liquide", nil, {RightLabel = "→"}, true, {
                        onSelected = function() 
                            liquide = true
                            if not item then
                                TriggerServerEvent('w_ammu:achatweapon', nameweapon, priceweapon, liquide)
                            else
                                TriggerServerEvent('w_ammu:achatitem', nameitem, priceitem, liquide)
                            end
                         end
                    })
                    if Config.UtiliserCarteBancaire then
                        if joueuraunecarte then
                            RageUI.Button("Payer en ~b~Banque", nil, {RightLabel = "→"}, true, {
                                onSelected = function() 
                                    liquide = false
                                    if not item then
                                        TriggerServerEvent('w_ammu:achatweapon', nameweapon, priceweapon, liquide)
                                    else
                                        TriggerServerEvent('w_ammu:achatitem', nameitem, priceitem, liquide)
                                    end
                                end
                            })
                        else
                            RageUI.Button("Payer en ~b~Banque", "~r~Vous devez avoir une carte bancaire", {}, false, {})
                        end
                    else
                        RageUI.Button("Payer en ~g~Banque", nil, {RightLabel = "→"}, true, {
                            onSelected = function() 
                                liquide = false
                                if not item then
                                    TriggerServerEvent('w_ammu:achatweapon', nameweapon, priceweapon, liquide)
                                else
                                    TriggerServerEvent('w_ammu:achatitem', nameitem, priceitem, liquide)
                                end
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(Config.Ammunation.Pos) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 1.0 then
                wait = 1
                DrawMarker(6, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 50, 0, 100, false, false, p19, false)
            end
            if dist <= 1.0 then
                wait = 1
                ESX.ShowHelpNotification("~INPUT_CONTEXT~ pour ouvrir l'~r~Ammunation")
                if IsControlJustPressed(1,51) then
                    Ammunation()
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function() 
    for k,v in pairs(Config.Ammunation.Pos) do
        if Config.Ammunation.ActiverBlips then
            local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blip, Config.Ammunation.BlipsId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.Ammunation.BlipsScale)
            SetBlipColour(blip, Config.Ammunation.BlipsColor)
            SetBlipAsShortRange(blip, true) 
            BeginTextCommandSetBlipName('STRING') 
            AddTextComponentSubstringPlayerName(Config.Ammunation.BlipsName)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey(Config.Ammunation.PedsName)
    while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
    for _,v in pairs(Config.Ammunation.PedsList) do
        ped = CreatePed("PED_TYPE_CIVFEMALE", Config.Ammunation.PedsName, v.x, v.y, v.z, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        if Config.Ammunation.PedsAnim then TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) end
    end
end)

function checkLicense()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
        ppa = hasWeaponLicense
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), 'weapon')
end

RegisterNetEvent('w_ammu:clip')
AddEventHandler('w_ammu:clip', function()
    if IsPedArmed(GetPlayerPed(-1), 4) then
        if GetSelectedPedWeapon(GetPlayerPed(-1)) ~= nil then
            TriggerServerEvent('w_ammu:removeclip')
            AddAmmoToPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), 30)
            ESX.ShowNotification("Vous avez utilisé un chargeur")
        else
            ESX.ShowNotification("~r~Vous ne pouvez pas utiliser de chargeur sur cette arme")
        end
    else
        ESX.ShowNotification("~r~Vous devez avoir une arme dans les mains")
    end
end)

RegisterNetEvent('w_ammu:kevlar')
AddEventHandler('w_ammu:kevlar', function()
    AddArmourToPed(GetPlayerPed(-1), 100)
    SetPedArmour(GetPlayerPed(-1), 100)
end)
