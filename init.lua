--	
	C = loadfile('config.lua')() -- Config

	S = -- Status
	{
		Connected = false,
		WebServerOn = false
	}

	dofile('script_wifi_init.lua')
