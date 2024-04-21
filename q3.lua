-- Function to remove a member from a player's party
function removeMemberFromPlayerParty(playerId, memberName)
    -- Get the player object using the playerId
    local player = Player(playerId)

    -- Check if the player object exists
    if player then
        -- Get the player's party
        local party = player:getParty()

        -- Check if the player is in a party
        if party then
            -- Iterate over each member in the party
            for _, member in pairs(party:getMembers()) do
                -- Check if the member's name matches the specified memberName
                if member == memberName then
                    -- Remove the member from the party
                    party:removeMember(member)
                    print("Member '" .. memberName .. "' removed from the party.")
                    return
                end
            end
            print("Member '" .. memberName .. "' not found in the party.")
        else
            -- Print a message if the player is not in a party
            print("Player is not in a party.")
        end
    else
        -- Print a message if the player object does not exist
        print("Player not found.")
    end
end
