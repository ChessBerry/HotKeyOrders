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
-- local rui = import('/mods/RUI/hook/lua/ui/game/commandmode.lua')
local rui = import('/lua/ui/game/commandmode.lua') --is here, and not in the RUI mod folder via the hook RUI uses, I think

-- Note: Basically all default hotkeys seem to be listed in '/lua/keymap/keyactions.lua'


----------- Helper Functions by Dragun

function Arty()
    WaitSeconds(2)
    hotbuild.buildAction("Heavy_Artillery_Installation")
end

function Fabricators()
    WaitSeconds(3)
    misckeyactions.toggleScript("Production")
end

function Claim()
    WaitSeconds(6)
    reclaim.ToggleReclaim()
end

----------- HKO Hotkey Overloading Functions

-- function hko_hotkey_a()
--     print("a")
--     -- orders.EnterOverchargeMode()
    
--     rui.EasyReclaim()
--     -- hotbuild.buildAction("Upgrades")

-- end


-- function hko_hotkey_a-s()
--     print("a-s")
--     -- orders.EnterOverchargeMode()
    
--     rui.EasyReclaim()
--     -- hotbuild.buildAction("Upgrades")

-- end

----------- Functions by Dragun

function toggleAbilities1()
    print("a")
    -- local selection = GetSelectedUnits() or nil
    -- hotbuild.buildAction("T3_Strategic_Bomber")
    -- hotbuild.buildAction("T3_Aircraft_Carrier")
    -- hotbuild.buildAction("T3_Battlecruiser")
    -- hotbuild.buildAction("Artillery_Installation")
    -- ForkThread(Arty)
    -- if not selection then
    --     misckeyactions.GetNearestIdleEngineerNotACU()
    -- end
end

function toggleAbilities2()
    print("s")
    local selection = GetSelectedUnits() or nil
    hotbuild.buildAction("Upgrades")
    hotbuild.buildAction("Builders")
    hotbuild.buildAction("T2_Support_Land_Factory")
    hotbuild.buildAction("T3_Support_Land_Factory")
end

function toggleAbilities3()
    local selection = GetSelectedUnits() or nil
    construction.ToggleUnitPause()
    misckeyactions.toggleCloakJammingStealthScript()
    if not selection then
    smart.smartSelect("MASSFABRICATION STRUCTURE -EXPERIMENTAL")    
    misckeyactions.toggleScript("Production")
    ForkThread(Fabricators)
    end
end

function toggleAbilities4()
    local selection = GetSelectedUnits() or nil
    if not selection then
    ping.DoPing("alert")
    end
    hotbuild.buildAction("T1_Tank")
    misckeyactions.SetWeaponPrioritiesHotkey("ACU")
end

function toggleAbilities5()
        local selection = GetSelectedUnits() or nil
    reclaim.ToggleReclaim()
    ForkThread(Claim)
    hotbuild.buildAction("Auxillary")
end

function toggleAbilities6()
    local selection = GetSelectedUnits() or nil
    disperse.DisperseMove()
    if not selection then    
    smart.smartSelect("AIR HIGHALTAIR ANTIAIR -BOMBER -EXPERIMENTAL")
    misckeyactions.SetWeaponPrioritiesHotkey("AntiAir")
    end
end

function toggleAbilities7()
       local selection = GetSelectedUnits() or nil
    misckeyactions.ToggleRepeatBuild()
    hotbuild.buildAction("T1_Engineer")
    hotbuild.buildAction("T1_Tank")
end 

function toggleAbilities8()
        local selection = GetSelectedUnits() or nil
    smart.smartSelect("+inview +idle LAND OVERLAYDIRECTFIRE MOBILE -COMMAND -EXPERIMENTAL")
    misckeyactions.SetWeaponPrioritiesHotkey("Units")
end

function toggleAbilities9()
    local selection = GetSelectedUnits() or nil
    spreadattack.SpreadAttack()
    if not selection then     
        smart.smartSelect("+inview +idle ENGINEER MOBILE -COMMAND -FIELDENGINEER -EXPERIMENTAL")   
        smart.smartSelect("+inview +idle COMMAND")
    end
end
