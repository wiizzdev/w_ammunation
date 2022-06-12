ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('ammunation:achat_weapon')
AddEventHandler('ammunation:achat_weapon', function(name, price, liquide)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoneyL = xPlayer.getMoney()
    local xMoneyB = xPlayer.getAccount('bank').money
    if liquide then
        if xMoneyL >= price then
            xPlayer.removeMoney(price)
            xPlayer.addWeapon(name, 150)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..price.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    else
        if xMoneyB >= price then
            xPlayer.removeAccountMoney('bank', price)
            xPlayer.addWeapon(name, 150)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~b~"..price.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    end
end)

RegisterNetEvent('ammunation:achat_item')
AddEventHandler('ammunation:achat_item', function(name, price, liquide)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoneyL = xPlayer.getMoney()
    local xMoneyB = xPlayer.getAccount('bank').money
    if liquide then
        if xMoneyL >= price then
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(name, 1)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..price.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    else
        if xMoneyB >= price then
            xPlayer.removeAccountMoney('bank', price)
            xPlayer.addInventoryItem(name, 1)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~b~"..price.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    end
end)

ESX.RegisterUsableItem('kevlar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('kevlar', 1)
    TriggerClientEvent('ammunation:kevlar', source)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('ammunation:clip', source)
end)

RegisterNetEvent('ammunation:removeclip')
AddEventHandler('ammunation:removeclip', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('clip', 1)
end)

RegisterServerEvent('ammunation:ppa')
AddEventHandler('ammunation:ppa', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= price then
        MySQL.Async.execute('INSERT INTO user_licenses (id, type, owner) VALUES (@id, @type, @owner)', {
            ['@id'] = 1,
            ['@type'] = "weapon" ,
            ['@owner'] = xPlayer.identifier
        })
	    xPlayer.removeMoney(price)
	    TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..price.."$")
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
	end
end)
