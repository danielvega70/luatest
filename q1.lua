-- Function to release player storage
local function releaseStorage(player)
    -- Check if player exists
    if not player then
        print("Error: Player does not exist.")
        return
    end

    -- Set storage value to -1 to release it
    player:setStorageValue(1000, -1)

    -- Log that player's storage has been released
    print("Player's storage (ID: 1000) released successfully.")
end

-- Function executed when player logs out
function onLogout(player)
    -- Check if player exists
    if not player then
        print("Error: Player does not exist.")
        return false
    end

    -- Get player's storage value
    local storageValue = player:getStorageValue(1000)

    -- Check if storage value is equal to 1
    if storageValue == 1 then
        -- Schedule an event to release storage after 1 second
        addEvent(releaseStorage, 1000, player)
        -- Log that storage release event has been scheduled for player
        print("Storage release event scheduled for player.")
    elseif storageValue == -1 then
        -- Log that player's storage is already released
        print("Player's storage is already released.")
    else
        -- Log that player does not have required storage value
        print("Player's storage value is not equal to 1.")
    end

    -- Return true to indicate successful execution of the function
    return true
end
