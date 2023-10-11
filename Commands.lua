-- Define custom hotkey functions, overloading many of the default/mod hotkeys
local misckeyactions = import('/lua/keymap/misckeyactions.lua')
local orders = import('/lua/ui/game/orders.lua')
local hotbuild = import('/lua/keymap/hotbuild.lua')

local CommandMode = import('/lua/ui/game/commandmode.lua')
local hbo = import('/lua/keymap/hotbuild.lua') -- Don't know why HBO is here, but that's where the hotkey in game.prefs links to
local uiparty = import('/mods/UI-Party/modules/unitsplit.lua')
local ui_game_hotkeys = import("/lua/ui/game/hotkeys/context-based-templates.lua")

-- ----------- Mods that don't exist anymore
--local spreadattack = import ('/lua/spreadattack.lua')
--local fafdevtemplates = import("/mods/faf-capping/context-based-templates.lua")

-- ----------- Maybe useful at some point, but currently not required
--local select = import('/lua/ui/game/selection.lua') -- File doesn't exist? Is referenced in the main game's repo too though
--local smart = import('/lua/keymap/smartSelection.lua')
--local construction = import('/lua/ui/game/construction.lua')
--local avatars = import('/lua/ui/game/avatars.lua')
--local ping = import('/lua/ui/game/ping.lua')
--local disperse = import('/mods/Disperse Move/modules/dispersemove.lua')
--local reclaim = import('/lua/ui/game/reclaim.lua')
-- local rui = import('/mods/RUI/hook/lua/ui/game/commandmode.lua')
-- local SimCallbacks = import('/lua/simcallbacks.lua')  -- importing this file doesn't seem to work?
--local core = import('/lua/ui/game/commandmode.lua')
--local Entity = import('/lua/sim/Entity.lua').Entity


-- -- ----------- Sim C++ Functions: --> Doesn't work, no access to those directly as UI mods
-- local sim = import('/engine/Sim.lua')
-- local GetEntityById = sim.GetEntityById
-- -- local GetEntityById = import('/engine/Sim.lua').GetEntityById
-- local IssueClearCommands = sim.IssueClearCommands
-- local IssueGuard = sim.IssueGuard
-- local CheatsEnabled = sim.CheatsEnabled
-- local IssueKillSelf = sim.IssueKillSelf
-- ----------- prob useless:

-- -----------

-- ----------- None of these seem to do anything:
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_SpecialAction'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_SiloBuildTactical'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_SiloBuildNuke'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_CallTransport'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_Invalid'})
-- CommandMode.StartCommandMode('order', {name = 'RULEUCC_Script'})

-- ----------- Other stuff:
-- import('/lua/keymap/hotkeylabels.lua').ResetIdRelations()

-- Seems like there are hotkey labels added in '/lua/ui/game/orders.lua':
-- local hotkeyLabel_addLabel = import('/lua/keymap/hotkeylabelsUI.lua').addLabel

-- ----------- Notes:
-- Regex to convert the KeyMapper.SetUserKeyAction stuff into a function blueprint
--  *'(hko_hotkey_)(\w*)'.*
--  function $1$2()
--      print("$2")
--  end

-- Basically all default hotkeys seem to be listed in '/lua/keymap/keyactions.lua'

-- The categories of each unit are listed in it's blueprint ".bp" file

-- It should be possible to upgrade a t1 factory to t3 by pressing the upgrade button twice, but I can't figure out what
-- commands you need to give the factory to achieve that. See hko_hotkey_a() below.

-- Everything in https://github.com/FAForever/fa/tree/deploy/fafdevelop/engine/Sim.lua is sim-side only, (NOT in UI mids)
-- https://github.com/FAForever/fa/tree/deploy/fafdevelop/engine/User.lua is UI-side only, and 
-- https://github.com/FAForever/fa/tree/deploy/fafdevelop/engine/Core.lua works in both

-- "Keybind labels in build queue" are set in construction.lua

