
	--[[
		horiTF.lua
        U can find the script code in Common/dopa.lua
        Apdo / Dopa is considered to be one of, if not the best league of legends Solo Q player of all times,
        hitting rank 1 on every server he plays on, his main champion is Twisted Fate but he can play
        almost all champions on an insane level. Check out his stream: 
        																http://www.huya.com/90888dopa
        																http://tv.kakao.com/channel/2781080
        																http://play.afreecatv.com/drexpp/201517525
	--]]

	if myHero.charName ~= "TwistedFate" then return end

	local open            = io.open 
	local time            = os.time()
	local common      	  = COMMON_PATH
	local save       	  = "ExtW.save"
	local dopa            = "dopa.lua"
	local dopa_url        = "https://raw.githubusercontent.com/hori-san/gos/master/twistedfate/dopa.lua"

	local function DownloadFile(url, dir)
		DownloadFileAsync(url, dir, function() end)
		print("Updating | dopa.lua")
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
			DownloadFile(dopa_url, common..dopa)
			UpdateSave()
		else
			save_file      = open(common..save)
			save_time      = save_file:read()
			save_file:close()		
			if time - tonumber(save_time) >= 300 then 
				DownloadFile(dopa_url, common..dopa)
				UpdateSave()
			end
		end
	end

	if not FileExist(common..dopa) then 
		DownloadFile(dopa_url, common..dopa)
	end

	CheckSave()
	require("dopa")