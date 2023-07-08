--  Setup hotkeys to be assigned in the ingame menu
local KeyMapper = import('/lua/keymap/keymapper.lua')
local misckeyactions = import('/lua/keymap/misckeyactions.lua')

local KeyDescriptions = import('/lua/keymap/keydescriptions.lua').keyDescriptions

----

if KeyDescriptions['auxilliary'] == nil then
        KeyDescriptions['auxilliary'] = 'Mobile Stealth/Shields'
end

if KeyDescriptions['T1Factory'] == nil then
        KeyDescriptions['T1Factory'] = 'T1Factories'
end

----- Delete all HotKeyKeys hotkeys - doesn't work..

-- local Prefs = import('/lua/user/prefs.lua')
-- Prefs.SetToCurrentProfile("HotKeyKeys", nil)

-----
-- Note: Seems like you can't have a minus '-' character in any of the hotkey names.
--  Probably nothing but alphanumeric and underscores actually
-- Note: No clue what the "order" parameter thingy does

-- Note: Regex for easy function conversion
--  (.*')(hko_hotkey_\w*)('.*)(.toggleAbilities9\(\))(.*)

-- KeyMapper.SetUserKeyAction('order1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 101})
-- KeyMapper.SetUserKeyAction('order2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 110})
-- KeyMapper.SetUserKeyAction('order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 103})
-- KeyMapper.SetUserKeyAction('order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 104})
-- KeyMapper.SetUserKeyAction('order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 105})
-- KeyMapper.SetUserKeyAction('order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 106})
-- KeyMapper.SetUserKeyAction('order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 107})
-- KeyMapper.SetUserKeyAction('order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 108})
-- KeyMapper.SetUserKeyAction('order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

-- KeyMapper.SetUserKeyAction('hko_hotkey_1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 101})
-- KeyMapper.SetUserKeyAction('hko_hotkey_2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 102})
-- KeyMapper.SetUserKeyAction('hko_hotkey_3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 103})
-- KeyMapper.SetUserKeyAction('hko_hotkey_4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 104})
-- KeyMapper.SetUserKeyAction('hko_hotkey_5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 105})
-- KeyMapper.SetUserKeyAction('hko_hotkey_6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 106})
-- KeyMapper.SetUserKeyAction('hko_hotkey_7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 107})
-- KeyMapper.SetUserKeyAction('hko_hotkey_8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 108})
-- KeyMapper.SetUserKeyAction('hko_hotkey_9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_0', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_Minus', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})
-- KeyMapper.SetUserKeyAction('hko_hotkey_Plus', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 109})

KeyMapper.SetUserKeyAction('hko_hotkey_1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_1()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_1_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_1_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_1_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_1_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_1_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_1_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_2()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_2_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_2_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_2_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_2_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_2_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_2_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_3()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_3_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_3_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_3_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_3_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_3_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_3_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_4()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_4_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_4_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_4_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_4_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_4_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_4_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_5()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_5_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_5_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_5_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_5_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_5_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_5_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_6()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_6_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_6_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_6_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_6_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_6_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_6_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_7()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_7_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_7_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_7_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_7_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_7_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_7_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_8()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_8_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_8_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_8_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_8_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_8_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_8_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_9()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_9_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_9_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_9_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_9_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_9_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_9_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_0', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_0()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_0_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_0_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_0_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_0_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_0_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_0_as()', category = 'HotKeyKeys', order = 101})

KeyMapper.SetUserKeyAction('hko_hotkey_w', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_w()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_w_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_w_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_w_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_w_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_w_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_w_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_e', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_e()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_e_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_e_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_r', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_r()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_r_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_r_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_r_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_r_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_r_as', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_r_as()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_t', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_t()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_t_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_t_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_y', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_y()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_y_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_y_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_u', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_u()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_u_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_u_s()', category = 'HotKeyKeys', order = 101})

KeyMapper.SetUserKeyAction('hko_hotkey_a', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_a()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_a_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_a_s()', category = 'HotKeyKeys', order = 10132})
KeyMapper.SetUserKeyAction('hko_hotkey_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_s_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_s_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_d', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_d()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_d_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_d_s()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_f', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_f()', category = 'HotKeyKeys', order = 101})
KeyMapper.SetUserKeyAction('hko_hotkey_f_s', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_f_s()', category = 'HotKeyKeys', order = 101})

KeyMapper.SetUserKeyAction('hko_hotkey_filter_highest_engineer_and_assist', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").hko_hotkey_filter_highest_engineer_and_assist()', category = 'HotKeyKeys', order = 101})

-- KeyMapper.SetUserKeyAction('shift_order1', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities1()', category = 'HotKeyKeys', order = 211})
-- KeyMapper.SetUserKeyAction('shift_order2', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities2()', category = 'HotKeyKeys', order = 212})
-- KeyMapper.SetUserKeyAction('shift_order3', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities3()', category = 'HotKeyKeys', order = 213})
-- KeyMapper.SetUserKeyAction('shift_order4', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities4()', category = 'HotKeyKeys', order = 214})
-- KeyMapper.SetUserKeyAction('shift_order5', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities5()', category = 'HotKeyKeys', order = 215})
-- KeyMapper.SetUserKeyAction('shift_order6', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities6()', category = 'HotKeyKeys', order = 216})
-- KeyMapper.SetUserKeyAction('shift_order7', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities7()', category = 'HotKeyKeys', order = 217})
-- KeyMapper.SetUserKeyAction('shift_order8', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities8()', category = 'HotKeyKeys', order = 218})
-- KeyMapper.SetUserKeyAction('shift_order9', {action =  'UI_Lua import("/mods/HotKeyOrders/Commands.lua").toggleAbilities9()', category = 'HotKeyKeys', order = 219})

-- Not sure why/if the following is needed
KeyMapper.SetUserKeyAction('auxilliary', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("Auxillary")', category = 'hotbuilding', order = 1121})
KeyMapper.SetUserKeyAction('T1Factory', {action= 'UI_Lua import("/lua/keymap/hotbuild.lua").buildAction("T1Factory")', category = 'hotbuilding', order = 1122})
KeyMapper.SetUserKeyAction('shift_select_all_idle_eng_onscreen', {action = 'UI_SelectByCategory +inview +idle ENGINEER', category = 'selection', order = 18})