-- Discussion with dragun101 about hints for how to force hotkey labels in the command card:
-- there has to be a function that gets called after the hotkeys are read though, right
-- Dragun101 — Yesterday at 4:26 PM
-- Yeah
-- Cheeseberry — Yesterday at 4:26 PM
-- the function that actually draws the pixels
-- Dragun101 — Yesterday at 4:26 PM
-- That function looks
-- Cheeseberry — Yesterday at 4:26 PM
-- i want that i think
-- Dragun101 — Yesterday at 4:26 PM
-- At every hotkey
-- Then looks at evey hotkey assigned to a unitkeygroup
-- Hotkey or abulity hotkeu
-- Snd assigns/places letter over it
-- Cheeseberry — Yesterday at 4:27 PM
-- I want just that part
-- Dragun101 — Yesterday at 4:27 PM
-- Yesh its possinle
-- Cheeseberry — Yesterday at 4:27 PM
-- you know where in the code that is?
-- Dragun101 — Yesterday at 4:27 PM
-- I know why it does it not how it does it
-- Its in gameview or sometjing
-- Cheeseberry — Yesterday at 4:27 PM
-- thats more than I know though xd
-- Dragun101 — Yesterday at 4:28 PM
-- Its same file as hotbuild.buildaction iirc
-- But no its definetelt possinle but havr to rewrite the function to do so
-- I just don’t know how
-- Cheeseberry — Yesterday at 4:29 PM
-- trial and error it shall be
-- ----------- Locals, maybe needed or smth, idk

-- local EntityCategoryFilterDown = EntityCategoryFilterDown
-- local EntityCategoryContains = EntityCategoryContains

----------- HKO Helper Functions

-- Feels like there should be a better way to filter the selection table than 
--  "not table.empty(EntityCategoryFilterDown())" but I haven't found one..
-- Update: The function I want is probably EntityCategoryContains(category, Escort.UnitBeingBuilt), according to dragun101
function TableBelongsToCategory(categories, selection)
    -- print("TableBelongsToCategory")
    return not table.empty(EntityCategoryFilterDown(categories, selection))
end

----------- Useful globals
-- --- Returns if the unit can build the target unit
-- ---@param blueprintID string
-- ---@return boolean
-- function Unit:CanBuild(blueprintID)
-- end

-- You can get the blueprint from a blueprint name/ide using the global table __blueprints. I.e: 
-- print(__blueprints["zsb9601"].BlueprintId) does print "zsb9601". Note that the look up is case sensitive!

-- repr() turns lua objects, like tables, into human readable strings.
-- reprsl() does the same and also logs it to INFO immediately

----------- HKO Hotkey Overloading Functions

----- Number keyboard row

function hko_hotkey_1()
    -- print("r")
    uiparty.SelectNextGroup()
end

function hko_hotkey_1_s()
    -- print("1_s")
    hko_hotkey_1()
end

function hko_hotkey_1_a()
    -- print("1_a")
    uiparty.SelectNextGroup()
end

function hko_hotkey_1_as()
    -- print("1_as")
    hko_hotkey_1_a()
end

function hko_hotkey_2()
    -- print("r")
    misckeyactions.GetNearestIdleEngineerNotACU()
end

function hko_hotkey_2_s()
    -- print("1_s")
    hko_hotkey_2()
end

function hko_hotkey_2_a()
    -- print("1_a")
    misckeyactions.GetNearestIdleEngineerNotACU()
end

function hko_hotkey_2_as()
    -- print("1_as")
    hko_hotkey_2_a()
end

function hko_hotkey_3()
    -- print("r")
end

function hko_hotkey_3_s()
    -- print("1_s")
    hko_hotkey_3()
end

function hko_hotkey_3_a()
    -- print("1_a")
end

function hko_hotkey_3_as()
    -- print("1_as")
    hko_hotkey_3_a()
end

function hko_hotkey_4()
    -- print("r")
end

