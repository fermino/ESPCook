	-- Proteger tablas contra escritura (tipo constantes)
	-- http://andrejs-cainikovs.blogspot.com.ar/2009/05/lua-constants.html
	function _protect(tbl)
		return setmetatable({}, {
			__index = tbl,
			__newindex = function(t, key, value)
				error("attempting to change constant " ..
					   tostring(key) .. " to " .. tostring(value), 2)
			end
		})
	end

	--[[ En lugar de asignar las cadenas correspondientes a cada "constante", 
		 creamos una funcion para convertir el resultado de type(x) y compararlo
		 con las constantes. Esto para ahorrar memoria en el MCU, ya que por cada
		 set de instrucciones se copian en memoria varias veces estas definiciones. 
		]]

	TYPE = _protect(
	{
		NIL = 1,
		BOOLEAN = 2,
		NUMBER = 3,
		STRING = 4,
		USERDATA = 5,
		FUNCTION = 6,
		THREAD = 7,
		TABLE = 8,

		_ = function(Type)
			if Type == 'nil' then
				return TYPE.NIL
			elseif Type == 'boolean' then
				return TYPE.BOOLEAN
			elseif Type == 'number' then
				return TYPE.NUMBER
			elseif Type == 'string' then
				return TYPE.STRING
			elseif Type == 'userdata' then
				return TYPE.USERDATA
			elseif Type == 'function' then
				return TYPE.FUNCTION
			elseif Type == 'thread' then
				return TYPE.THREAD
			elseif Type == 'table' then
				return TYPE.TABLE
			else
				return nil
			end
		end
	})