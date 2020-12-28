local KeyMapper = import('/lua/keymap/keymapper.lua')
local misckeyactions = import('/lua/keymap/misckeyactions.lua')
local KeyDescriptions = import('/lua/keymap/keydescriptions.lua').keyDescriptions

if KeyDescriptions['order'] == nil then
        KeyDescriptions['order'] = 'Ability Pause/Dive'
end

if KeyDescriptions['order2'] == nil then
        KeyDescriptions['order2'] = 'EconomyPause/Builders/T2SupportLand'
end

if KeyDescriptions['order3'] == nil then
        KeyDescriptions['order3'] = 'Upgrade/Overcharge/ProductionToggle'
end

if KeyDescriptions['order4'] == nil then
        KeyDescriptions['order4'] = 'Ping/T1Tank/Snipe'
end

if KeyDescriptions['order5'] == nil then
        KeyDescriptions['order5'] = 'Reclaim/MobileStealth&Shields/Spread'
end

if KeyDescriptions['order6'] == nil then
        KeyDescriptions['order6'] = 'Disperse/SelectAntiAir/AntiAirPriority'
end

if KeyDescriptions['order7'] == nil then
        KeyDescriptions['order7'] = 'repeat/T1Engi/T1Tank'
end

if KeyDescriptions['order8'] == nil then
        KeyDescriptions['order8'] = 'LandDirectFire/UnitPriority'
end

if KeyDescriptions['order9'] == nil then
        KeyDescriptions['order9'] = 'Spread/Commander/Engi'
end


if KeyDescriptions['auxilliary'] == nil then
        KeyDescriptions['auxilliary'] = 'Mobile Stealth/Shields'
end

if KeyDescriptions['T1Factory'] == nil then
        KeyDescriptions['T1Factory'] = 'T1Factories'
end



KeyMapper.SetUserKeyAction('order', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('order2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities2()', category = 'HotKeyKeys', order = 102})
KeyMapper.SetUserKeyAction('order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 103})
KeyMapper.SetUserKeyAction('order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 104})
KeyMapper.SetUserKeyAction('order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 105})
KeyMapper.SetUserKeyAction('order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 106})
KeyMapper.SetUserKeyAction('order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 107})
KeyMapper.SetUserKeyAction('order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 108})
KeyMapper.SetUserKeyAction('order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
KeyMapper.SetUserKeyAction('auxilliary', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("Auxillary")', category = 'hotbuilding', order = 1121})
KeyMapper.SetUserKeyAction('T1Factory', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("T1Factory")', category = 'hotbuilding', order = 1122})