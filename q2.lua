-- Function to print names of guilds with less than max members
function printSmallGuildNames(memberCount)
    -- Contruct SQL query to select guilds with less than memberCount max members
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount)
    
    
    -- Execute the Sql query and get the result 
    local resultId = db.storageQuery(selectGuildQuery)
    
    -- Check if there is a valid result 
    if resultId ~= 0 then
        -- Loop through each row in the result
        repeat
            -- Get the name of the guild from the current row
            local guildName = result.getString(resultId, "name")

            -- Print the name of the guild
            print(guildName)

            -- Fetch the next row
            resultId = db.storeQueryNext(resultId)
        until not resultId
    else
        -- Print a message if there are no guilds with less than memberCount members
        print("No guilds found with less than " .. memberCount .. " members.")
    end
end
