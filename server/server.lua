    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('w_ammu:achatitem')
AddEventHandler('w_ammu:achatitem', function(nameitem, priceitem, liquide)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoneyL = xPlayer.getMoney()
    local xMoneyB = xPlayer.getAccount('bank').money
    if liquide then
        if xMoneyL >= priceitem then
            xPlayer.removeMoney(priceitem)
            xPlayer.addInventoryItem(nameitem, 1)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..priceitem.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    else
        if xMoneyB >= priceitem then
            xPlayer.removeAccountMoney('bank', priceitem)
            xPlayer.addInventoryItem(nameitem, 1)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~b~"..priceitem.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    end
end)

RegisterNetEvent('w_ammu:achatweapon')
AddEventHandler('w_ammu:achatweapon', function(nameweapon, priceweapon, liquide)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoneyL = xPlayer.getMoney()
    local xMoneyB = xPlayer.getAccount('bank').money
    if liquide then
        if xMoneyL >= priceweapon then
            xPlayer.removeMoney(priceweapon)
            xPlayer.addWeapon(nameweapon, 500)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..priceweapon.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    else
        if xMoneyB >= priceweapon then
            xPlayer.removeAccountMoney('bank', priceweapon)
            xPlayer.addWeapon(nameweapon, 500)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~b~"..priceweapon.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    end
end)

ESX.RegisterUsableItem('kevlar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('kevlar', 1)
    TriggerClientEvent('w_ammu:kevlar', source)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('w_ammu:clip', source)
end)

RegisterNetEvent('w_ammu:removeclip')
AddEventHandler('w_ammu:removeclip', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterServerCallback('w_ammu:checkcarte', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(Config.NomItemCarte).count >= 1 then
		cb(true)
    else
		cb(false)
    end
end)

RegisterServerEvent('w_ammu:ppa')
AddEventHandler('w_ammu:ppa', function(priceppa)
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= priceppa then
        MySQL.Async.execute('INSERT INTO user_licenses (id, type, owner) VALUES (@id, @type, @owner)', {
            ['@id'] = 1,
            ['@type'] = "weapon" ,
            ['@owner'] = xPlayer.identifier
        })
	    xPlayer.removeMoney(priceppa)
	    TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..priceppa.."$")
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
	end
end)