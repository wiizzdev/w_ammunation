    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
-- Event de l'achat de l'arme 'weapon_pistol'
RegisterNetEvent('wdev:achatPistolet') -- enregistrement de l'event
AddEventHandler('wdev:achatPistolet', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 500 -- prix réel de l'arme
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('weapon_pistol', 50) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat de l'arme 'weapon_snspistol'
RegisterNetEvent('wdev:achatPétoire') -- enregistrement de l'event
AddEventHandler('wdev:achatPétoire', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 350 -- prix réel de l'arme
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('weapon_snspistol', 50) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat de l'arme 'weapon_vintagepistol'
RegisterNetEvent('wdev:achatVintage') -- enregistrement de l'event
AddEventHandler('wdev:achatVintage', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 300 -- prix réel de l'arme
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('weapon_vintagepistol', 50) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat de l'arme 'weapon_knife'
RegisterNetEvent('wdev:achatCouteau') -- enregistrement de l'event
AddEventHandler('wdev:achatCouteau', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 100 -- prix réel de l'arme
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('weapon_knife', 1) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat de l'arme 'weapon_bat'
RegisterNetEvent('wdev:achatBatte') -- enregistrement de l'event
AddEventHandler('wdev:achatBatte', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 50 -- prix réel de l'arme
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('weapon_bat', 1) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat de l'arme 'weapon_knuckle'
RegisterNetEvent('wdev:achatPoingt') -- enregistrement de l'event
AddEventHandler('wdev:achatPoingt', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 25 -- prix réel de l'arme
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('weapon_knuckle', 1) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat de l'arme 'gadget_parachute'
RegisterNetEvent('wdev:achatParachute') -- enregistrement de l'event
AddEventHandler('wdev:achatParachute', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 150 -- prix réel de l'accessoire
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addWeapon('gadget_parachute', 1) -- ajouter l'arme à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- CLIP/MUNITIONS

-- Event de l'achat de l'item 'clip'
RegisterNetEvent('wdev:achatClip') -- enregistrement de l'event
AddEventHandler('wdev:achatClip', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 50 -- prix réel de l'item
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addInventoryItem('clip', 1) -- ajouter l'item à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'utilisation de l'item Clip
RegisterServerEvent('wdev:remove') -- enregistrement de l'event
AddEventHandler('wdev:remove', function() -- définition de l'event
	local joueur = ESX.GetPlayerFromId(source)
	joueur.removeInventoryItem('clip', 1) -- supprimer l'item de l'inventaire du joueur
end)

ESX.RegisterUsableItem('clip', function(source) -- enregistrement d'un item utilisable
	TriggerClientEvent('wdev:chargeur', source) -- éxécuter l'event côté client
end)

-- KEVLAR

-- Event de l'achat de l'item 'kevlar'
RegisterNetEvent('wdev:achatKevlar') -- enregistrement de l'event
AddEventHandler('wdev:achatKevlar', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 100 -- prix réel de l'item
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      joueur.addInventoryItem('kevlar', 1) -- ajouter l'item à l'inventaire du joueur
      TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

ESX.RegisterUsableItem('kevlar', function (source) -- enregistrement d'un item utilisable
  local joueur = ESX.GetPlayerFromId(source)
  joueur.removeInventoryItem('kevlar', 1) -- supprimer l'item de l'inventaire du joueur
  TriggerClientEvent('wdev:kevlar', source) -- éxécuter l'event côté client
end)

-- PPA

-- Event de l'achat de la license 'weapon'
RegisterServerEvent("wdev:achatPPA") -- enregistrement de l'event
AddEventHandler("wdev:achatPPA", function(weapon) -- définition de l'event
	local xPlayer = ESX.GetPlayerFromId(source)
  local price = 5000 -- prix réel de la license
    if xPlayer.getMoney() >= price then -- si l'argent est supérieur ou égal a l'argent alors
        MySQL.Async.execute('INSERT INTO user_licenses (id, type, owner) VALUES (@id, @type, @owner)', { -- insérer dans la table users_license
            ['@id'] = 1,
            ['@type'] = "weapon" ,
            ['@owner'] = xPlayer.identifier
        })
	    xPlayer.removeMoney(price) -- supprimer l'argent au joueur
	    TriggerClientEvent('esx:showNotification', source, "Achat effectué !") -- contenue de la notif si achat validé
	  else
		  TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
	  end
end)