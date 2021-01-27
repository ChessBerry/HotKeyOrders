local KeyMapper = import('/lua/keymap/keymapper.lua')
local misckeyactions = import('/lua/keymap/misckeyactions.lua')
local KeyDescriptions = import('/lua/keymap/keydescriptions.lua').keyDescriptions

if KeyDescriptions['auxilliary'] == nil then
        KeyDescriptions['auxilliary'] = 'Mobile Stealth/Shields'
end

if KeyDescriptions['T1Factory'] == nil then
        KeyDescriptions['T1Factory'] = 'T1Factories'
end



KeyMapper.SetUserKeyAction('order1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('order2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities2()', category = 'HotKeyKeys', order = 102})
KeyMapper.SetUserKeyAction('order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 103})
KeyMapper.SetUserKeyAction('order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 104})
KeyMapper.SetUserKeyAction('order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 105})
KeyMapper.SetUserKeyAction('order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 106})
KeyMapper.SetUserKeyAction('order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 107})
KeyMapper.SetUserKeyAction('order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 108})
KeyMapper.SetUserKeyAction('order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

KeyMapper.SetUserKeyAction('shift_order1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 111})
KeyMapper.SetUserKeyAction('shift_order2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities2()', category = 'HotKeyKeys', order = 112})
KeyMapper.SetUserKeyAction('shift_order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 113})
KeyMapper.SetUserKeyAction('shift_order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 114})
KeyMapper.SetUserKeyAction('shift_order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 115})
KeyMapper.SetUserKeyAction('shift_order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 116})
KeyMapper.SetUserKeyAction('shift_order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 117})
KeyMapper.SetUserKeyAction('shift_order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 118})
KeyMapper.SetUserKeyAction('shift_order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 119})

KeyMapper.SetUserKeyAction('auxilliary', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("Auxillary")', category = 'hotbuilding', order = 1121})
KeyMapper.SetUserKeyAction('T1Factory', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("T1Factory")', category = 'hotbuilding', order = 1122})
KeyMapper.SetUserKeyAction('shift_select_all_idle_eng_onscreen', {action = 'UI_SelectByCategory +inview +idle ENGINEER', category = 'selection', order = 18})