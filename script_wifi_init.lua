-- Wireless init script
	if wifi.sta.getip() == nil then
		enduser_setup.start(
			function()
				print('Connected to WiFi as:' .. wifi.sta.getip())

				if wifi.sta.sethostname(C.ProjectName .. '-' .. node.chipid()) == true then
					print('Hostname changed to ' .. C.ProjectName .. '-' .. node.chipid())
				else
					print('wifi: Error while changing hostname')
				end
			end,
			function(Error, String)
				print('enduser_setup: Error #' .. Error .. ': ' .. String)
			end
		)
	end