    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

-- PPA 

local function checkLicense()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
        ppa = hasWeaponLicense
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), 'weapon')
end 

-- MENU

local mainMenu = RageUI.CreateMenu("", "MENU") -- menu principal
local armesl = RageUI.CreateSubMenu(mainMenu, "", "MENU") -- sous-menu armesl
local armesb = RageUI.CreateSubMenu(mainMenu, "", "MENU") -- sous-menu armesb
local equipements = RageUI.CreateSubMenu(mainMenu, "", "MENU") -- sous-menu equipements
local verrouarme = false
local verrouppa = true
local descarme = nil
local descppa = "Vous avez déjà cette license"
local open = false

mainMenu.Display.Glare = false -- afficher la planète sur la bannière principale?
armesl.Display.Glare = false -- afficher la planète sur la bannière armes létales ?
armesb.Display.Glare = false -- afficher la planète sur la bannière armes blanches ?
equipements.Display.Glare = false -- afficher la planète sur la bannière accessoires ?

mainMenu.Closed = function() open = false end

function ammunations() -- function qui fait le menu
    if open then 
        open = false 
            RageUI.Visible(mainMenu, false)
        return 
    else 
        open = true 
            RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    checkLicense()
                    RageUI.Button("Armes létales", descarme, {RightLabel = "→"}, verrouarme, {}, armesl) -- bouton du menu principal
                    RageUI.Button("Armes blanches", nil, {RightLabel = "→"}, true, {}, armesb) -- bouton du menu principal
                    RageUI.Button("Accessoires", nil, {RightLabel = "→"}, true, {}, equipements) -- bouton du menu principal
                    RageUI.Button("PPA", descppa, {RightLabel = config.prixppa}, verrouppa, {
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatPPA') -- éxécuter l'event achatPPA => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Separator("discord.gg/VpYP58ZjmD") -- lien discord affiché en bas du menu
                    if ppa then verrouarme = true else verrouarme = false end
                    if ppa then verrouppa = false else verrouppa = true end
                    if ppa then descarme = nil else descarme = "~r~Vous devez acheter une license" end
                    if ppa then descppa = "Vous avez déjà cette license" else descppa = "Acheter le permis de port d'arme" end
                end)
                RageUI.IsVisible(armesl, function()
                    RageUI.Button("Pistolet", "Acheter un pistolet", {RightLabel = config.prixarmeal1}, true, { -- bouton du menu armes létales
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatPistolet') -- éxécuter l'event achatPistolet => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Button("Pétoire", "Acheter un pétoire", {RightLabel = config.prixarmeal2}, true, { -- bouton du menu armes létales
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatPétoire') -- éxécuter l'event achatPétoire => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Button("Vintage", "Acheter un vintage", {RightLabel = config.prixarmeal3}, true, { -- bouton du menu armes létales
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatVintage') -- éxécuter l'event achatVintage => personnalisable dans le server.lua
                        end
                    })
                end)
                RageUI.IsVisible(armesb, function()
                    RageUI.Button("Couteau", "Acheter un couteau", {RightLabel = config.prixarmeab1}, true, { -- bouton du menu armes blanches
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatCouteau') -- éxécuter l'event achatCouteau => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Button("Batte de Baseball", "Acheter une batte de baseball", {RightLabel = config.prixarmeab2}, true, { -- bouton du menu armes blanches
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatBatte') -- éxécuter l'event achatBatte => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Button("Poingt Américain", "Acheter un poingt américain", {RightLabel = config.prixarmeab3}, true, { -- bouton du menu armes blanches
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatPoingt') -- éxécuter l'event achatPoingt => personnalisable dans le server.lua
                        end
                    })
                end)
                RageUI.IsVisible(equipements, function()
                    RageUI.Button("Chargeur", "Acheter des munitions", {RightLabel = config.prixitemac1}, true, { -- bouton du menu accessoires
                         onSelected = function() -- si le joueur sélectionne ce bouton
                             TriggerServerEvent('wdev:achatClip') -- éxécuter l'event achatClip => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Button("Gilet Pare-Balles", "Acheter un gilet pare-balles", {RightLabel = config.prixitemac2}, true, { -- bouton du menu accessoires
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatKevlar') -- éxécuter l'event achatKevlar => personnalisable dans le server.lua
                        end
                    })
                    RageUI.Button("Parachute", "Acheter un parachute", {RightLabel = config.prixitemac3}, true, { -- bouton du menu accessoires
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatParachute') -- éxécuter l'event achatParachute => personnalisable dans le server.lua
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

-- MARKERS
 
Citizen.CreateThread(function()
    while true do
      local wait = 900
        for k,v in pairs(Config.position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 7 then -- distance entre le joueur et le marker auquel le marker s'affiche (augmenter ce chiffre peut agrandir la consommation du script)
                wait = 1 --                                                  __rotation__  ___taille____
                DrawMarker(config.markertype, v.x, v.y, v.z, 0.0, 0.0, 0.0, -90.0,0.0,0.0, 1.1, 1.5, 1.1, config.red, config.green, config.blue, config.opacity, false, false, p19, false)  
            end
            if dist <= 1.1 then
                wait = 1
                --Visual.Subtitle("Appuyez sur ~g~[E]~w~ pour intéragir", 1) -- a activer si vous souhaitez un texte en bas de l'écran
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir") -- a commenter si vous avez activé la ligne au dessus
                if IsControlJustPressed(1,51) then
                    ammunations() -- ouvrir le menu principal
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)
 
 -- BLIPS
 
Citizen.CreateThread(function() 
    for k, v in pairs(Config.position) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z) -- coordonées a changer dans le config.lua
                    SetBlipSprite  (blip, config.blipsprite) -- logo a changer dans le config.lua
                    SetBlipDisplay (blip, config.blipdisplay) -- affichage a changer dans le config.lua
                    SetBlipScale   (blip, config.blipscale) -- taille a changer dans le config.lua
                    SetBlipColour  (blip, config.blipcolour) -- couleur a changer dans le config.lua
                    SetBlipAsShortRange(blip, true) 
                    BeginTextCommandSetBlipName('STRING') 
                    AddTextComponentSubstringPlayerName(config.blipname) -- nom a changer dans le config.lua
                    EndTextCommandSetBlipName(blip) 
    end 
end)

-- CLIP

RegisterNetEvent('wdev:chargeur')
AddEventHandler('wdev:chargeur', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('wdev:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,30)
      ESX.ShowNotification("Tu as utilisé un chargeur")
    else
      ESX.ShowNotification("Tu ne peux pas utiliser ce chargeur sur cette arme")
    end
  else
    ESX.ShowNotification("Tu n'as pas d'arme dans les mains")
  end
end)

-- KEVLAR

RegisterNetEvent('wdev:kevlar')
AddEventHandler('wdev:kevlar', function()
    local joueur = PlayerPedId()
    AddArmourToPed(joueur,100)
    SetPedArmour(joueur, 100)
end)

-- PEDS

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_ammucity_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", 22.45, -1105.41, 28.8, 153.96, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", 253.84, -50.55, 68.94, 63.701, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", 2567.61, 292.61, 107.63, 352.785, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", -331.62, 6085.03, 30.45, 222.123, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", 1691.95, 3760.71, 33.71, 221.985, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", -662.07, -933.52, 20.83, 176.542, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", 810.26, -2159.03, 28.62, 354.409, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", -1119.05, 2699.78, 17.55, 219.927, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_ammucity_01", 842.51, -1035.3, 27.19, 357.605, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) -- animation du ped
end)
