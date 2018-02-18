local alerter = {}

local Warn1 = 0
local Warn2 = 0
local Warn3 = 0

local Hour = 06 -- in 24-Hour-Format
local Min = 22

function alerter.check(hour, minute, alert, Message)

	hour = hour or 0 -- No Nil
	minute = minute or 0
	
	local currHour = tonumber(os.date("%H"))
	local currMin = tonumber(os.date("%M"))
	
	-- Time has reached
	if(currHour == hour and currMin == minute) then
		if(alert == 0) then
			minetest.chat_send_all(Message) -- Writes the Message
			alert = alert + 1 -- only 1 time.

		end -- if(counter ==)
		
	else
		alert = 0 -- Reset's the Counter
		
	end  -- if(currHour ==)
	
	return alert

end -- check()

--[[

	Register the Global Function, if the Time has reached, the Text will send to all Player in MT.
	
	Alertcounter = alerter.check(Hour, Minute, Alertcounter, Message)
	
	You can register so much Alerts as you want, but you need a local Counter for an Alert.
	
]]--

minetest.register_globalstep(function(dtime)
	Warn1 = alerter.check(Hour, Min, Warn1, "Attention, Server will Shutdown for Backup in 3 Minutes.")

end)

minetest.register_globalstep(function(dtime)
	Warn2 = alerter.check(Hour, Min + 1, Warn2, "Attention, Server will Shutdown for Backup in 2 Minute.")

end)

minetest.register_globalstep(function(dtime)
	Warn3 = alerter.check(Hour, Min + 2, Warn3, "Attention, Server will Shutdown for Backup in 1 Minute.")

end)
 