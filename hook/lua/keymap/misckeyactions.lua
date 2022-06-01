--  Setup hotkeys to be assigned in the ingame menu
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
KeyMapper.SetUserKeyAction('order22', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities22()', category = 'HotKeyKeys', order = 110})
KeyMapper.SetUserKeyAction('order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 103})
KeyMapper.SetUserKeyAction('order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 104})
KeyMapper.SetUserKeyAction('order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 105})
KeyMapper.SetUserKeyAction('order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 106})
KeyMapper.SetUserKeyAction('order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 107})
KeyMapper.SetUserKeyAction('order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 108})
KeyMapper.SetUserKeyAction('order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

-- KeyMapper.SetUserKeyAction('hko_hotkey_1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 101})
-- KeyMapper.SetUserKeyAction('hko_hotkey_2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities2()', category = 'HotKeyKeys', order = 102})
-- KeyMapper.SetUserKeyAction('hko_hotkey_3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 103})
-- KeyMapper.SetUserKeyAction('hko_hotkey_4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 104})
-- KeyMapper.SetUserKeyAction('hko_hotkey_5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 105})
-- KeyMapper.SetUserKeyAction('hko_hotkey_6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 106})
-- KeyMapper.SetUserKeyAction('hko_hotkey_7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 107})
-- KeyMapper.SetUserKeyAction('hko_hotkey_8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 108})
-- KeyMapper.SetUserKeyAction('hko_hotkey_9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- -- KeyMapper.SetUserKeyAction('hko_hotkey_0', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- -- KeyMapper.SetUserKeyAction('hko_hotkey_Minus', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- -- KeyMapper.SetUserKeyAction('hko_hotkey_Plus', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

-- KeyMapper.SetUserKeyAction('hko_hotkey_w', {actio =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-w', {actio =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_e', {actio =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-e', {actio =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_r', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-r', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_t', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-t', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_y', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-y', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_u', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-u', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

-- KeyMapper.SetUserKeyAction('hko_hotkey_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_a()', category = 'HotKeyKeys', order = 101})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_a-s()', category = 'HotKeyKeys', order = 211})
-- KeyMapper.SetUserKeyAction('hko_hotkey_a-r', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_as-r', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_d', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-d', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_f', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_s-f', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

KeyMapper.SetUserKeyAction('shift_order1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 211})
KeyMapper.SetUserKeyAction('shift_order2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities2()', category = 'HotKeyKeys', order = 212})
KeyMapper.SetUserKeyAction('shift_order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 213})
KeyMapper.SetUserKeyAction('shift_order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 214})
KeyMapper.SetUserKeyAction('shift_order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 215})
KeyMapper.SetUserKeyAction('shift_order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 216})
KeyMapper.SetUserKeyAction('shift_order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 217})
KeyMapper.SetUserKeyAction('shift_order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 218})
KeyMapper.SetUserKeyAction('shift_order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 219})

-- Not sure why/if the following is needed
KeyMapper.SetUserKeyAction('auxilliary', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("Auxillary")', category = 'hotbuilding', order = 1121})
KeyMapper.SetUserKeyAction('T1Factory', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("T1Factory")', category = 'hotbuilding', order = 1122})
KeyMapper.SetUserKeyAction('shift_select_all_idle_eng_onscreen', {action = 'UI_SelectByCategory +inview +idle ENGINEER', category = 'selection', order = 18})