function hko_hotkey_4_s()
    -- print("1_s")
    hko_hotkey_4()
end

function hko_hotkey_4_a()
    -- print("1_a")
end

function hko_hotkey_4_as()
    -- print("1_as")
    hko_hotkey_4_a()
end

function hko_hotkey_5()
    -- print("r")
end

function hko_hotkey_5_s()
    -- print("1_s")
    hko_hotkey_5()
end

function hko_hotkey_5_a()
    -- print("1_a")
end

function hko_hotkey_5_as()
    -- print("1_as")
    hko_hotkey_5_a()
end

function hko_hotkey_6()
    -- print("r")
end

function hko_hotkey_6_s()
    -- print("1_s")
    hko_hotkey_6()
end

function hko_hotkey_6_a()
    -- print("1_a")
end

function hko_hotkey_6_as()
    -- print("1_as")
    hko_hotkey_6_a()
end

function hko_hotkey_7()
    -- print("r")
end

function hko_hotkey_7_s()
    -- print("1_s")
    hko_hotkey_7()
end

function hko_hotkey_7_a()
    -- print("1_a")
end

function hko_hotkey_7_as()
    -- print("1_as")
    hko_hotkey_7_a()
end

function hko_hotkey_8()
    -- print("r")
end

function hko_hotkey_8_s()
    -- print("1_s")
    hko_hotkey_8()
end

function hko_hotkey_8_a()
    -- print("1_a")
end

function hko_hotkey_8_as()
    -- print("1_as")
    hko_hotkey_8_a()
end

function hko_hotkey_9()
    -- print("r")
end

function hko_hotkey_9_s()
    -- print("1_s")
    hko_hotkey_9()
end

function hko_hotkey_9_a()
    -- print("1_a")
end

function hko_hotkey_9_as()
    -- print("1_as")
    hko_hotkey_9_a()
end

function hko_hotkey_0()
    -- print("r")
end

function hko_hotkey_0_s()
    -- print("1_s")
    hko_hotkey_0()
end

function hko_hotkey_0_a()
    -- print("1_a")
end

function hko_hotkey_0_as()
    -- print("1_as")
    hko_hotkey_0_a()
end


----- 1st keyboard row

function hko_hotkey_w(shift)
    -- print("w")
    if shift == nil then shift = false end
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory((categories.FACTORY - categories.GATE - categories.EXPERIMENTAL) + (categories.EXPERIMENTAL - categories.NAVAL - categories.AIR), selection) then
        -- t1 engies for all facs and fatboy (but not atlantis or czar)
        -- print("w fac")
        hotbuild.buildAction("Builders")
    elseif TableBelongsToCategory(categories.GATE, selection) then
        -- Quantum Gates
        -- print("w gate")
        hbo.buildAction("engi_sacu")
    elseif TableBelongsToCategory(categories.TRANSPORTATION + categories.CARRIER, selection) then
        -- Transports
        -- print("w transports")
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Transport'}) -- transport and deploy
    else
        -- ACU, Subs and (sera) destros, flyers that can dock
        -- print("w acu")
        orders.EnterOverchargeMode()
        orders.ToggleDiveOrder()
        orders.Dock(not shift) -- normal dock is .Dock(true), shift dock is .Dock(false) according to keyacctions
    end
end

function hko_hotkey_w_s()
    -- print("w_s")
    hko_hotkey_w(true)
end

function hko_hotkey_w_a()
    -- print("w_a")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.STRUCTURE * categories.TECH3, selection) then
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Nuke'}) -- nuke and billy nuke launch
    elseif TableBelongsToCategory(categories.TRANSPORTATION, selection) then
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Ferry'})
    else
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Tactical'}) -- tml launch
        -- CommandMode.StartCommandMode('order', {name = 'RULEUCC_Nuke'}) -- nuke and billy nuke launch
    end
end

function hko_hotkey_w_as()
    -- print("w_as")
    hko_hotkey_w_a()
end

