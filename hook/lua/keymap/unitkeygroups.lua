Order = {
    ["T1Factory"]= {
        "Land_Factory",
        "Air_Factory",
        "Naval_Factory",
        "Quantum_Gateway",
    },
    ["Auxillary"]= {
        "url0306",
        "ual0307",
        "uel0307",
        "xsl0307",
        "xrs0205",
        "xes0205",
    },
    ["Pgen"] = {
        "Energy_Storage",
    },

}

--since we are merging unordered tables that contain ordered tables, we need to merge them manually instead of table.merged or whatever
function MergeTables(unitkeygroups, Order)
    local newKeyGroups = table.copy(Order)
    local newTable = {}
    for k,v in unitkeygroups do
        if Order[k] then
            newTable[k] = table.cat(unitkeygroups[k],Order[k])
            newKeyGroups[k] = nil
        else
            newTable[k] = unitkeygroups[k]
        end
    end
    
    for k,v in newKeyGroups do
        if not newTable[k] then
            newTable[k] = Order[k]
        end
    end
    return newTable
end

unitkeygroups = MergeTables(unitkeygroups, Order)