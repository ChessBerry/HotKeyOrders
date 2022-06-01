-- Define custom hotkey functions, overloading many of the default/mod hotkeys
local misckeyactions = import('/lua/keymap/misckeyactions.lua')
local orders = import('/lua/ui/game/orders.lua')
local hotbuild = import('/lua/keymap/hotbuild.lua')
local select = import('/lua/ui/game/selection.lua') -- File doesn't exist? Is referenced in the main game's repo too though
local spreadattack = import ('/lua/spreadattack.lua')
local smart = import('/lua/keymap/smartSelection.lua')
local construction = import('/lua/ui/game/construction.lua')
local avatars = import('/lua/ui/game/avatars.lua')
local ping = import('/lua/ui/game/ping.lua')
local disperse = import('/mods/Disperse Move/modules/dispersemove.lua')
local reclaim = import('/lua/ui/game/reclaim.lua')
local CommandMode = import('/lua/ui/game/commandmode.lua')
-- local rui = import('/mods/RUI/hook/lua/ui/game/commandmode.lua')
local CommandMode = import('/lua/ui/game/commandmode.lua') -- RUI is here, and not in the RUI mod folder via the hook RUI uses, I think
local hbo = import('/lua/keymap/hotbuild.lua') -- Don't know why HBO is here, but that's where the hotkey in game.prefs links to
-- Note: Basically all default hotkeys seem to be listed in '/lua/keymap/keyactions.lua'

-- *'(hko_hotkey_)(\w*)'.*
-- function $1$2()
--     print("$2")
-- end


----------- HKO Hotkey Overloading Functions

function hko_hotkey_w()
    print("w")
    local selection = GetSelectedUnits() or nil
    if not table.empty(EntityCategoryFilterDown((categories.FACTORY - categories.GATE) + categories.EXPERIMENTAL, selection)) then
        -- t1 engies for all facs and experimentals that can make engies
        print("w1")
        hotbuild.buildAction("Builders")
    elseif not table.empty(EntityCategoryFilterDown(categories.GATE, selection)) then
        -- T3 fac, Quantum Gate, 
        print("w2")
        hbo.buildAction("eng_or_ras")
    else
        -- Units, but only the ACU matters
        print("w3")
        orders.EnterOverchargeMode()
    end
    selection = nil
end

function hko_hotkey_w_s()
    print("w_s")
    hko_hotkey_w()
end

function hko_hotkey_e()
    print("e")
    CommandMode.StartCommandMode('order', {name = 'RULEUCC_Transport'})
end

function hko_hotkey_e_s()
    print("e_s")
    hko_hotkey_e()
end

function hko_hotkey_r()
    print("r")
end

function hko_hotkey_r_s()
    print("r_s")
end

function hko_hotkey_r_a()
    print("r_a")
end

function hko_hotkey_r_as()
    print("r_as")
end

function hko_hotkey_t()
    print("t")
end

function hko_hotkey_t_s()
    print("t_s")
end

function hko_hotkey_y()
    print("y")
end

function hko_hotkey_y_s()
    print("y_s")
end

function hko_hotkey_u()
    print("u")
end

function hko_hotkey_u_s()
    print("u_s")
end

-----


function hko_hotkey_a()
    print("a")
    local selection = GetSelectedUnits() or nil
    if not table.empty(EntityCategoryFilterDown(categories.STRUCTURE, selection)) then
        -- Only structures can upgrade
        print("a1")
        hotbuild.buildAction("Upgrades")
    else
        print("a2")
        CommandMode.EasyReclaim()
    end 
end

function hko_hotkey_a_s()
    print("a_s")
    hko_hotkey_a()
end

function hko_hotkey_s()
    print("s")
end

function hko_hotkey_s_s()
    print("s_s")
end

function hko_hotkey_d()
    print("d")
end

function hko_hotkey_d_s()
    print("d_s")
end

function hko_hotkey_f()
    print("f")
end

function hko_hotkey_f_s()
    print("f_s")
end




----------- Functions by Dragun

-- ----------- Helper Functions by Dragun

-- function Arty()
--     WaitSeconds(2)
--     hotbuild.buildAction("Heavy_Artillery_Installation")
-- end

-- function Fabricators()
--     WaitSeconds(3)
--     misckeyactions.toggleScript("Production")
-- end

-- function Claim()
--     WaitSeconds(6)
--     reclaim.ToggleReclaim()
-- end


-- function toggleAbilities1()
--     print("a")
--     -- local selection = GetSelectedUnits() or nil
--     -- hotbuild.buildAction("T3_Strategic_Bomber")
--     -- hotbuild.buildAction("T3_Aircraft_Carrier")
--     -- hotbuild.buildAction("T3_Battlecruiser")
--     -- hotbuild.buildAction("Artillery_Installation")
--     -- ForkThread(Arty)
--     -- if not selection then
--     --     misckeyactions.GetNearestIdleEngineerNotACU()
--     -- end
-- end

-- function toggleAbilities2()
--     print("s")
--     local selection = GetSelectedUnits() or nil
--     hotbuild.buildAction("Upgrades")
--     hotbuild.buildAction("Builders")
--     hotbuild.buildAction("T2_Support_Land_Factory")
--     hotbuild.buildAction("T3_Support_Land_Factory")
-- end

-- function toggleAbilities3()
--     local selection = GetSelectedUnits() or nil
--     construction.ToggleUnitPause()
--     misckeyactions.toggleCloakJammingStealthScript()
--     if not selection then
--     smart.smartSelect("MASSFABRICATION STRUCTURE -EXPERIMENTAL")    
--     misckeyactions.toggleScript("Production")
--     ForkThread(Fabricators)
--     end
-- end

-- function toggleAbilities4()
--     local selection = GetSelectedUnits() or nil
--     if not selection then
--     ping.DoPing("alert")
--     end
--     hotbuild.buildAction("T1_Tank")
--     misckeyactions.SetWeaponPrioritiesHotkey("ACU")
-- end

-- function toggleAbilities5()
--         local selection = GetSelectedUnits() or nil
--     reclaim.ToggleReclaim()
--     ForkThread(Claim)
--     hotbuild.buildAction("Auxillary")
-- end

-- function toggleAbilities6()
--     local selection = GetSelectedUnits() or nil
--     disperse.DisperseMove()
--     if not selection then    
--     smart.smartSelect("AIR HIGHALTAIR ANTIAIR -BOMBER -EXPERIMENTAL")
--     misckeyactions.SetWeaponPrioritiesHotkey("AntiAir")
--     end
-- end

-- function toggleAbilities7()
--        local selection = GetSelectedUnits() or nil
--     misckeyactions.ToggleRepeatBuild()
--     hotbuild.buildAction("T1_Engineer")
--     hotbuild.buildAction("T1_Tank")
-- end 

-- function toggleAbilities8()
--         local selection = GetSelectedUnits() or nil
--     smart.smartSelect("+inview +idle LAND OVERLAYDIRECTFIRE MOBILE -COMMAND -EXPERIMENTAL")
--     misckeyactions.SetWeaponPrioritiesHotkey("Units")
-- end

-- function toggleAbilities9()
--     local selection = GetSelectedUnits() or nil
--     spreadattack.SpreadAttack()
--     if not selection then     
--         smart.smartSelect("+inview +idle ENGINEER MOBILE -COMMAND -FIELDENGINEER -EXPERIMENTAL")   
--         smart.smartSelect("+inview +idle COMMAND")
--     end
-- end