function hko_hotkey_e()
    -- print("e")
    local selection = GetSelectedUnits() or nil
    reprsl(selection)
    if TableBelongsToCategory(categories.FACTORY - categories.GATE, selection) then
        hotbuild.buildAction("Sensors")
    elseif TableBelongsToCategory(categories.GATE, selection) then
        hbo.buildAction("ras_sacu")
    else
        hotbuild.buildAction("Builders")
    end
end

function hko_hotkey_e_s()
    -- print("e_s")
    hko_hotkey_e()
end

function hko_hotkey_r()
    -- print("r")
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
    -- print("r_s")
    hko_hotkey_r()
end

function hko_hotkey_r_a()
    -- print("r_a")
end

function hko_hotkey_r_as()
    -- print("r_as")
    hko_hotkey_r_a()
end

function hko_hotkey_t()
    -- print("t")
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
    -- print("t_s")
    hko_hotkey_t()
end

function hko_hotkey_y()
    -- print("y")
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
    -- print("y_s")
    hko_hotkey_y()
end

function hko_hotkey_u()
    -- print("u")
    -- -- the hotbuild.buildAction("Mobilearty") has no structures in it, so we don't need a TableBelongsToCategory for
    -- -- the hotbuild.buildAction("MassFab")
    -- hotbuild.buildAction("MassFab") -- t2 rocket bots in here btw.
end

function hko_hotkey_u_s()
    -- print("u_s")
    hko_hotkey_u()
end

----- 2nd keyboard row

function hko_hotkey_a()
    -- print("a")
    -- print(__blueprints)
    -- print(__blueprints["zsb9601"])
    -- print(__blueprints["zsb9601"].BlueprintId)
    local selection = GetSelectedUnits() or nil
    -- if TableBelongsToCategory(categories.STRUCTURE * categories.FACTORY, selection) then
    --     local availableOrders, availableToggles, buildableCategories = GetUnitCommandData(selection)
    --     print("a1")
    --     -- hotbuild.buildAction("T3_Support_Factory")
    --     -- hotbuild.buildActionUnit("T3_Support_Factory")
    --     -- hotbuild.buildActionBuilding("T3_Support_Factory")
    --     -- hotbuild.buildAction("Upgrades")
    --     -- hotbuild.buildAction("UEB0301")
    --     -- IssueBlueprintCommand

    --     -- The below actually works for the sera land factory!
    --     if EntityCategoryContains(buildableCategories, "ZSB9601") then
    --         IssueBlueprintCommand("UNITCOMMAND_Upgrade", "ZSB9601", 1, false)
    --     elseif EntityCategoryContains(buildableCategories, "ZSB9501") then
    --         IssueBlueprintCommand("UNITCOMMAND_Upgrade", "ZSB9501", 1, false)
    --     elseif EntityCategoryContains(buildableCategories, "XSB0301") then
    --         IssueBlueprintCommand("UNITCOMMAND_Upgrade", "XSB0301", 1, false)
    --     elseif EntityCategoryContains(buildableCategories, "XSB0201") then
    --         IssueBlueprintCommand("UNITCOMMAND_Upgrade", "XSB0201", 1, false)
    --     else
    --         print("well that failed")
    --     end

    --     -- hotbuild.buildAction("Upgrades")
    --     -- hotbuild.buildActionUpgrade()
    -- -- elseif TableBelongsToCategory(categories.STRUCTURE - categories.ENGINEER, selection) then
    -- end
    if TableBelongsToCategory(categories.STRUCTURE - categories.ENGINEER, selection) then
        -- Only structures can upgrade, but for the hive (XRB0104, XRB0204, XRB0304), the only structure that's also an
        -- engineer, we prefer to have reclaim over upgrade, as the former might need to be used in a panic to reclaim
        -- enemy units or something.
        -- print("a2")
        -- print(GetUnitBlueprintByName("zsb9601"))
        -- print(GetUnitBlueprintByName("zsb9601").BlueprintId)
        hotbuild.buildAction("Upgrades")
        -- hotbuild.buildActionUpgrade()
    else
        -- print("a3")
        -- CommandMode.EasyReclaim() -- depricated with patch 3745
        CommandMode.StartCommandMode('order', {name = 'RULEUCC_Reclaim'}) --reclaim
    end
