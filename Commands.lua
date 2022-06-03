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
-- Note: The categories of each unit are listed in it's blueprint ".bp" file

-- Regex to convert the KeyMapper.SetUserKeyAction stuff into a function blueprint
--  *'(hko_hotkey_)(\w*)'.*
--  function $1$2()
--      print("$2")
--  end

-- None of those seem to do anything:
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_SpecialAction'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_SiloBuildTactical'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_SiloBuildNuke'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_CallTransport'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_Invalid'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_Script'})


----------- HKO Helper Functions

-- Feels like there should be a better way to filter the selection table than 
--  "not table.empty(EntityCategoryFilterDown())" but I haven't found one..
function TableBelongsToCategory(categories, selection)
    -- print("TableBelongsToCategory")
    return not table.empty(EntityCategoryFilterDown(categories, selection))
end

----------- HKO Hotkey Overloading Functions
----- 1st keyboard row

function hko_hotkey_w(shift)
    print("w")
    if shift == nil then shift = false end
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory((categories.FACTORY - categories.GATE - categories.EXPERIMENTAL) + (categories.EXPERIMENTAL - categories.NAVAL - categories.AIR), selection) then
        -- t1 engies for all facs and fatboy (but not atlantis or czar)
        print("w fac")
        hotbuild.buildAction("Builders")
    elseif TableBelongsToCategory(categories.GATE, selection) then
        -- Quantum Gates
        print("w gate")
        hbo.buildAction("engi_sacu")
    elseif TableBelongsToCategory(categories.TRANSPORTATION, selection) then
        -- Transports
        print("w transports")
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Transport'})
    else
        -- ACU, Subs and (sera) destros, flyers that can dock
        print("w acu")
        orders.EnterOverchargeMode()
        orders.ToggleDiveOrder()
        orders.Dock(not shift) -- normal dock is .Dock(true), shift dock is .Dock(false) according to keyacctions
    end
end

function hko_hotkey_w_s()
    print("w_s")
    hko_hotkey_w(true)
end

function hko_hotkey_w_a()
    print("w_a")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.STRUCTURE * categories.TECH3, selection) then
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Nuke'}) -- nuke launch
    elseif TableBelongsToCategory(categories.TRANSPORTATION, selection) then
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Ferry'})
    else
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Tactical'}) -- tml launch
    -- TODO: can't find billy nuke function fpr UEF ACU
    -- TODO: can't find deploy function for carriers
    end
end

function hko_hotkey_w_as()
    print("w_as")
    hko_hotkey_w_a()
end

function hko_hotkey_e()
    print("e")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.FACTORY - categories.GATE, selection) then
        hotbuild.buildAction("Sensors")
    elseif TableBelongsToCategory(categories.GATE, selection) then
        hbo.buildAction("ras_sacu")
    else
        hotbuild.buildAction("Builders")
    end
end

function hko_hotkey_e_s()
    print("e_s")
    hko_hotkey_e()
end

function hko_hotkey_r()
    print("r")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.FACTORY - categories.GATE, selection) then
        hotbuild.buildAction("TMD")
    -- elseif TableBelongsToCategory(categories.GATE, selection) then
    --     hbo.buildAction("ras_sacu")
    else
        hotbuild.buildAction("Sensors")
    end
end

function hko_hotkey_r_s()
    print("r_s")
    hko_hotkey_r()
end

function hko_hotkey_r_a()
    print("r_a")
end

function hko_hotkey_r_as()
    print("r_as")
    hko_hotkey_r_a()
end

function hko_hotkey_t()
    print("t")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.FACTORY - categories.GATE, selection) then
        hotbuild.buildAction("XP")
    -- elseif TableBelongsToCategory(categories.GATE, selection) then
    --     hbo.buildAction("ras_sacu")
    else
        hotbuild.buildAction("TMD")
    end
end

function hko_hotkey_t_s()
    print("t_s")
    hko_hotkey_t()
end

function hko_hotkey_y()
    print("y")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.FACTORY - categories.GATE, selection) then
        hotbuild.buildAction("Mobilearty")
    -- elseif TableBelongsToCategory(categories.GATE, selection) then
    --     hbo.buildAction("ras_sacu")
    else
        hotbuild.buildAction("XP")
    end
end

function hko_hotkey_y_s()
    print("y_s")
    hko_hotkey_y()
end

function hko_hotkey_u()
    print("u")
    -- -- the hotbuild.buildAction("Mobilearty") has no structures in it, so we don't need a TableBelongsToCategory for
    -- -- the hotbuild.buildAction("MassFab")
    -- hotbuild.buildAction("MassFab") -- t2 rocket bots in here btw.
end

function hko_hotkey_u_s()
    print("u_s")
    hko_hotkey_u()
end

----- 2nd keyboard row

function hko_hotkey_a()
    print("a")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.STRUCTURE, selection) then
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
    hko_hotkey_s()
end

function hko_hotkey_d()
    print("d")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.STRUCTURE * categories.FACTORY * categories.LAND * categories.SERAPHIM, selection) then
        -- make t1 sera land scout when you press the lab button, so that both d and r make sera scouts
        print("d sera")
        hotbuild.buildAction("Sensors")
    else
        -- use normal hotbuild if you are not a sera factory
        print("d default")
        hotbuild.buildAction("Shields") -- labs in here
    end
end

function hko_hotkey_d_s()
    print("d_s")
    hko_hotkey_d()
end

function hko_hotkey_f()
    print("f")
end

function hko_hotkey_f_s()
    print("f_s")
    hko_hotkey_f()
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
