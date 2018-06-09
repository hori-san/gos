
	--[[
		horiCamille.lua
        U can find the script code in Common/Weeknd.lua
        Weeknd is a korean Camille main in NA considered to be one of the best Camille players out there.
        Check out his stream / OP.gg here : 
                                            https://www.twitch.tv/weeknd
                                            http://na.op.gg/summoner/userName=weeknd
	--]]

	if myHero.charName ~= "Camille" then return end

	local open            = io.open 
	local time            = os.time()
	local common      	  = COMMON_PATH
	local save       	  = "ExtW.save"
	local Weeknd          = "Weeknd.lua"
	local Weeknd_url      = "https://raw.githubusercontent.com/hori-san/gos/master/camille/Weeknd.lua"

	local function DownloadFile(url, dir)
		DownloadFileAsync(url, dir, function() end)
		print("Updating | "..Weeknd)
		repeat until FileExist(dir)
	end

	local function UpdateSave()
		local save_file   = open(common..save, "w")
		save_file:write(time)
		save_file:close()
	end

	local function CheckSave()
		local save_file, save_time
		if not FileExist(common..save) then 
			DownloadFile(Weeknd_url, common..Weeknd)
			UpdateSave()
		else
			save_file      = open(common..save)
			save_time      = save_file:read()
			save_file:close()		
			if time - tonumber(save_time) >= 300 then 
				DownloadFile(Weeknd_url, common..Weeknd)
				UpdateSave()
			end
		end
	end

	if not FileExist(common..Weeknd) then 
		DownloadFile(Weeknd_url, common..Weeknd)
	end

	CheckSave()
	require(Weeknd)