end

function hko_hotkey_a_s()
    -- print("a_s")
    hko_hotkey_a()
end

function hko_hotkey_s()
    -- print("s")
end

function hko_hotkey_s_s()
    -- print("s_s")
    hko_hotkey_s()
end

function hko_hotkey_d()
    -- print("d")
    local selection = GetSelectedUnits() or nil
    if TableBelongsToCategory(categories.STRUCTURE * categories.FACTORY * categories.LAND * categories.SERAPHIM, selection) then
        -- make t1 sera land scout when you press the lab button, so that both d and r make sera scouts
        -- print("d sera")
        hotbuild.buildAction("Sensors")
    else
        -- use normal hotbuild if you are not a sera factory
        -- print("d default")
        hotbuild.buildAction("Shields") -- labs in here
    end
end

function hko_hotkey_d_s()
    -- print("d_s")
    hko_hotkey_d()
end

function hko_hotkey_f()
    -- print("f")
end

function hko_hotkey_f_s()
    -- print("f_s")
    hko_hotkey_f()
end

function hko_hotkey_g()
    --print("g")

    -- This functino should switch between non-context sensitive and context sensitive templates at some point, but for
    -- now it just uses the default hotbuild templates because I haven't added my own templates to the context sensitive
    -- templates yet.
    hotbuild.buildAction("Templates")

    --local selection = GetSelectedUnits() or nil
    --if TableBelongsToCategory(categories.FACTORY, selection) then
    --    -- use default hotbuild when you have a factory selected
    --    hotbuild.buildAction("Templates")
    --else
    --    -- use the new context based templates when you don't have a factory selected
    --    ui_game_hotkeys.Cycle()
    --end
end

function hko_hotkey_g_s()
     --print("g_s")
    hko_hotkey_g()
end

-- -- Sim Callback for the hko_hotkey_filter_highest_engineer_and_assist function below
-- function manual_sim_callback_for_hotkey_filter_highest_engineer_and_assist(target, selection)

--     -- reprsl(data)
--     reprsl(SimCallback)
--     -- reprsl(selection)
--     if selection then

--         local noACU = EntityCategoryFilterDown(categories.ALLUNITS - categories.COMMAND, selection)

--         -- local target = sim.GetEntityById(data.TargetId)
--         -- target = data.Target
--         -- reprsl(noACU)
--         reprsl(target)
--         CheatsEnabled()
--         reprsl(CheatsEnabled())
--         IssueKillSelf(target)
--         -- IssueClearCommands(noACU)
--         -- SimCallback({Func= 'ClearCommands', Args = {units = noACU}}, true)
--         IssueGuard(noACU, target)
--     end
-- end

-- function hko_hotkey_filter_highest_engineer_and_assist()
--     -- print("space_c")
--     -- It's the same command that was in the main faf branch for a bit and then got removed for reasons I don't quite 
--     -- understand. Code for the hotkey taken from here: 
--     -- https://github.com/FAForever/fa/commit/26f4a01e3b98e9fb48d65d8397a2d6d188382e01
    
--     local selection = GetSelectedUnits() or nil

--     if selection then

--         local tech1 = EntityCategoryFilterDown(categories.TECH1 - categories.COMMAND, selection)
--         local tech2 = EntityCategoryFilterDown(categories.TECH2 - categories.COMMAND, selection)
--         local tech3 = EntityCategoryFilterDown(categories.TECH3 - categories.COMMAND, selection)
--         local sACUs = EntityCategoryFilterDown(categories.SUBCOMMANDER - categories.COMMAND, selection)

