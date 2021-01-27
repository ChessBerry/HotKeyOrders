local misckeyactions = import('/lua/keymap/misckeyactions.lua')
local orders = import('/lua/ui/game/orders.lua')
local hotbuild = import('/lua/keymap/hotbuild.lua')
local select = import('/lua/ui/game/selection.lua')
local spreadattack = import ('/lua/spreadattack.lua')
local smart = import('/lua/keymap/smartSelection.lua')
local construction = import('/lua/ui/game/construction.lua')
local avatars = import('/lua/ui/game/avatars.lua')
local ping = import('/lua/ui/game/ping.lua')
local disperse = import('/mods/Disperse Move/modules/dispersemove.lua')
local reclaim = import('/lua/ui/game/reclaim.lua')

function toggleAbilities1()
    local selection = GetSelectedUnits() or nil
    if not selection then
        misckeyactions.CycleIdleFactories()
    end
    hotbuild.buildAction("T3_Strategic_Bomber")
    hotbuild.buildAction("T3_Aircraft_Carrier")
    hotbuild.buildAction("T3_Battlecruiser")
    hotbuild.buildAction("Heavy_Artillery_Installation")
    ForkThread(Arty)
end

function Arty()
    WaitSeconds(2)
    hotbuild.buildAction("Artillery_Installation")
end

function toggleAbilities2()
    local selection = GetSelectedUnits() or nil
    hotbuild.buildAction("T1Factory")
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

function Fabricators()
    WaitSeconds(3)
    misckeyactions.toggleScript("Production")
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

function Claim()
    WaitSeconds(6)
    reclaim.ToggleReclaim()
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

function toggleAbilities10()
    local selection = GetSelectedUnits() or nil
    spreadattack.SpreadAttack()
    if not selection then     
    smart.smartSelect("+inview +idle COMMAND")
end
end