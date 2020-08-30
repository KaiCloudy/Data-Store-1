local DS = game:GetService("DataStoreService"):GetDataStore("SaveData")
game.Players.PlayerAdded:Connect(function(plr)
	wait()
	local plrkey = "id_"..plr.userId
	local save1 = plr.leaderstats.[VALUE] -- change value to the name of the int value in leaderstats
	
	local GetSaved = DS:GetAsync(plrkey)
	if GetSaved then
		save1.Value = GetSaved[1]
		--if you have more values/int values than this, copy and paste save1.Value and change save1 to save 2, and make a new variable for your value
		else
		local NumbersForSaving = {save1.Value}
		DS:GetAsync(plrkey, NumbersForSaving)
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	DS:SetAsync("id_"..plr.userId,{plr.leaderstats.[VALUE].Value})
end)