--         if next(sACUs) then
--             -- SimCallback({Func= 'SelectHighestEngineerAndAssist', Args = { TargetId = sACUs[1]:GetEntityId() }}, true)
--             manual_sim_callback_for_hotkey_filter_highest_engineer_and_assist(sACUs[1], selection)
--             SelectUnits({sACUs[1]})
--         elseif next(tech3) then
--             -- SimCallback({Func= 'SelectHighestEngineerAndAssist', Args = { TargetId = tech3[1]:GetEntityId() }}, true)
--             manual_sim_callback_for_hotkey_filter_highest_engineer_and_assist(tech3[1], selection)
--             SelectUnits({tech3[1]})
--         elseif next(tech2) then
--             -- SimCallback({Func= 'SelectHighestEngineerAndAssist', Args = { TargetId = tech2[1]:GetEntityId() }}, true)
--             manual_sim_callback_for_hotkey_filter_highest_engineer_and_assist(tech2[1], selection)
--             SelectUnits({tech2[1]})
--         else
--             -- do nothing
--         end
--     end
-- end

-- function hko_hotkey_filter_highest_engineer_and_assist()
--     local selection = GetSelectedUnits()

--     reprsl("hko_hotkey_filter_highest_engineer_and_assist")
--     -- import('/lua/effectutilities.lua')
--     -- import('/lua/sim/prop.lua')
--     -- import('/lua/wreckage.lua')
--     -- import('/lua/simutils.lua')
--     -- local SimCallbacks = import('/lua/simcallbacks.lua')
    
--     if selection then

--         local tech1 = EntityCategoryFilterDown(categories.TECH1 - categories.COMMAND, selection)
--         local tech2 = EntityCategoryFilterDown(categories.TECH2 - categories.COMMAND, selection)
--         local tech3 = EntityCategoryFilterDown(categories.TECH3 - categories.COMMAND, selection)
--         local sACUs = EntityCategoryFilterDown(categories.SUBCOMMANDER - categories.COMMAND, selection)

--         if next(sACUs) then
--             SimCallback({Func= 'SelectHighestEngineerAndAssist', Args = { TargetId = sACUs[1]:GetEntityId() }}, true)
--             SelectUnits({sACUs[1]})
--         elseif next(tech3) then
--             SimCallback({Func= 'SelectHighestEngineerAndAssist', Args = { TargetId = tech3[1]:GetEntityId() }}, true)
--             SelectUnits({tech3[1]})
--         elseif next(tech2) then
--             SimCallback({Func= 'SelectHighestEngineerAndAssist', Args = { TargetId = tech2[1]:GetEntityId() }}, true)
--             SelectUnits({tech2[1]})
--         else
--             -- do nothing
--         end
--     end
-- end

function hko_hotkey_filter_highest_engineers()
    -- It's the same command that was in the main faf branch for a bit and then got removed for reasons I don't quite 
    -- understand. Code for the hotkey taken from here: 
    -- https://github.com/FAForever/fa/commit/26f4a01e3b98e9fb48d65d8397a2d6d188382e01
    
    local selection = GetSelectedUnits()

    if selection then

        local tech1 = EntityCategoryFilterDown(categories.TECH1 - categories.COMMAND, selection)
        local tech2 = EntityCategoryFilterDown(categories.TECH2 - categories.COMMAND, selection)
        -- local tech3 = EntityCategoryFilterDown(categories.TECH3 - categories.COMMAND, selection)
        -- local sACUs = EntityCategoryFilterDown(categories.SUBCOMMANDER - categories.COMMAND, selection)
        local tech3_and_sACUs = EntityCategoryFilterDown((categories.SUBCOMMANDER + categories.TECH3) - categories.COMMAND, selection)
        
        if next(tech3_and_sACUs) then
            SelectUnits(tech3_and_sACUs)
        elseif next(tech2) then
            SelectUnits(tech2)
        elseif next(tech1) then
            SelectUnits(tech1)
        else
            -- do nothing
        end
    end
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
